### data are xts objects -----

library(xts)
library(quantmod)

### Aggregate all SB loans into one series ------

small <- readRDS("./amt_NN_RE_less_100_SB_loans.rds")
medium <- readRDS("./amt_NN_RE_100_250_SB_loans.rds")
large <- readRDS("./amt_NN_RE_250_1000_SB_loans.rds")

## from here: https://stackoverflow.com/questions/42628385/sum-list-of-matrices-with-nas
modifiedSum <- function(x, y) {
  replace(x, is.na(x), 0) + replace(y, is.na(y), 0)
}


### create total SB loans xts object-----
totSB_NN_RE_loans <- modifiedSum(small, medium)

totSB_NN_RE_loans <- modifiedSum(totSB_NN_RE_loans, large)

## lag

totSB_NN_RE_loans_lagged_1_year <- lag(totSB_NN_RE_loans, k = 4)

## % change

totSB_NN_RE_loans_Delt <- totSB_NN_RE_loans / totSB_NN_RE_loans_lagged_1_year - 1

saveRDS(totSB_NN_RE_loans, "totSB_NN_RE_loans.rds")
saveRDS(totSB_NN_RE_loans_lagged_1_year, "totSB_NN_RE_loans_lagged_1_year.rds")
saveRDS(totSB_NN_RE_loans_Delt, "totSB_NN_RE_loans_Delt.rds")
