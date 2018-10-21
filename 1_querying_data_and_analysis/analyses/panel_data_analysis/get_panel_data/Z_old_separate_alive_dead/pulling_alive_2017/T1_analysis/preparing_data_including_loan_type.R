### Merging data ------

library(xts)

## whats there 
## system("ls *.rds")

## original -----
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

## additional loan types -----

ii_res_prop <- readRDS("../income_statement_by_loan_type/interest_income_1_4_residential_prop.rds")
ii_all_other_re <- readRDS("../income_statement_by_loan_type/interest_income_all_other_real_estate.rds")
ii_comm_ind_loans <- readRDS("../income_statement_by_loan_type/interest_income_comm_and_ind_loans.rds")
ii_credit_cards <- readRDS("../income_statement_by_loan_type/interest_income_credit_cards.rds")
ii_other_personal <- readRDS("../income_statement_by_loan_type/interest_income_other_personal.rds")

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

### nonassetsnterest income as percent of assets

nonii_per_assets <- nonii / rwa
nonii_per_assets_latest <- data.frame(t(tail(nonii_per_assets, n = 1)))
names(nonii_per_assets_latest) <- "nonii_per_assets"

### net noninterest income as percent of assets

net_nonii_per_assets <- (nonii - nonie) / rwa
net_nonii_per_assets_latest <- data.frame(t(tail(net_nonii_per_assets, n = 1)))
names(net_nonii_per_assets_latest) <- "net_nonii_per_assets"

### ii resedential prop income as percent of assets

ii_res_prop_per_assets <- ii_res_prop / rwa
ii_res_prop_per_assets_latest <- data.frame(t(tail(ii_res_prop_per_assets, n = 1)))
names(ii_res_prop_per_assets_latest) <- "ii_res_prop_per_assets"

### all other re as percent of assets

ii_all_other_re_per_assets <- ii_all_other_re / rwa
ii_all_other_re_per_assets_latest <- data.frame(t(tail(ii_all_other_re_per_assets, n = 1)))
names(ii_all_other_re_per_assets_latest) <- "ii_all_other_re_per_assets"

### 

ii_comm_ind_loans_per_assets <- ii_comm_ind_loans / rwa
ii_comm_ind_loans_per_assets_latest <- data.frame(t(tail(ii_comm_ind_loans_per_assets, n = 1)))
names(ii_comm_ind_loans_per_assets_latest) <- "ii_comm_ind_loans_per_assets"

### 

ii_credit_cards_per_assets <- ii_credit_cards / rwa
ii_credit_cards_per_assets_latest <- data.frame(t(tail(ii_credit_cards_per_assets, n = 1)))
names(ii_credit_cards_per_assets_latest) <- "ii_credit_cards_per_assets"

### 

ii_other_personal_per_assets <- ii_other_personal / rwa
ii_other_personal_per_assets_latest <- data.frame(t(tail(ii_other_personal_per_assets, n = 1)))
names(ii_other_personal_per_assets_latest) <- "ii_other_personal_per_assets"

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

df8 <- merge(df7, ii_res_prop_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df8) <- df8$Row.names #reset rownames
df8$Row.names <- NULL  #remove added rownames col

df9 <- merge(df8, ii_all_other_re_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df9) <- df9$Row.names #reset rownames
df9$Row.names <- NULL  #remove added rownames col

df10 <- merge(df9, ii_comm_ind_loans_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df10) <- df10$Row.names #reset rownames
df10$Row.names <- NULL  #remove added rownames col

df11 <- merge(df10, ii_credit_cards_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df11) <- df11$Row.names #reset rownames
df11$Row.names <- NULL  #remove added rownames col

df12 <- merge(df11, ii_other_personal_per_assets_latest, by = "row.names", all.x = F, all.y = F)
rownames(df12) <- df12$Row.names #reset rownames
df12$Row.names <- NULL  #remove added rownames col

saveRDS(df12, "df12.rds")
