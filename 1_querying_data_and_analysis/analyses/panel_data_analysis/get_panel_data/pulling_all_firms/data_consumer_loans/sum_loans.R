### data are xts objects -----

library(xts)
library(quantmod)

### Aggregate all SB loans into one series ------

credit_cards <- readRDS("./credit_cards.rds")
other_consumer <- readRDS("./other_consumer.rds")
other_revolving <- readRDS("./other_revolving.rds")

## from here: https://stackoverflow.com/questions/42628385/sum-list-of-matrices-with-nas
modifiedSum <- function(x, y) {
  replace(x, is.na(x), 0) + replace(y, is.na(y), 0)
}


### create total SB loans xts object-----
total_consumer_loans <- modifiedSum(credit_cards, other_consumer)

total_consumer_loans <- modifiedSum(total_consumer_loans, other_revolving)

## lag

## totSB_CI_loans_lagged_1_year <- lag(totSB_CI_loans, k = 4)

## % change

## totSB_CI_loans_Delt <- totSB_CI_loans / totSB_CI_loans_lagged_1_year - 1

saveRDS(total_consumer_loans, "total_consumer_loans.rds")
