### data are xts objects -----

library(xts)
library(quantmod)

### Aggregate all SB loans into one series ------

small <- readRDS("./amt_CI_less_100_SB_loans.rds")
medium <- readRDS("./amt_CI_100_250_SB_loans.rds")
large <- readRDS("./amt_CI_250_1000_SB_loans.rds")

## from here: https://stackoverflow.com/questions/42628385/sum-list-of-matrices-with-nas
modifiedSum <- function(x, y) {
  replace(x, is.na(x), 0) + replace(y, is.na(y), 0)
}


### create total SB loans xts object-----
totSBloans <- modifiedSum(small, medium)

totSBloans <- modifiedSum(totSBloans, large)

## lag

totSBloans_lagged_1_year <- lag(totSBloans, k = 4)

## % change

totSBloans_Delt <- totSBloans / totSBloans_lagged_1_year - 1

saveRDS(totSBloans, "totSBloans.rds")
saveRDS(totSBloans_lagged_1_year, "totSBloans_lagged_1_year.rds")
saveRDS(totSBloans_Delt, "totSBloans_Delt.rds")
