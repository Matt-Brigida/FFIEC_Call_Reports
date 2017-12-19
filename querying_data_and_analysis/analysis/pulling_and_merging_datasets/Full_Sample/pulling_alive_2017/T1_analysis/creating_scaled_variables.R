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

### regressions ------

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
## median(df7$rwa, na.rm=T) * 1000 * 0.000052 * median(df7$tier_1_per_assets, na.rm=T)
## [1] 1081.185
## Coefficients:
##                         Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            3.986e-02  8.738e-04  45.613  < 2e-16 ***
## df7$tier_1_per_assets  5.169e-03  2.344e-05 220.578  < 2e-16 ***
## log(df7$rwa)          -1.062e-03  7.243e-05 -14.659  < 2e-16 ***
## df7$risk               9.712e-03  2.671e-03   3.637 0.000279 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.007957 on 5758 degrees of freedom
##   (77 observations deleted due to missingness)
## Multiple R-squared:  0.8967,	Adjusted R-squared:  0.8966 
## F-statistic: 1.666e+04 on 3 and 5758 DF,  p-value: < 2.2e-16

summary(lm(df7$nonii_per_assets ~ df7$tier_1_per_assets + log(df7$rwa) + df7$risk))
## median(df7$rwa, na.rm=T) * 1000 * 0.0018 * median(df7$tier_1_per_assets, na.rm=T)
## [1] 37425.64
## Coefficients:
##                         Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            0.2398956  0.0193271   12.41   <2e-16 ***
## df7$tier_1_per_assets  0.0183308  0.0005183   35.36   <2e-16 ***
## log(df7$rwa)          -0.0218415  0.0016021  -13.63   <2e-16 ***
## df7$risk               1.3577099  0.0590689   22.98   <2e-16 ***
## ---
## Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

## Residual standard error: 0.176 on 5758 degrees of freedom
##   (77 observations deleted due to missingness)
## Multiple R-squared:  0.2629,	Adjusted R-squared:  0.2625 
## F-statistic: 684.4 on 3 and 5758 DF,  p-value: < 2.2e-16

