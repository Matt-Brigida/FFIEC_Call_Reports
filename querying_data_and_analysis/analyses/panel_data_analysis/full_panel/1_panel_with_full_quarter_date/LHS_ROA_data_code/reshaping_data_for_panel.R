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

data <- readRDS("../../../get_panel_data/pulling_all_firms/data_BS/total_assets.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "total_assets")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_total_assets.rds")





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

data <- readRDS("../../../get_panel_data/pulling_all_firms/data_IS/net_income.rds")

panelify_env <- new.env()

panelify(data, "net_income")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_net_income.rds")


## Total SB Loan Data Lagged! --------


## Total SB Loan Data Delt Lagged 1 Year --------

data <- readRDS("./totSBloans_Delt.rds")

panelify_env <- new.env()

panelify(data, "totSBloans_Delt")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_totSBloans_Delt.rds")
