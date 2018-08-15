library(xts)

## function to reshape data for panel -----
panelify <- function(x, value_name){
    for (i in 1:dim(x)[2]){
        assign("tmp", data.frame(cbind(gsub("-", "", index(x[, i])), gsub("ID_", "", names(x[, i])), as.vector(x[, i]))))

        names(tmp) <- c("quarter", "IDRSSD", value_name)

    assign(paste0("tmp", i),
           tmp, envir = panelify_env)
    }
}


## change for whatever data we are reshaping ------

## Total Assets----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_BS/total_assets_lagged_1_year.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_assets_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_total_assets_lagged_1_year.rds")


## Total Equity----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_BS/total_equity_lagged_1_year.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_equity_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_total_equity_lagged_1_year.rds")


## T1 leverage ratio----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_capital_ratios/t1_LR_pre_2014_lagged_1_year.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "t1_LR_pre_2014_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_t1_LR_pre_2014_lagged_1_year.rds")

## T1 RBCR----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_capital_ratios/t1_RBCR_pre_2014_lagged_1_year.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "t1_RBCR_pre_2014_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_t1_RBCR_pre_2014_lagged_1_year.rds")


## T1 leverage ratio----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_capital_ratios/t1_LR_lagged_1_year.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "t1_LR_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_t1_LR_lagged_1_year.rds")

## T1 RBCR----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_capital_ratios/t1_RBCR_lagged_1_year.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "t1_RBCR_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_t1_RBCR_lagged_1_year.rds")

### % Change amount of SB loans
## amt_CI_less_100_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_less_100_SB_loans_Delt.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_less_100_SB_loans_Delt")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_less_100_SB_loans_Delt.rds")

## amt_CI_100_250_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_100_250_SB_loans_Delt.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_100_250_SB_loans_Delt")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_100_250_SB_loans_Delt.rds")

## amt_CI_250_1000_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_250_1000_SB_loans_Delt.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_250_1000_SB_loans_Delt")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_250_1000_SB_loans_Delt.rds")


### Amount of SB loans lagged 1 year
## amt_CI_less_100_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_less_100_SB_loans_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_less_100_SB_loans_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_less_100_SB_loans_lagged_1_year.rds")

## amt_CI_100_250_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_100_250_SB_loans_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_100_250_SB_loans_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_100_250_SB_loans_lagged_1_year.rds")

## amt_CI_250_1000_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_250_1000_SB_loans_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_250_1000_SB_loans_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_250_1000_SB_loans_lagged_1_year.rds")


## NPA 30 to 89 --------

data <- readRDS("../../get_panel_data/pulling_all_firms/non_performing_loans/npa_30_89_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "npa_30_89_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_npa_30_89_lagged_1_year.rds")

## NPA 90 plus --------

data <- readRDS("../../get_panel_data/pulling_all_firms/non_performing_loans/npa_90_plus_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "npa_90_plus_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_npa_90_plus_lagged_1_year.rds")

## NPA nonacc --------

data <- readRDS("../../get_panel_data/pulling_all_firms/non_performing_loans/npa_nonacc_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "npa_nonacc_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_npa_nonacc_lagged_1_year.rds")

## Net income --------

data <- readRDS("../../get_panel_data/pulling_all_firms/data_IS/net_income_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "net_income_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_net_income_lagged_1_year.rds")


## Total Deposits (domestic deposits) --------

data <- readRDS("../../get_panel_data/pulling_all_firms/data_BS/domestic_deposits_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "domestic_deposits_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_domestic_deposits_lagged_1_year.rds")
