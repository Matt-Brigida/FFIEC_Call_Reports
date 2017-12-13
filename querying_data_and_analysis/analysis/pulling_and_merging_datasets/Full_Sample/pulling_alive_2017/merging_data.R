### Merging data ------
### this is MDI data

library(xts)

## whats there 
system("ls *.rds")

loans <- readRDS("mdi_loans_cap.rds")
t1 <- readRDS("mdi_tier_1_cap.rds")
ni <- readRDS("mdi_net_income.rds")
ta <- readRDS("mdi_total_assets.rds")
ie <- readRDS("mdi_total_interest_expense.rds")
nonie <- readRDS("mdi_total_noninterest_expense.rds")
ii <- readRDS("mdi_total_interest_income.rds")
nonii <- readRDS("mdi_total_noninterest_income.rds")

### loans as percent of assets ----

loans_per_assets <- loans / ta

### tier 1 capital as percent of assets

tier_1_per_assets <- t1 / ta

### interest income as percent of net income

ii_per_ni <- ii / ni

### net interest income as percent of net income

ii_per_ni <- (ii - ie) / ni

### noninterest income as percent of net income

nonii_per_ni <- nonii / ni

### net noninterest income as percent of net income

nonii_per_ni <- (nonii - nonie) / ni

### vizualizations ------

library(highcharter)

### t1 capital and (non)interest income

df_t1_nonii <- data.frame(cbind(as.vector(tier_1_per_assets[66]), as.vector(nonii_per_ni[66,])))
df_t1_nonii <- df_t1_nonii[df_t1_nonii[,2] > 0,]
plot(df_t1_nonii, ylim = c(-50,50))
summary(lm(df_t1_nonii[,2] ~ df_t1_nonii[,1]))

df_t1_ii <- data.frame(cbind(as.vector(tier_1_per_assets[64]), as.vector(ii_per_ni[64,])))
df_t1_ii <- df_t1_ii[df_t1_ii[,2] > 0,]
plot(df_t1_ii, ylim = c(-50,50))
summary(lm(df_t1_ii[,2] ~ df_t1_ii[,1]))

### t1 capital and loans

df_t1_loans <- data.frame(cbind(as.vector(tier_1_per_assets[66]), as.vector(loans_per_assets[66,])))
df_t1_loans <- df_t1_loans[df_t1_loans[,2] > 0,]
plot(df_t1_loans)
summary(lm(df_t1_loans[,2] ~ df_t1_loans[,1]))


