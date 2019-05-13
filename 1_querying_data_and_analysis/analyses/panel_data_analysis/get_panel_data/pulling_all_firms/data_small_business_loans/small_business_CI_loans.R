library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")
idrssds_births_since_12312017 <- readRDS("../idrssds_births_since_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead, idrssds_births_since_12312017)

## number C&I loans, less than $100,000, small business loans

source(paste0(here(), "/1_querying_data_and_analysis/individual_schedule_queries/schedule_RCCII_query.R"))

num_CI_less_100_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5570"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = num_CI_less_100_SB_loans)

    }

all_num_CI_less_100_SB_loans <- do.call(merge, as.list(num_CI_less_100_SB_loans))

write.csv(all_num_CI_less_100_SB_loans, "num_CI_less_100_SB_loans.csv")
saveRDS(all_num_CI_less_100_SB_loans, "num_CI_less_100_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_num_CI_less_100_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## 9678

## amount C&I loans, less than $100,000, small business loans

amt_CI_less_100_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5571"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = amt_CI_less_100_SB_loans)

    }

all_amt_CI_less_100_SB_loans <- do.call(merge, as.list(amt_CI_less_100_SB_loans))

write.csv(all_amt_CI_less_100_SB_loans, "amt_CI_less_100_SB_loans.csv")
saveRDS(all_amt_CI_less_100_SB_loans, "amt_CI_less_100_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_amt_CI_less_100_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
# 9676

## number C&I loans, less than $100,000, small business loans

num_CI_100_250_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5572"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = num_CI_100_250_SB_loans)

    }

all_num_CI_100_250_SB_loans <- do.call(merge, as.list(num_CI_100_250_SB_loans))

write.csv(all_num_CI_100_250_SB_loans, "num_CI_100_250_SB_loans.csv")
saveRDS(all_num_CI_100_250_SB_loans, "num_CI_100_250_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_num_CI_100_250_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
# 9564


## amount C&I loans, less than $100,000, small business loans

amt_CI_100_250_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5573"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = amt_CI_100_250_SB_loans)

    }

all_amt_CI_100_250_SB_loans <- do.call(merge, as.list(amt_CI_100_250_SB_loans))

write.csv(all_amt_CI_100_250_SB_loans, "amt_CI_100_250_SB_loans.csv")
saveRDS(all_amt_CI_100_250_SB_loans, "amt_CI_100_250_SB_loans.rds")



## number C&I loans, less than $100,000, small business loans

num_CI_250_1000_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5574"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = num_CI_250_1000_SB_loans)

    }

all_num_CI_250_1000_SB_loans <- do.call(merge, as.list(num_CI_250_1000_SB_loans))

write.csv(all_num_CI_250_1000_SB_loans, "num_CI_250_1000_SB_loans.csv")
saveRDS(all_num_CI_250_1000_SB_loans, "num_CI_250_1000_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_num_CI_250_1000_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
9452

## amount C&I loans, less than $100,000, small business loans

amt_CI_250_1000_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5575"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = amt_CI_250_1000_SB_loans)

    }

all_amt_CI_250_1000_SB_loans <- do.call(merge, as.list(amt_CI_250_1000_SB_loans))

write.csv(all_amt_CI_250_1000_SB_loans, "amt_CI_250_1000_SB_loans.csv")
saveRDS(all_amt_CI_250_1000_SB_loans, "amt_CI_250_1000_SB_loans.rds")
