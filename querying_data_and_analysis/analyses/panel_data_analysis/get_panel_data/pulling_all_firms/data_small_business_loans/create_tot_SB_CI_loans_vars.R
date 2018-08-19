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
totSB_CI_loans <- modifiedSum(small, medium)

totSB_CI_loans <- modifiedSum(totSB_CI_loans, large)

## lag

totSB_CI_loans_lagged_1_year <- lag(totSB_CI_loans, k = 4)

## % change

totSB_CI_loans_Delt <- totSB_CI_loans / totSB_CI_loans_lagged_1_year - 1

saveRDS(totSB_CI_loans, "totSB_CI_loans.rds")
saveRDS(totSB_CI_loans_lagged_1_year, "totSB_CI_loans_lagged_1_year.rds")
saveRDS(totSB_CI_loans_Delt, "totSB_CI_loans_Delt.rds")
