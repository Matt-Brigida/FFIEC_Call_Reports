library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")
idrssds_births_since_12312017 <- readRDS("../idrssds_births_since_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead, idrssds_births_since_12312017)

## number C&I loans, less than $100,000, small business loans

source(paste0(here(), "/1_querying_data_and_analysis/item_queries/tier_1_leverage_ratio.R"))

t1_leverage_ratio <- new.env()

for (i in idrssds){
    
    assign("tmp", query_t1_leverage_ratio(i))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = t1_leverage_ratio)

    }

all_t1_leverage_ratio <- do.call(merge, as.list(t1_leverage_ratio))

write.csv(all_t1_leverage_ratio, "t1_leverage_ratio.csv")
saveRDS(all_t1_leverage_ratio, "t1_leverage_ratio.rds")

all_t1_LR_lagged_1_year <- lag(all_t1_leverage_ratio, k = 4)

write.csv(all_t1_LR_lagged_1_year, "t1_LR_lagged_1_year.csv")
saveRDS(all_t1_LR_lagged_1_year, "t1_LR_lagged_1_year.rds")


# Check how many bank we have data for
sum(1*(apply(all_t1_leverage_ratio, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## 10649

sum(1*(apply(all_t1_leverage_ratio['2015/'], 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## 6413

## good!
