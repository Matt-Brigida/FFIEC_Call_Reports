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

## Get Data and Filter

### get data----

panel <- readRDS("../../build_panel/full_panel.rds")

## filter data-----

panel <- panel[panel$cost_of_funds < .3, ]

names(panel)

### panel for model

panel <- panel[c("quarter", "cost_of_funds", "total_assets", "ROA", "t1_leverage_ratio", "t1_RBCR_ratio", "african_am_ind", "hispanic_ind")]

panel$ln_total_assets <- log(panel$total_assets)

panel <- panel[complete.cases(panel), ]

## create panels for particular quarters----

panel_20170630 <- panel[panel$quarter == 20170630, ]

## ROA Output, T1 Leverage Ratio Input

inputs_20170630 <- panel_20170630[c("cost_of_funds", "ln_total_assets", "t1_leverage_ratio")]

outputs_20170630 <- panel_20170630[c("ROA")]

### Results Output Focused 20170630

estimate <- dea.robust(X = inputs_20170630, Y = outputs_20170630, model = "output")

### African American-----

## theta_hat
th2 <- data.frame(cbind(est2$theta_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(th2) <- c("theta_hat", "aa_ind", "h_ind")
theta_hat_not_aa <- th2[th2$aa_ind == 0, ][,1]
theta_hat_not_aa[is.infinite(theta_hat_not_aa)] <- NA
theta_hat_aa <- th2[th2$aa_ind == 1, ][,1]
theta_hat_aa[is.infinite(theta_hat_aa)] <- NA

t.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE)


ks.test(theta_hat_aa, theta_hat_not_aa, na.rm = TRUE)



### theta_hat_hat (unbiased)
thh2 <- data.frame(cbind(est2$theta_hat_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(thh2) <- c("theta_hat_hat", "aa_ind", "h_ind")
theta_hat_hat_not_aa <- thh2[thh2$aa_ind == 0, ][,1]
theta_hat_hat_not_aa[is.infinite(theta_hat_hat_not_aa)] <- NA
theta_hat_hat_aa <- thh2[thh2$aa_ind == 1, ][,1]
theta_hat_hat_aa[is.infinite(theta_hat_hat_aa)] <- NA

t.test(theta_hat_hat_aa, theta_hat_hat_not_aa, na.rm = TRUE)



ks.test(theta_hat_hat_aa, theta_hat_hat_not_aa, na.rm = TRUE)


### Hispanic -------

## theta_hat
th2 <- data.frame(cbind(est2$theta_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(th2) <- c("theta_hat", "aa_ind", "h_ind")
theta_hat_not_h <- th2[th2$h_ind == 0, ][,1]
theta_hat_not_h[is.infinite(theta_hat_not_h)] <- NA
theta_hat_h <- th2[th2$h_ind == 1, ][,1]
theta_hat_h[is.infinite(theta_hat_h)] <- NA

t.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE)



ks.test(theta_hat_h, theta_hat_not_h, na.rm = TRUE)


### theta_hat_hat (unbiased)
thh2 <- data.frame(cbind(est2$theta_hat_hat, panel_20170630$african_am_ind, panel_20170630$hispanic_ind))
names(thh2) <- c("theta_hat_hat", "aa_ind", "h_ind")
theta_hat_hat_not_h <- thh2[thh2$h_ind == 0, ][,1]
theta_hat_hat_not_h[is.infinite(theta_hat_hat_not_h)] <- NA
theta_hat_hat_h <- thh2[thh2$h_ind == 1, ][,1]
theta_hat_hat_h[is.infinite(theta_hat_hat_h)] <- NA

t.test(theta_hat_hat_h, theta_hat_hat_not_h, na.rm = TRUE)

ks.test(theta_hat_hat_h, theta_hat_hat_not_h, na.rm = TRUE)
