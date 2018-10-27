### data are xts objects -----

library(xts)
library(quantmod)

### Aggregate all SB loans into one series ------

one <- readRDS("./closed_end_first.rds")
two <- readRDS("./closed_end_junior.rds")
three <- readRDS("./farmland.rds")
four <- readRDS("./multifamily.rds")
five <- readRDS("./one_four_res.rds")
six <- readRDS("./other_construction.rds")
seven <- readRDS("./other_nonf_nonr.rds")
eight <- readRDS("./owner_occupied_nonf_nonr.rds")
nine <- readRDS("./revolving.rds")


## from here: https://stackoverflow.com/questions/42628385/sum-list-of-matrices-with-nas
modifiedSum <- function(x, y) {
  replace(x, is.na(x), 0) + replace(y, is.na(y), 0)
}


### create total SB loans xts object-----
total_RE_loans <- modifiedSum(one, two)
total_RE_loans <- modifiedSum(total_RE_loans, three)
total_RE_loans <- modifiedSum(total_RE_loans, four)
total_RE_loans <- modifiedSum(total_RE_loans, five)
total_RE_loans <- modifiedSum(total_RE_loans, six)
total_RE_loans <- modifiedSum(total_RE_loans, seven)
total_RE_loans <- modifiedSum(total_RE_loans, eight)
total_RE_loans <- modifiedSum(total_RE_loans, nine)


## lag

## totSB_CI_loans_lagged_1_year <- lag(totSB_CI_loans, k = 4)

## % change

## totSB_CI_loans_Delt <- totSB_CI_loans / totSB_CI_loans_lagged_1_year - 1

saveRDS(total_RE_loans, "total_RE_loans.rds")
