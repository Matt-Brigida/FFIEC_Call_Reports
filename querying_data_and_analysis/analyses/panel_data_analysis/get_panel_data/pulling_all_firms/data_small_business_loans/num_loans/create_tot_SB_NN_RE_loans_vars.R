### data are xts objects -----

library(xts)
library(quantmod)

### Aggregate all SB loans into one series ------

small <- readRDS("./num_NN_RE_less_100_SB_loans.rds")
medium <- readRDS("./num_NN_RE_100_250_SB_loans.rds")
large <- readRDS("./num_NN_RE_250_1000_SB_loans.rds")

## from here: https://stackoverflow.com/questions/42628385/sum-list-of-matrices-with-nas
modifiedSum <- function(x, y) {
  replace(x, is.na(x), 0) + replace(y, is.na(y), 0)
}


### create total SB loans xts object-----
totNumSB_NN_RE_loans <- modifiedSum(small, medium)

totNumSB_NN_RE_loans <- modifiedSum(totNumSB_NN_RE_loans, large)

## lag

totNumSB_NN_RE_loans_lagged_1_year <- lag(totNumSB_NN_RE_loans, k = 4)

## % change

totNumSB_NN_RE_loans_Delt <- totNumSB_NN_RE_loans / totNumSB_NN_RE_loans_lagged_1_year - 1

saveRDS(totNumSB_NN_RE_loans, "totNumSB_NN_RE_loans.rds")
saveRDS(totNumSB_NN_RE_loans_lagged_1_year, "totNumSB_NN_RE_loans_lagged_1_year.rds")
saveRDS(totNumSB_NN_RE_loans_Delt, "totNumSB_NN_RE_loans_Delt.rds")
