library(xts)

npa_30_89 <- readRDS("npa_30_89.rds")
npa_30_89_lagged_1_year <- lag(npa_30_89, k = 4)
saveRDS(npa_30_89_lagged_1_year, "npa_30_89_lagged_1_year.rds")

npa_90_plus <- readRDS("npa_90_plus.rds")
npa_90_plus_lagged_1_year <- lag(npa_90_plus, k = 4)
saveRDS(npa_90_plus_lagged_1_year, "npa_90_plus_lagged_1_year.rds")

npa_nonacc <- readRDS("npa_nonacc.rds")
npa_nonacc_lagged_1_year <- lag(npa_nonacc, k = 4)
saveRDS(npa_nonacc_lagged_1_year, "npa_nonacc_lagged_1_year.rds")
