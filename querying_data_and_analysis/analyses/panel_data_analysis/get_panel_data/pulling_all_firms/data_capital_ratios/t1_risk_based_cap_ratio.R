library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)

## number C&I loans, less than $100,000, small business loans

source(paste0(here(), "/querying_data_and_analysis/item_queries/tier_1_risk_based_capital_ratio.R"))

t1_risk_based_capital_ratio <- new.env()

for (i in idrssds){
    
    assign("tmp", query_t1_risk_based_capital_ratio(i))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = t1_risk_based_capital_ratio)

    }

all_t1_risk_based_capital_ratio <- do.call(merge, as.list(t1_risk_based_capital_ratio))

write.csv(all_t1_risk_based_capital_ratio, "t1_risk_based_capital_ratio.csv")
saveRDS(all_t1_risk_based_capital_ratio, "t1_risk_based_capital_ratio.rds")

# Check how many bank we have data for
sum(1*(apply(all_t1_risk_based_capital_ratio, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## 10635

sum(1*(apply(all_t1_risk_based_capital_ratio['2015/'], 2, function(x){sum(x, na.rm=TRUE)}) > 0))
