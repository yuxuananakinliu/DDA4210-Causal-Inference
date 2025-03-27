library(tidyverse)
library(vars)
library(aod)
library(forecast)

#################################################################################################################################
# TODA-YAMAMOTO CAUSALITY TEST ----
# Function to implement the Toda and Yamamoto version of Granger causality test.
# Toda, H. Y., & Yamamoto, T. (1995). Statistical inference in vector autoregressions with possibly integrated processes. 
# Journal of econometrics, 66(1-2), 225-250.

toda.yamamoto <- function(var.model, test = c("kpss","adf","pp")) {
  ty.df <- data.frame(var.model$y)
  ty.varnames <- colnames(ty.df)
  
  # estimates the number of first differences d_max required to make a given time series stationary. 
  d.max <- max(sapply(ty.df, function(x) forecast::ndiffs(x, test = test)))
  
  # k + d_max according to Toda & Yamamoto (1995)
  ty.lags <- var.model$p + d.max
  ty.augmented_var <- vars::VAR(ty.df, ty.lags, type=var.model$type)
  
  ty.results <- data.frame(cause = character(0), 
                           effect = character(0), 
                           chisq = numeric(0), 
                           pvalue = numeric(0))
  
  
  for (k in 1:length(ty.varnames)) {
    for (j in 1:length(ty.varnames)) {
      if (k != j){
        
        # coefficients to test, ignoring the d_max lags
        ty.coefres <- head(grep(ty.varnames[j], 
                                setdiff(colnames(ty.augmented_var$datamat), 
                                        colnames(ty.augmented_var$y))))
        
        wald.res <- wald.test(b=coef(ty.augmented_var$varresult[[k]]), 
                              Sigma=vcov(ty.augmented_var$varresult[[k]]),
                              Terms = ty.coefres) 
        
        ty.results <- rbind(ty.results, data.frame(
          cause = ty.varnames[j], 
          effect = ty.varnames[k], 
          chisq = as.numeric(wald.res$result$chi2[1]),
          pvalue = as.numeric(wald.res$result$chi2[3]))
        )
      }
    }
  }
  return(ty.results)
}
#################################################################################################################################

#Load data
data <- read.csv("processed_data.csv")
#Adjust Date format
data.index = data[,1]
data <- data[,-c(1)]

#Set up VAR-Model
#select lag order, either 2 or 6
VARselect(data, lag.max = 10, type = c("const", "trend", "both", "none"),
          season = NULL, exogen = NULL)

V.6 <- VAR(data, type="both",p = 6)

#Alternative stability analyis
plot(stability(V.6)) ## looks fine
# Model with p=6 is less likely to be serially correlated. Thus model with p=6 is selected.

# Toda-Yamamoto test with the VAR model
a = toda.yamamoto(V.6)
write.table(a,"causal effect.csv",row.names=FALSE,col.names=TRUE,sep=",")
