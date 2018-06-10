library(xts)
library(plm)

data <- readRDS("./panel.rds")

panel <- pdata.frame(data, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)

## remove any Inf or NaNs in the change data
panel$amt_CI_less_100_SB_loans_Delt[is.infinite(panel$amt_CI_less_100_SB_loans_Delt)] <- NA
panel$amt_CI_less_100_SB_loans_Delt[is.nan(panel$amt_CI_less_100_SB_loans_Delt)] <- NA

panel$amt_CI_100_250_SB_loans_Delt[is.infinite(panel$amt_CI_100_250_SB_loans_Delt)] <- NA
panel$amt_CI_100_250_SB_loans_Delt[is.nan(panel$amt_CI_100_250_SB_loans_Delt)] <- NA

panel$amt_CI_250_1000_SB_loans_Delt[is.infinite(panel$amt_CI_250_1000_SB_loans_Delt)] <- NA
panel$amt_CI_250_1000_SB_loans_Delt[is.nan(panel$amt_CI_250_1000_SB_loans_Delt)] <- NA

### FE models
## < 100
FEmodel1 <- plm(amt_CI_less_100_SB_loans_Delt ~  t1_leverage_ratio_none_past_2014 + less_100_lagged_SB_loans_TA, data = panel, model = "within", effect = "twoways")
summary(FEmodel1)
# Twoways effects Within Model
# 
# Call:
# plm(formula = amt_CI_less_100_SB_loans_Delt ~ t1_leverage_ratio_none_past_2014 +
#     less_100_lagged_SB_loans_TA, data = panel, effect = "twoways",
#     model = "within")
# 
# Unbalanced Panel: n = 9032, T = 1-25, N = 142703
# 
# Residuals:
#        Min.     1st Qu.      Median     3rd Qu.        Max.
# -299.090338   -0.269608   -0.010938    0.206020 4514.494055
# 
# Coefficients:
#                                  Estimate Std. Error  t-value  Pr(>|t|)
# t1_leverage_ratio_none_past_2014  12.5387     2.0758   6.0403 1.542e-09 ***
# less_100_lagged_SB_loans_TA      -39.2171     3.5896 -10.9252 < 2.2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Total Sum of Squares:    25121000
# Residual Sum of Squares: 25092000
# R-Squared:      0.0011473
# Adj. R-Squared: -0.066544
# F-statistic: 76.7568 on 2 and 133645 DF, p-value: < 2.22e-16

## 100 to 250
FEmodel2 <- plm(amt_CI_100_250_SB_loans_Delt ~  t1_leverage_ratio_none_past_2014 + X100_250_lagged_SB_loans_TA, data = panel, model = "within", effect = "twoways")
summary(FEmodel2)
# Twoways effects Within Model
# 
# Call:
# plm(formula = amt_CI_100_250_SB_loans_Delt ~ t1_leverage_ratio_none_past_2014 +
#     X100_250_lagged_SB_loans_TA, data = panel, effect = "twoways",
#     model = "within")
# 
# Unbalanced Panel: n = 8925, T = 1-25, N = 140186
# 
# Residuals:
#        Min.     1st Qu.      Median     3rd Qu.        Max.
# -6.6952e+02 -2.3646e-01  4.7012e-02  2.9956e-01  1.4709e+04
# 
# Coefficients:
#                                  Estimate Std. Error t-value Pr(>|t|)
# t1_leverage_ratio_none_past_2014   15.049      6.450  2.3331 0.019643 *
# X100_250_lagged_SB_loans_TA       -37.306     14.014 -2.6621 0.007766 **
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Total Sum of Squares:    229610000
# Residual Sum of Squares: 229590000
# R-Squared:      9.7073e-05
# Adj. R-Squared: -0.068095
# F-statistic: 6.37031 on 2 and 131235 DF, p-value: 0.0017122

FEmodel3 <- plm(amt_CI_250_1000_SB_loans_Delt ~  t1_leverage_ratio_none_past_2014 + X250_1000_lagged_SB_loans_TA, data = panel, model = "within", effect = "twoways")
summary(FEmodel3)
# Twoways effects Within Model
# 
# Call:
# plm(formula = amt_CI_250_1000_SB_loans_Delt ~ t1_leverage_ratio_none_past_2014 +
#     X250_1000_lagged_SB_loans_TA, data = panel, effect = "twoways",
#     model = "within")
# 
# Unbalanced Panel: n = 8766, T = 1-25, N = 135764
# 
# Residuals:
#        Min.     1st Qu.      Median     3rd Qu.        Max.
# -173.511286   -0.405150   -0.033431    0.269427 3010.899353
# 
# Coefficients:
#                                  Estimate Std. Error  t-value  Pr(>|t|)
# t1_leverage_ratio_none_past_2014   9.8383     2.2017   4.4685 7.885e-06 ***
# X250_1000_lagged_SB_loans_TA     -28.3167     2.1547 -13.1415 < 2.2e-16 ***
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Total Sum of Squares:    24929000
# Residual Sum of Squares: 24892000
# R-Squared:      0.0015161
# Adj. R-Squared: -0.067615
# F-statistic: 96.3975 on 2 and 126972 DF, p-value: < 2.22e-16
