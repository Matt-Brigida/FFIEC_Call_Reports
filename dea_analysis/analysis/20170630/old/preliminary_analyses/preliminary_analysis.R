# ---
# title: "Data Envelopment Analysis: MDIs"
# date: "January 15, 2019"
# output:
#   rmdformats::html_clean:
#     highlight: kate
# ---
#
# ```{r knitr_init, echo=FALSE, cache=FALSE}
# library(knitr)
# library(rmdformats)
#
# ## Global options
# options(max.print="75")
# opts_chunk$set(echo=FALSE,
# 	             cache=TRUE,
#                prompt=FALSE,
#                tidy=TRUE,
#                comment=NA,
#                message=FALSE,
#                warning=FALSE)
# opts_knit$set(width=75)
# ```

## Load Libraries

library(xts)
library(rDEA)
load("20170630_DEA_output_model_robust.RData")

## Get Data and Filter

### get data----

panel <- readRDS("../build_panel/full_panel.rds")

## filter data-----

panel <- panel[panel$cost_of_funds < .3, ]

### panel for model

panel <- panel[c("quarter", "cost_of_funds", "total_assets", "ROA", "t1_leverage_ratio", "t1_RBCR_ratio", "african_am_ind", "hispanic_ind")]

panel <- panel[complete.cases(panel), ]

## create panels for particular quarters----

panel_20170630 <- panel[panel$quarter == 20170630, ]
panel_20010331 <- panel[panel$quarter == 20010331, ]

## ROA Output, T1 Leverage Ratio Input

### create inputs and outputs for each quarter------

inputs_20010331 <- panel_20010331[c("cost_of_funds", "total_assets", "t1_leverage_ratio")]

outputs_20010331 <- panel_20010331[c("ROA")]


inputs_20170630 <- panel_20170630[c("cost_of_funds", "total_assets", "t1_leverage_ratio")]

outputs_20170630 <- panel_20170630[c("ROA")]

### Results Output Focused 20010331

est1 <- dea.robust(X = inputs_20010331, Y = outputs_20010331, model = "output")

## theta_hat
th1 <- data.frame(cbind(est1$theta_hat, panel_20010331$african_am_ind, panel_20010331$hispanic_ind))
names(th1) <- c("theta_hat", "aa_ind", "h_ind")

### African American-----
theta_hat_not_aa <- th1[th1$aa_ind == 0, ][,1]
theta_hat_not_aa[is.infinite(theta_hat_not_aa)] <- NA
theta_hat_aa <- th1[th1$aa_ind == 1, ][,1]
theta_hat_aa[is.infinite(theta_hat_aa)] <- NA

if(dim(theta_hat_aa)[1] > 3){
t.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE)
}

## theta_hat_hat (unbiased)
thh1 <- data.frame(cbind(est1$theta_hat_hat, panel_20010331$african_am_ind, panel_20010331$hispanic_ind))
names(thh1) <- c("theta_hat_hat", "aa_ind", "h_ind")
theta_hat_hat_not_aa <- thh1[thh1$aa_ind == 0, ][,1]
theta_hat_hat_not_aa[is.infinite(theta_hat_hat_not_aa)] <- NA
theta_hat_hat_aa <- thh1[thh1$aa_ind == 1, ][,1]
theta_hat_hat_aa[is.infinite(theta_hat_hat_aa)] <- NA

if(dim(theta_hat_aa)[1] > 3){
t.test(theta_hat_hat_aa, theta_hat_hat_not_aa, na.rm = TRUE)
}



### Results Output Focused 20170630

est2 <- dea.robust(X = inputs_20170630, Y = outputs_20170630, model = "output")

### African American-----

## theta_hat
th2 <- data.frame(cbind(est2$theta_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(th2) <- c("theta_hat", "aa_ind", "h_ind")
theta_hat_not_aa <- th2[th2$aa_ind == 0, ][,1]
theta_hat_not_aa[is.infinite(theta_hat_not_aa)] <- NA
theta_hat_aa <- th2[th2$aa_ind == 1, ][,1]
theta_hat_aa[is.infinite(theta_hat_aa)] <- NA

t.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE)

## 	Welch Two Sample t-test

## data:  theta_hat_aa and theta_hat_not_aa
## t = 1.2311, df = 23.003, p-value = 0.2307
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -2.400315  9.456412
## sample estimates:
## mean of x mean of y
## 3.6438363 0.1157882

ks.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE)

## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_aa and theta_hat_not_aa
## D = 0.41856, p-value = 0.0004617
## alternative hypothesis: two-sided

## Warning message:
## In ks.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE) :
##   p-value will be approximate in the presence of ties


### theta_hat_hat (unbiased)
thh2 <- data.frame(cbind(est2$theta_hat_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(thh2) <- c("theta_hat_hat", "aa_ind", "h_ind")
theta_hat_hat_not_aa <- thh2[thh2$aa_ind == 0, ][,1]
theta_hat_hat_not_aa[is.infinite(theta_hat_hat_not_aa)] <- NA
theta_hat_hat_aa <- thh2[thh2$aa_ind == 1, ][,1]
theta_hat_hat_aa[is.infinite(theta_hat_hat_aa)] <- NA

t.test(theta_hat_hat_aa, theta_hat_hat_not_aa, na.rm = TRUE)


## 	Welch Two Sample t-test

## data:  theta_hat_hat_aa and theta_hat_hat_not_aa
## t = 5.5804, df = 5491.4, p-value = 2.515e-08
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  0.5279456 1.0997581
## sample estimates:
##    mean of x    mean of y
##  0.003660349 -0.810191492

ks.test(theta_hat_hat_aa, theta_hat_hat_not_aa, na.rm = TRUE)

## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_hat_aa and theta_hat_hat_not_aa
## D = 0.38083, p-value = 0.04647
## alternative hypothesis: two-sided




### Hispanic -------

## theta_hat
th2 <- data.frame(cbind(est2$theta_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(th2) <- c("theta_hat", "aa_ind", "h_ind")
theta_hat_not_h <- th2[th2$h_ind == 0, ][,1]
theta_hat_not_h[is.infinite(theta_hat_not_h)] <- NA
theta_hat_h <- th2[th2$h_ind == 1, ][,1]
theta_hat_h[is.infinite(theta_hat_h)] <- NA

t.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE)

## 	Welch Two Sample t-test

## data:  theta_hat_h and theta_hat_not_h
## t = -4.6888, df = 5662.2, p-value = 2.813e-06
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -0.17336749 -0.07113919
## sample estimates:
##   mean of x   mean of y 
## 0.009192629 0.131445969 


ks.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE)

## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_h and theta_hat_not_h
## D = 0.30332, p-value = 0.003321
## alternative hypothesis: two-sided

## Warning message:
## In ks.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE) :
##   p-value will be approximate in the presence of ties

### theta_hat_hat (unbiased)
thh2 <- data.frame(cbind(est2$theta_hat_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(thh2) <- c("theta_hat_hat", "aa_ind", "h_ind")
theta_hat_hat_not_h <- thh2[thh2$h_ind == 0, ][,1]
theta_hat_hat_not_h[is.infinite(theta_hat_hat_not_h)] <- NA
theta_hat_hat_h <- thh2[thh2$h_ind == 1, ][,1]
theta_hat_hat_h[is.infinite(theta_hat_hat_h)] <- NA

t.test(theta_hat_hat_h, theta_hat_hat_not_h, na.rm = TRUE)
## 	Welch Two Sample t-test

## data:  theta_hat_hat_h and theta_hat_hat_not_h
## t = 5.5769, df = 5471.2, p-value = 2.566e-08
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  0.5294737 1.1034973
## sample estimates:
##    mean of x    mean of y 
##  0.003173138 -0.813312370 



ks.test(theta_hat_hat_h, theta_hat_hat_not_h, na.rm = TRUE)
## 	Two-sample Kolmogorov-Smirnov test

## data:  theta_hat_hat_h and theta_hat_hat_not_h
## D = 0.30038, p-value = 0.004497
## alternative hypothesis: two-sided
