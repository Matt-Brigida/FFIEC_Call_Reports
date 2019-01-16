
## Load Libraries

library(xts)
library(rDEA)
## load("20170630_DEA_output_model_robust.RData")

## Get Data and Filter

### get data----

panel <- readRDS("../../build_panel/full_panel.rds")

## filter data-----

panel <- panel[panel$cost_of_funds < .3, ]

### panel for model

panel <- panel[c("quarter", "cost_of_funds", "total_assets", "ROA", "t1_leverage_ratio", "t1_RBCR_ratio", "african_am_ind", "hispanic_ind")]

panel <- panel[complete.cases(panel), ]

## create panels for particular quarters----

panel <- panel[panel$quarter == 20170331, ]

## ROA Output, T1 Leverage Ratio Input

### create inputs and outputs for each quarter------

inputs <- panel[c("cost_of_funds", "total_assets", "t1_leverage_ratio")]

outputs <- panel[c("ROA")]


### Results *Output Focused*

dea_estimate <- dea.robust(X = inputs, Y = outputs, model = "output")

## theta_hat
th1 <- data.frame(cbind(dea_estimate$theta_hat, panel$african_am_ind, panel$hispanic_ind))
names(th1) <- c("theta_hat", "aa_ind", "h_ind")

### African American-----
theta_hat_not_aa <- th1[th1$aa_ind == 0, ][,1]
theta_hat_not_aa[is.infinite(theta_hat_not_aa)] <- NA
theta_hat_aa <- th1[th1$aa_ind == 1, ][,1]
theta_hat_aa[is.infinite(theta_hat_aa)] <- NA

t.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE)
## 	Welch Two Sample t-test

## data:  theta_hat_aa and theta_hat_not_aa
## t = 1.0198, df = 22.005, p-value = 0.3189
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -7.610824 22.338067
## sample estimates:
## mean of x mean of y 
## 7.6408916 0.2772703

ks.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE)

## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_aa and theta_hat_not_aa
## D = 0.24575, p-value = 0.1257
## alternative hypothesis: two-sided

## Warning message:
## In ks.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE) :
##   p-value will be approximate in the presence of ties



## theta_hat_hat (unbiased)
thh1 <- data.frame(cbind(dea_estimate$theta_hat_hat, panel$african_am_ind, panel$hispanic_ind))
names(thh1) <- c("theta_hat_hat", "aa_ind", "h_ind")
theta_hat_hat_not_aa <- thh1[thh1$aa_ind == 0, ][,1]
theta_hat_hat_not_aa[is.infinite(theta_hat_hat_not_aa)] <- NA
theta_hat_hat_aa <- thh1[thh1$aa_ind == 1, ][,1]
theta_hat_hat_aa[is.infinite(theta_hat_hat_aa)] <- NA

t.test(theta_hat_hat_aa, theta_hat_hat_not_aa, na.rm = TRUE)
## 	Welch Two Sample t-test

## data:  theta_hat_hat_aa and theta_hat_hat_not_aa
## t = -0.92346, df = 17.01, p-value = 0.3687
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -34.09919  13.33597
## sample estimates:
##   mean of x   mean of y 
## -11.2379196  -0.8563117 

ks.test(theta_hat_hat_aa, theta_hat_hat_not_aa, na.rm = TRUE)
## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_hat_aa and theta_hat_hat_not_aa
## D = 0.28713, p-value = 0.1038
## alternative hypothesis: two-sided


### Hispanic -----------------------------------------

## theta_hat
th2 <- data.frame(cbind(dea_estimate$theta_hat, panel$african_am_ind, panel$hispanic_ind))
names(th2) <- c("theta_hat", "aa_ind", "h_ind")
theta_hat_not_h <- th2[th2$h_ind == 0, ][,1]
theta_hat_not_h[is.infinite(theta_hat_not_h)] <- NA
theta_hat_h <- th2[th2$h_ind == 1, ][,1]
theta_hat_h[is.infinite(theta_hat_h)] <- NA

t.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE)
## 	Welch Two Sample t-test

## data:  theta_hat_h and theta_hat_not_h
## t = -3.5927, df = 5719.2, p-value = 0.0003301
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.4595172 -0.1350726
## sample estimates:
##  mean of x  mean of y 
## 0.01137054 0.30866546 

ks.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE)
## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_h and theta_hat_not_h
## D = 0.31038, p-value = 0.002456
## alternative hypothesis: two-sided

## Warning message:
## In ks.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE) :
##   p-value will be approximate in the presence of ties

### theta_hat_hat (unbiased)
thh2 <- data.frame(cbind(dea_estimate$theta_hat_hat, panel$african_am_ind, panel$hispanic_ind))
names(thh2) <- c("theta_hat_hat", "aa_ind", "h_ind")
theta_hat_hat_not_h <- thh2[thh2$h_ind == 0, ][,1]
theta_hat_hat_not_h[is.infinite(theta_hat_hat_not_h)] <- NA
theta_hat_hat_h <- thh2[thh2$h_ind == 1, ][,1]
theta_hat_hat_h[is.infinite(theta_hat_hat_h)] <- NA

t.test(theta_hat_hat_h, theta_hat_hat_not_h, na.rm = TRUE)
## 	Welch Two Sample t-test

## data:  theta_hat_hat_h and theta_hat_hat_not_h
## t = 4.6397, df = 5504.8, p-value = 3.57e-06
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  0.5176244 1.2750877
## sample estimates:
##     mean of x     mean of y 
##  0.0008052725 -0.8955507788 

ks.test(theta_hat_hat_h, theta_hat_hat_not_h, na.rm = TRUE)
## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_hat_h and theta_hat_hat_not_h
## D = 0.2828, p-value = 0.00899
## alternative hypothesis: two-sided
