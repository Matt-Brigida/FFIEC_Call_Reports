### Merging data ------

library(xts)

## whats there 
## system("ls *.rds")

loans <- readRDS("../loans_cap.rds")
t1 <- readRDS("../tier_1_cap.rds")
ni <- readRDS("../net_income.rds")
ta <- readRDS("../total_assets.rds")
ie <- readRDS("../total_interest_expense.rds")
nonie <- readRDS("../total_noninterest_expense.rds")
ii <- readRDS("../total_interest_income.rds")
nonii <- readRDS("../total_noninterest_income.rds")
rwa <- readRDS("../risk_weighted_assets.rds")
te <- readRDS("../total_equity.rds")

rwa_latest <- data.frame(t(tail(rwa, n = 1)))
names(rwa_latest) <- "rwa"

### calculating risk ----

roe <- ni / te
## sd starting in Q1 2016
risk <- data.frame(apply(roe['2016/'], 2, sd))
names(risk) <- "risk"

### loans as percent of assets ----

loans_per_assets <- loans / rwa
loans_per_assets_latest <- data.frame(t(tail(loans_per_assets, n = 1)))
names(loans_per_assets_latest) <- "loans_per_assets"

### tier 1 capital as percent of assets

tier_1_per_assets <- t1 / rwa
tier_1_per_assets_latest <- data.frame(t(tail(tier_1_per_assets, n = 1)))
names(tier_1_per_assets_latest) <- "tier_1_per_assets"

### interest income as percent of net income

ii_per_assets <- ii / rwa
ii_per_assets_latest <- data.frame(t(tail(ii_per_assets, n = 1)))
names(ii_per_assets_latest) <- "ii_per_assets"

### net interest income as percent of net income

net_ii_per_assets <- (ii - ie) / rwa
net_ii_per_assets_latest <- data.frame(t(tail(net_ii_per_assets, n = 1)))
names(net_ii_per_assets_latest) <- "net_ii_per_assets"

### noassetsnterest income as percent of net income

nonii_per_assets <- nonii / rwa
nonii_per_assets_latest <- data.frame(t(tail(nonii_per_assets, n = 1)))
names(nonii_per_assets_latest) <- "nonii_per_assets"

### net noninterest income as percent of net income

net_nonii_per_assets <- (nonii - nonie) / rwa
net_nonii_per_assets_latest <- data.frame(t(tail(net_nonii_per_assets, n = 1)))
names(net_nonii_per_assets_latest) <- "net_nonii_per_assets"

## merge by ID regressions -----

df1 <- merge(loans_per_assets_latest, tier_1_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df1) <- df1$Row.names #reset rownames
df1$Row.names <- NULL  #remove added rownames col

df2 <- merge(df1, ii_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df2) <- df2$Row.names #reset rownames
df2$Row.names <- NULL  #remove added rownames col

df3 <- merge(df2, nonii_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df3) <- df3$Row.names #reset rownames
df3$Row.names <- NULL  #remove added rownames col

df4 <- merge(df3, net_ii_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df4) <- df4$Row.names #reset rownames
df4$Row.names <- NULL  #remove added rownames col

df5 <- merge(df4, net_nonii_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df5) <- df5$Row.names #reset rownames
df5$Row.names <- NULL  #remove added rownames col

df6 <- merge(df5, rwa_latest, by = "row.names", all.x = F, all.y = F)
rownames(df6) <- df6$Row.names #reset rownames
df6$Row.names <- NULL  #remove added rownames col

df7 <- merge(df6, risk, by = "row.names", all.x = F, all.y = F)
rownames(df7) <- df7$Row.names #reset rownames
df7$Row.names <- NULL  #remove added rownames col

saveRDS(df7, "df7.rds")

### subsetting data -------

df7_large <- subset(df7, rwa > 50000000) ## this is 50 million but because rwa is in 000 means greater than 50 billion

df7_largeish <- subset(df7, rwa > 10000000 & rwa < 50000000) ## 10 to 50 billion

df7_medium <- subset(df7, rwa < 10000000 & rwa > 1000000) ## 1 to 10 billion

df7_small <- subset(df7, rwa < 1000000) ## < 1 billion


### regressions ------


summary(lm(df7_large$loans_per_assets ~ df7_large$tier_1_per_assets + log(df7_large$rwa) + df7_large$risk))
## if T1 capital as a percent of assets increases by 1%, loans as a % of assets decrease by 8.98%
## which, for the median bank, means loans decrease by:
## median(df7_large$rwa, na.rm=T) * 1000 * 0.0898 * median(df7_large$tier_1_per_assets, na.rm=T)
## 968,680,097
## median(df7_large$rwa, na.rm=T) * 1000
## [1] 72,052,880,000
## so loans decrease by 1.3% of assets
## Coefficients:
##                             Estimate Std. Error t value Pr(>|t|)  
## (Intercept)                  -5.3058     4.7558  -1.116   0.3459  
## df7_large$tier_1_per_assets  -8.9822     2.2164  -4.053   0.0271 *
## log(df7_large$rwa)            0.4247     0.2615   1.624   0.2028  
## df7_large$risk               -2.0087     3.7544  -0.535   0.6298  
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.1533 on 3 degrees of freedom
##   (3 observations deleted due to missingness)
## Multiple R-squared:  0.8525,	Adjusted R-squared:  0.705 
## F-statistic:  5.78 on 3 and 3 DF,  p-value: 0.09179

summary(lm(df7_largeish$loans_per_assets ~ df7_largeish$tier_1_per_assets + log(df7_largeish$rwa) + df7_largeish$risk))
## if T1 capital as a percent of assets increases by 1%, loans as a % of assets INCREASE by 0.82%
## which, for the median bank, means loans increase by:
## median(df7_largeish$rwa, na.rm=T) * 1000 * 0.0082 * median(df7_largeish$tier_1_per_assets, na.rm=T)
## 18,382,284
## median(df7_largeish$rwa, na.rm=T) * 1000
##  18,653,566,000
## so loans INCREASE by 0.09% of assets
## Coefficients:
##                                Estimate Std. Error t value Pr(>|t|)  
## (Intercept)                    -0.97093    2.15495  -0.451   0.6548  
## df7_largeish$tier_1_per_assets  0.82435    0.38152   2.161   0.0369 *
## log(df7_largeish$rwa)           0.10861    0.12911   0.841   0.4054  
## df7_largeish$risk              -0.02397    2.20609  -0.011   0.9914  
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.3024 on 39 degrees of freedom
##   (2 observations deleted due to missingness)
## Multiple R-squared:  0.1101,	Adjusted R-squared:  0.04161 
## F-statistic: 1.608 on 3 and 39 DF,  p-value: 0.2031

summary(lm(df7_medium$loans_per_assets ~ df7_medium$tier_1_per_assets + log(df7_medium$rwa) + df7_medium$risk))
## if T1 capital as a percent of assets increases by 1%, loans as a % of assets INCREASE by 0.36%
## which, for the median bank, means loans INCREASE by:
## median(df7_medium$rwa, na.rm=T) * 1000 * 0.0036 * median(df7_medium$tier_1_per_assets, na.rm=T)
## 889,044.1
## median(df7_medium$rwa, na.rm=T) * 1000
##  2,008,959,500
## so loans INCREASE by 0.04% of assets
## Coefficients:
##                               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                   0.920734   0.177029   5.201 2.98e-07 ***
## df7_medium$tier_1_per_assets  0.363190   0.188689   1.925   0.0549 .  
## log(df7_medium$rwa)          -0.001044   0.012066  -0.087   0.9311    
## df7_medium$risk              -0.594589   0.387239  -1.535   0.1254    
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.1661 on 463 degrees of freedom
##   (1 observation deleted due to missingness)
## Multiple R-squared:  0.01337,	Adjusted R-squared:  0.006979 
## F-statistic: 2.092 on 3 and 463 DF,  p-value: 0.1005

summary(lm(df7_small$loans_per_assets ~ df7_small$tier_1_per_assets + log(df7_small$rwa) + df7_small$risk))
## if T1 capital as a percent of assets increases by 1%, loans as a % of assets decrease by 0.004%
## which, for the median bank, means loans decrease by:
## median(df7_small$rwa, na.rm=T) * 1000 * 0.00004 * median(df7_small$tier_1_per_assets, na.rm=T)
## 740.2073
## median(df7_small$rwa, na.rm=T) * 1000
##  118,607,000
## so loans decrease by 0.0006% of assets
## Coefficients:
##                               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                  0.6629712  0.0328774  20.165  < 2e-16 ***
## df7_small$tier_1_per_assets -0.0041443  0.0006775  -6.117 1.02e-09 ***
## log(df7_small$rwa)           0.0260047  0.0028067   9.265  < 2e-16 ***
## df7_small$risk              -0.5096679  0.0779138  -6.541 6.67e-11 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.2294 on 5241 degrees of freedom
##   (2 observations deleted due to missingness)
## Multiple R-squared:  0.03319,	Adjusted R-squared:  0.03263 
## F-statistic: 59.97 on 3 and 5241 DF,  p-value: < 2.2e-16





### entire sample----
summary(lm(df7$loans_per_assets ~ df7$tier_1_per_assets + log(df7$rwa) + df7$risk))
## if T1 capital as a percent of assets increases by 1%, loans as a % of assets decrease by 0.0045%
## which, for the median bank, means loans decrease by:
## median(df7$rwa, na.rm=T) * 1000 * 0.000045 * median(df7$tier_1_per_assets, na.rm=T)
## [1] 935.64
## the median bank has $136 million in risk weighted assets
## Coefficients:
##                         Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            0.8103223  0.0248931  32.552  < 2e-16 ***
## df7$tier_1_per_assets -0.0044847  0.0006676  -6.717 2.03e-11 ***
## log(df7$rwa)           0.0129147  0.0020635   6.259 4.16e-10 ***
## df7$risk              -0.5064295  0.0760803  -6.657 3.06e-11 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.2267 on 5758 degrees of freedom
##   (77 observations deleted due to missingness)
## Multiple R-squared:  0.02314,	Adjusted R-squared:  0.02263 
## F-statistic: 45.47 on 3 and 5758 DF,  p-value: < 2.2e-16



### OLD -------


















summary(lm(df7$net_ii_per_assets ~ df7$tier_1_per_assets + log(df7$rwa) + df7$risk))
## if T1 capital as % of assets increases by 1%, net interest income as a % of assets increases by 0.0005%
## Coefficients:
##                         Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            3.587e-02  8.161e-04  43.946  < 2e-16 ***
## df7$tier_1_per_assets  5.186e-03  2.189e-05 236.905  < 2e-16 ***
## log(df7$rwa)          -9.901e-04  6.765e-05 -14.635  < 2e-16 ***
## df7$risk               9.833e-03  2.494e-03   3.942 8.17e-05 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.007432 on 5758 degrees of freedom
##   (77 observations deleted due to missingness)
## Multiple R-squared:  0.9091,	Adjusted R-squared:  0.909 
## F-statistic: 1.918e+04 on 3 and 5758 DF,  p-value: < 2.2e-16

summary(lm(df7$net_nonii_per_assets ~ df7$tier_1_per_assets + log(df7$rwa) + df7$risk))
## if T1 capital increases by 1%, net noninterest income as a % of assets increases by 0.0046%
## median(df7$rwa, na.rm=T) * 1000 * 0.000046 * median(df7$tier_1_per_assets, na.rm=T)
## [1] 956.4331
## Coefficients:
##                         Estimate Std. Error t value Pr(>|t|)    
## (Intercept)           -0.0218826  0.0064610  -3.387 0.000712 ***
## df7$tier_1_per_assets  0.0045714  0.0001733  26.381  < 2e-16 ***
## log(df7$rwa)          -0.0011758  0.0005356  -2.195 0.028173 *  
## df7$risk               0.7575561  0.0197466  38.364  < 2e-16 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.05883 on 5758 degrees of freedom
##   (77 observations deleted due to missingness)
## Multiple R-squared:  0.2735,	Adjusted R-squared:  0.2732 
## F-statistic: 722.7 on 3 and 5758 DF,  p-value: < 2.2e-16

summary(lm(df7$ii_per_assets ~ df7$tier_1_per_assets + log(df7$rwa) + df7$risk))

summary(lm(df7$nonii_per_assets ~ df7$tier_1_per_assets + log(df7$rwa) + df7$risk))

### Subset smaller banks ----

df7_small <- subset(df7, rwa < 1000000)

summary(lm(df7_small$loans_per_assets ~ df7_small$tier_1_per_assets + log(df7_small$rwa) + df7_small$risk))
## Coefficients:
##                               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)                  0.6629712  0.0328774  20.165  < 2e-16 ***
## df7_small$tier_1_per_assets -0.0041443  0.0006775  -6.117 1.02e-09 ***
## log(df7_small$rwa)           0.0260047  0.0028067   9.265  < 2e-16 ***
## df7_small$risk              -0.5096679  0.0779138  -6.541 6.67e-11 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.2294 on 5241 degrees of freedom
##   (2 observations deleted due to missingness)
## Multiple R-squared:  0.03319,	Adjusted R-squared:  0.03263 
## F-statistic: 59.97 on 3 and 5241 DF,  p-value: < 2.2e-16

summary(lm(df7_small$ii_per_assets ~ df7_small$tier_1_per_assets + log(df7_small$rwa) + df7_small$risk))

summary(lm(df7_small$nonii_per_assets ~ df7_small$tier_1_per_assets + log(df7_small$rwa) + df7_small$risk))
