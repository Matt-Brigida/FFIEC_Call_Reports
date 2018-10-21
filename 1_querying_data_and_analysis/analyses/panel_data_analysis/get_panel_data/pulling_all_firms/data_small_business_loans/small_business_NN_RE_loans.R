library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)

## number C&I loans, less than $100,000, small business loans

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RCCII_query.R"))

num_NN_RE_less_100_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5564"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = num_NN_RE_less_100_SB_loans)

    }

all_num_NN_RE_less_100_SB_loans <- do.call(merge, as.list(num_NN_RE_less_100_SB_loans))

write.csv(all_num_NN_RE_less_100_SB_loans, "num_NN_RE_less_100_SB_loans.csv")
saveRDS(all_num_NN_RE_less_100_SB_loans, "num_NN_RE_less_100_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_num_NN_RE_less_100_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## 9678

## amount C&I loans, less than $100,000, small business loans

amt_NN_RE_less_100_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5565"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = amt_NN_RE_less_100_SB_loans)

    }

all_amt_NN_RE_less_100_SB_loans <- do.call(merge, as.list(amt_NN_RE_less_100_SB_loans))

write.csv(all_amt_NN_RE_less_100_SB_loans, "amt_NN_RE_less_100_SB_loans.csv")
saveRDS(all_amt_NN_RE_less_100_SB_loans, "amt_NN_RE_less_100_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_amt_NN_RE_less_100_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
# 9676

## number C&I loans, less than $100,000, small business loans

num_NN_RE_100_250_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5566"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = num_NN_RE_100_250_SB_loans)

    }

all_num_NN_RE_100_250_SB_loans <- do.call(merge, as.list(num_NN_RE_100_250_SB_loans))

write.csv(all_num_NN_RE_100_250_SB_loans, "num_NN_RE_100_250_SB_loans.csv")
saveRDS(all_num_NN_RE_100_250_SB_loans, "num_NN_RE_100_250_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_num_NN_RE_100_250_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
# 9564


## amount C&I loans, less than $100,000, small business loans

amt_NN_RE_100_250_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5567"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = amt_NN_RE_100_250_SB_loans)

    }

all_amt_NN_RE_100_250_SB_loans <- do.call(merge, as.list(amt_NN_RE_100_250_SB_loans))

write.csv(all_amt_NN_RE_100_250_SB_loans, "amt_NN_RE_100_250_SB_loans.csv")
saveRDS(all_amt_NN_RE_100_250_SB_loans, "amt_NN_RE_100_250_SB_loans.rds")



## number C&I loans, less than $100,000, small business loans

num_NN_RE_250_1000_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5568"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = num_NN_RE_250_1000_SB_loans)

    }

all_num_NN_RE_250_1000_SB_loans <- do.call(merge, as.list(num_NN_RE_250_1000_SB_loans))

write.csv(all_num_NN_RE_250_1000_SB_loans, "num_NN_RE_250_1000_SB_loans.csv")
saveRDS(all_num_NN_RE_250_1000_SB_loans, "num_NN_RE_250_1000_SB_loans.rds")

# Check how many bank we have data for
sum(1*(apply(all_num_NN_RE_250_1000_SB_loans, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
# 9452

## amount C&I loans, less than $100,000, small business loans

amt_NN_RE_250_1000_SB_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RCCII_query(i, code = "RCON5569"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = amt_NN_RE_250_1000_SB_loans)

    }

all_amt_NN_RE_250_1000_SB_loans <- do.call(merge, as.list(amt_NN_RE_250_1000_SB_loans))

write.csv(all_amt_NN_RE_250_1000_SB_loans, "amt_NN_RE_250_1000_SB_loans.csv")
saveRDS(all_amt_NN_RE_250_1000_SB_loans, "amt_NN_RE_250_1000_SB_loans.rds")
