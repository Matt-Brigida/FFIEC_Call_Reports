### data are xts objects -----

library(xts)
library(quantmod)

### Aggregate all SB loans into one series ------

CI <- readRDS("./totNumSB_CI_loans.rds")
NNRE <- readRDS("./totNumSB_NN_RE_loans.rds")

## from here: https://stackoverflow.com/questions/42628385/sum-list-of-matrices-with-nas
modifiedSum <- function(x, y) {
  replace(x, is.na(x), 0) + replace(y, is.na(y), 0)
}


### create total SB loans xts object-----
totNumSBloans <- modifiedSum(CI, NNRE)

## lag

totNumSBloans_lagged_1_year <- lag(totNumSBloans, k = 4)

## % change

totNumSBloans_Delt <- totNumSBloans / totNumSBloans_lagged_1_year - 1

saveRDS(totNumSBloans, "totNumSBloans.rds")
saveRDS(totNumSBloans_lagged_1_year, "totNumSBloans_lagged_1_year.rds")
saveRDS(totNumSBloans_Delt, "totNumSBloans_Delt.rds")
