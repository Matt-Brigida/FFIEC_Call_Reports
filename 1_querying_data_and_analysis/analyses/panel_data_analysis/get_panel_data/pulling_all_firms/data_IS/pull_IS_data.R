library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")
idrssds_born_since_2017 <- readRDS("../idrssds_births_since_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead, idrssds_born_since_2017)

### Interest Income -------

source(paste0(here(), "/1_querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

total_interest_income <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4107"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = total_interest_income)

    }

all_total_interest_income <- do.call(merge, as.list(total_interest_income))

write.csv(all_total_interest_income, "total_interest_income.csv")
saveRDS(all_total_interest_income, "total_interest_income.rds")

### Interest Expense (to get net interest income) ------

total_interest_expense <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4073"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = total_interest_expense)

    }

all_total_interest_expense <- do.call(merge, as.list(total_interest_expense))

write.csv(all_total_interest_expense, "total_interest_expense.csv")
saveRDS(all_total_interest_expense, "total_interest_expense.rds")

### Total Noninterest Income ------

total_noninterest_income <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4079"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = total_noninterest_income)

    }

all_total_noninterest_income <- do.call(merge, as.list(total_noninterest_income))

write.csv(all_total_noninterest_income, "total_noninterest_income.csv")
saveRDS(all_total_noninterest_income, "total_noninterest_income.rds")



## Total Noninterest Expense -------

total_noninterest_expense <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4093"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = total_noninterest_expense)

    }

all_total_noninterest_expense <- do.call(merge, as.list(total_noninterest_expense))

write.csv(all_total_noninterest_expense, "total_noninterest_expense.csv")
saveRDS(all_total_noninterest_expense, "total_noninterest_expense.rds")


## Net Income -------

net_income <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4340"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = net_income)

    }

all_net_income <- do.call(merge, as.list(net_income))

write.csv(all_net_income, "net_income.csv")
saveRDS(all_net_income, "net_income.rds")

