### data are xts objects -----

library(xts)
library(quantmod)

### Aggregate all SB loans into one series ------

small <- readRDS("./num_CI_less_100_SB_loans.rds")
medium <- readRDS("./num_CI_100_250_SB_loans.rds")
large <- readRDS("./num_CI_250_1000_SB_loans.rds")

## from here: https://stackoverflow.com/questions/42628385/sum-list-of-matrices-with-nas
modifiedSum <- function(x, y) {
  replace(x, is.na(x), 0) + replace(y, is.na(y), 0)
}


### create total SB loans xts object-----
totNumSB_CI_loans <- modifiedSum(small, medium)

totNumSB_CI_loans <- modifiedSum(totNumSB_CI_loans, large)

## lag

totNumSB_CI_loans_lagged_1_year <- lag(totNumSB_CI_loans, k = 4)

## % change

totNumSB_CI_loans_Delt <- totNumSB_CI_loans / totNumSB_CI_loans_lagged_1_year - 1

saveRDS(totNumSB_CI_loans, "totNumSB_CI_loans.rds")
saveRDS(totNumSB_CI_loans_lagged_1_year, "totNumSB_CI_loans_lagged_1_year.rds")
saveRDS(totNumSB_CI_loans_Delt, "totNumSB_CI_loans_Delt.rds")
