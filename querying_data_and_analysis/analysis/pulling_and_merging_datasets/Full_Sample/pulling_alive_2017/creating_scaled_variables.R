### Merging data ------

library(xts)

## whats there 
system("ls *.rds")

loans <- readRDS("loans_cap.rds")
t1 <- readRDS("tier_1_cap.rds")
ni <- readRDS("net_income.rds")
ta <- readRDS("total_assets.rds")
ie <- readRDS("total_interest_expense.rds")
nonie <- readRDS("total_noninterest_expense.rds")
ii <- readRDS("total_interest_income.rds")
nonii <- readRDS("total_noninterest_income.rds")

### loans as percent of assets ----

loans_per_assets <- loans / ta

### tier 1 capital as percent of assets

tier_1_per_assets <- t1 / ta

### interest income as percent of net income

ii_per_ni <- ii / ta

### net interest income as percent of net income

net_ii_per_ni <- (ii - ie) / ta

### noninterest income as percent of net income

nonii_per_ni <- nonii / ta

### net noninterest income as percent of net income

net_nonii_per_ni <- (nonii - nonie) / ta
