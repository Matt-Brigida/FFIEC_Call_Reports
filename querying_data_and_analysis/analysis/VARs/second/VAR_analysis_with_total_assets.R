## load libraries

library(vars)
library(quantmod)

### load data files ----

## tier 1 capital
cap <- readRDS("../../mdi_tier_1_cap.rds")

## domestic loan balance
loans <- readRDS("../../mdi_loans_cap.rds")

## commercial and industrial loans
Cloans <- readRDS("../../mdi_Cloans_cap.rds")
Cloans[Cloans == 0] <- NA

assets <- readRDS("../../mdi_total_assets.rds")

## exogenous variables
exogs <- readRDS("../../exog.rds")
## remove Q3 2017 because not yet in FDIC data
exogs <- exogs[-dim(exogs)[1], ]

### convert tier 1 capital and loans from levels into changes -----
## this data set (laons, cap) starts in Q1 2001

loans_r <- apply(loans, 2, Delt)
loans_r <- as.xts(loans_r, order.by = index(exogs["2001/"]))

Cloans_r <- apply(Cloans, 2, Delt)
Cloans_r <- as.xts(Cloans_r, order.by = index(exogs["2001/"]))

cap_r <- apply(cap, 2, Delt)
cap_r <- as.xts(cap_r, order.by = index(exogs["2001/"]))

### wont work yet -- log assets end in 2013 so clearly the variable switches schedules -----
log_assets <- apply(assets, 2, log)
log_assets <- as.xts(log_assets, order.by = index(exogs["2001/"]))

#### VAR

## full sample

for (i in gsub("ID_", "", names(cap))){

    tmp <- merge.xts(loans_r[,(gsub("ID_", "", names(loans_r)) == i)], cap_r[,(gsub("ID_", "", names(cap_r)) == i)], log_assets[,(gsub("ID_", "", names(log_assets)) == i)], exogs)
    tmp <- tmp[!rowSums(!is.finite(tmp)), ]
    tmp <- tmp[complete.cases(tmp), ]
    names(tmp)[1] <- "loans"
    names(tmp)[2] <- "capital"
    names(tmp)[3] <- "assets"

    tmp_endo <- tmp[, c(1,2, 3)]
    tmp_exog <- tmp[, c(-1,-2)]
    
    tmp_var_sel <- VARselect(tmp_endo, exogen = tmp_exog)
    tmp_var <- tryCatch(VAR(tmp_endo, p = tmp_var_sel$selection[1], exogen = tmp_exog), error = function(e){print("error")})

    sum_tmp_var <- tryCatch(summary(tmp_var), error = function(e){print("error")})

    if(sum_tmp_var == "error") next
    
    print(summary(tmp_var))

    tryCatch(plot(irf(tmp_var, impulse = 'capital', response = 'loans', n.ahead = 10,
                 ortho = TRUE, cumulative = FALSE, boot = TRUE, ci = 0.95,
                 runs = 100, seed = NULL), error = function(e){print("error")}))
    
    }
