### script to run over each quarter------

library(xts)
library(rDEA)
library(broom)
library(stargazer)
library(pander)

## the quarter

the_quarter <- 20160630

### get data----

panel <- readRDS("../../../build_panel/full_panel.rds")

## filter data-----

panel <- panel[panel$cost_of_funds < .3, ]
panel <- panel[panel$totSBloans_Delt < 1, ]
panel <- panel[panel$t1_LR_lagged_1_year < .5, ]
panel <- panel[panel$t1_RBCR_lagged_1_year < .5, ]

### panel for model

panel <- panel[c("quarter", "cost_of_funds", "total_assets", "ROA", "t1_leverage_ratio", "t1_RBCR_ratio", "african_am_ind", "hispanic_ind", "asian_ind", "mdi_ind", "de_novo", "totSBloans_Delt")]

panel$ln_total_assets <- log(panel$total_assets)

panel <- panel[complete.cases(panel), ]

## create panels for particular quarters----

panel <- panel[panel$quarter == the_quarter, ]

## ROA Output, T1 Leverage Ratio Input

inputs <- panel[c("cost_of_funds", "ln_total_assets", "t1_leverage_ratio", "de_novo")]

outputs <- panel[c("ROA")]

### estimate model-------

estimate <- dea(XREF = inputs, YREF = outputs, X = inputs, Y = outputs, model = "input")


## Efficiency for each Subgroup

data_with_efficiency <- data.frame(cbind(estimate$thetaOpt, panel$african_am_ind, panel$hispanic_ind, panel$asian_ind, panel$mdi_ind))
names(data_with_efficiency) <- c("Efficiency", "AA_ind", "H_ind", "Asian_ind", "MDI_ind")

## non-MDI
efficiency_not_MDI <- data_with_efficiency[data_with_efficiency$MDI_ind == 0, ][,1]
efficiency_not_MDI[is.infinite(efficiency_not_MDI)] <- NA

## African American
efficiency_aa <- data_with_efficiency[data_with_efficiency$AA_ind == 1, ][,1]
efficiency_aa[is.infinite(efficiency_aa)] <- NA

## Hispanic
efficiency_h <- data_with_efficiency[data_with_efficiency$H_ind == 1, ][,1]
efficiency_h[is.infinite(efficiency_h)] <- NA

## African American
efficiency_asian <- data_with_efficiency[data_with_efficiency$Asian_ind == 1, ][,1]
efficiency_asian[is.infinite(efficiency_asian)] <- NA

#### T Tests

### African American 

tt_aa_means <- t.test(efficiency_aa, efficiency_not_MDI, na.rm = TRUE)$estimate
tt_aa_pval <- t.test(efficiency_aa, efficiency_not_MDI, na.rm = TRUE)$p.value

### Hispanic

tt_h_means <- t.test(efficiency_h, efficiency_not_MDI, na.rm = TRUE)$estimate
tt_h_pval <- t.test(efficiency_h, efficiency_not_MDI, na.rm = TRUE)$p.value

### Asian

tt_asian_means <- t.test(efficiency_asian, efficiency_not_MDI, na.rm = TRUE)$estimate
tt_asian_pval <- t.test(efficiency_asian, efficiency_not_MDI, na.rm = TRUE)$p.value

## Kolmogorov-Smirnov Tests

### African American 

ks_aa_pval <- ks.test(efficiency_aa, efficiency_not_MDI, na.rm = TRUE)$p.value

### Hispanic

ks_h_pval <- ks.test(efficiency_h, efficiency_not_MDI, na.rm = TRUE)$p.value

### Asian

ks_asian_pval <- ks.test(efficiency_asian, efficiency_not_MDI, na.rm = TRUE)$p.value


### results data frame

means <- c(tt_aa_means[1], tt_h_means[1], tt_asian_means[1], tt_asian_means[2])
names(means) <- c("aa", "h", "asian", "nonmdi")
saveRDS(means, "means.rds")
write.csv(means, "means.csv")

pvals <- c(tt_aa_pval, tt_h_pval, tt_asian_pval)
names(pvals) <- c("aa", "h", "asian")
saveRDS(pvals, "pvals.rds")
write.csv(pvals, "pvals.csv")

ks <- c(ks_aa_pval, ks_h_pval, ks_asian_pval)
names(ks) <- c("aa", "h", "asian")
saveRDS(ks, "ks.rds")
write.csv(ks, "ks.csv")

numbers <- c(sum(panel$african_am_ind), sum(panel$hispanic_ind), sum(panel$asian_ind))
names(numbers) <- c("aa", "h", "asian")
saveRDS(numbers, "numbers.rds")
write.csv(numbers, "numbers.csv")
