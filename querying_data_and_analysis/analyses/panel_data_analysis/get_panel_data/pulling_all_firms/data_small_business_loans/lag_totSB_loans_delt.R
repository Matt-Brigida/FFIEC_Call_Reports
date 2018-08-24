library(xts)

data <- readRDS("./totSBloans_Delt.rds")

data <- lag(data, k = 4)

saveRDS(data, "./totSBloans_Delt_lagged_1_year.rds")
