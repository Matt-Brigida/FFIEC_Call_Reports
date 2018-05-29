library(xts)

## function to reshape data for panel -----
panelify <- function(x, value_name){
    for (i in 1:dim(x)[2]){
        assign("tmp", data.frame(cbind(1:length(x[, i]), gsub("ID_", "", names(x[, i])), as.vector(x[, i]))))

        names(tmp) <- c("quarter", "IDRSSD", value_name)

    assign(paste0("tmp", i),
           tmp, envir = panelify_env)
    }
}




## change for whatever data we are reshaping ------

## Cloans is all commercial and industrial loans----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/Cloans_cap.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "Cloans_cap")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_Cloans_cap.rds")


## loans_cap is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/loans_cap.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "loans_cap")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_loans_cap.rds")


## net_income is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/net_income.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "net_income")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_net_income.rds")


## risk_weighted_assets is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/risk_weighted_assets.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "risk_weighted_assets")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_risk_weighted_assets.rds")


## tier_1_cap is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/tier_1_cap.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "tier_1_cap")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_tier_1_cap.rds")


## total_interest_expense is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/total_interest_expense.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_interest_expense")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_total_interest_expense.rds")


## total_interest_income is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/total_interest_income.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_interest_income")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_total_interest_income.rds")


## total_noninterest_expense is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/total_noninterest_expense.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_noninterest_expense")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_total_noninterest_expense.rds")


## total_noninterest_income is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/total_noninterest_income.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_noninterest_income")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_total_noninterest_income.rds")


#### From income statement by loan type ------

##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_loan_type/interest_income_1_4_residential_prop.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "interest_income_1_4_residential_prop")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_interest_income_1_4_residential_prop.rds")


##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_loan_type/interest_income_all_other_real_estate.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "interest_income_all_other_real_estate")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_interest_income_all_other_real_estate.rds")


##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_loan_type/interest_income_comm_and_ind_loans.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "interest_income_comm_and_ind_loans")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_interest_income_comm_and_ind_loans.rds")


##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_loan_type/interest_income_credit_cards.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "interest_income_credit_cards")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_interest_income_credit_cards.rds")


##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_loan_type/interest_income_other_personal.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "interest_income_other_personal")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_interest_income_other_personal.rds")

#### From income_statement_by_noninterest_income

##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_noninterest_income/deposit_account_charges.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "noninterest_income_deposit_account_charges")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_noninterest_income_deposit_account_charges.rds")


##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_noninterest_income/fees_annuity_sales.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "noninterest_income_fees_annuity_sales")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_noninterest_income_fees_annuity_sales.rds")


##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_noninterest_income/fiduciary_activities.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "noninterest_income_fiduciary_activities")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_noninterest_income_fiduciary_activities.rds")


##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_noninterest_income/inv_bank_advisory_underwriting.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "noninterest_income_inv_bank_advisory_underwriting")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_noninterest_income_inv_bank_advisory_underwriting.rds")

##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_noninterest_income/securities_brokerage_fees_comm.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "noninterest_income_securities_brokerage_fees_comm")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_noninterest_income_securities_brokerage_fees_comm.rds")

##  is ... ----

data <- readRDS("../Full_Sample/pulling_firms_dead_2001_2017/income_statement_by_noninterest_income/trading_revenue.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "noninterest_income_trading_revenue")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_dead_noninterest_income_trading_revenue.rds")
