
## function to reshape data for panel -----
panelify <- function(x, value_name){
    for (i in 1:dim(x)[2]){
        assign("tmp", data.frame(cbind(1:length(x[, i]), gsub("ID_", "", names(x[, i])), as.vector(x[, i]))))

        names(tmp) <- c("quarter", "IDRSSD", value_name)

    assign(paste0("tmp", i),
           tmp, envir = panelify_env)
    }
}


library(xts)

## change for whatever data we are reshaping ------

## Total Assets----

data <- readRDS("../get_panel_data/pulling_all_firms/data_BS/total_assets.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_assets")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_total_assets.rds")


## Total Equity----

data <- readRDS("../get_panel_data/pulling_all_firms/data_BS/total_equity.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_equity")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_total_equity.rds")


## T1 leverage ratio----

data <- readRDS("../get_panel_data/pulling_all_firms/data_capital_ratios/t1_leverage_ratio_none_past_2014.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "t1_leverage_ratio_none_past_2014")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_t1_leverage_ratio_none_past_2014.rds")

## amt_CI_100_250_SB_loans----

data <- readRDS("../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_100_250_SB_loans.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "amt_CI_100_250_SB_loans")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_100_250_SB_loans.rds")

## amt_CI_250_1000_SB_loans----

data <- readRDS("../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_250_1000_SB_loans.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "amt_CI_250_1000_SB_loans")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_250_1000_SB_loans.rds")

## amt_CI_less_100_SB_loans----

data <- readRDS("../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_less_100_SB_loans.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "amt_CI_less_100_SB_loans")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_less_100_SB_loans.rds")


