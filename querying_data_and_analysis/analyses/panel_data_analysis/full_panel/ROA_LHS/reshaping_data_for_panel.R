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

## Total Assets----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_BS/total_assets.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_assets")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_total_assets.rds")


### % Change amount of SB loans
## amt_CI_less_100_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_less_100_SB_loans_Delt_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_less_100_SB_loans_Delt_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_less_100_SB_loans_Delt_lagged_1_year.rds")

## amt_CI_100_250_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_100_250_SB_loans_Delt_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_100_250_SB_loans_Delt_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_100_250_SB_loans_Delt_lagged_1_year.rds")

## amt_CI_250_1000_SB_loans----

data <- readRDS("../../get_panel_data/pulling_all_firms/data_small_business_loans/amt_CI_250_1000_SB_loans_Delt_lagged_1_year.rds")

panelify_env <- new.env()

panelify(data, "amt_CI_250_1000_SB_loans_Delt_lagged_1_year")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_amt_CI_250_1000_SB_loans_Delt_lagged_1_year.rds")



## Net income --------

data <- readRDS("../../get_panel_data/pulling_all_firms/data_IS/net_income.rds")

panelify_env <- new.env()

panelify(data, "net_income")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_net_income.rds")
