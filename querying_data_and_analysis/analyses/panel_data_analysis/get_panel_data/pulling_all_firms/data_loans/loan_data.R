library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)


### Total Loans and Leases: RCON2122

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RCCI_query.R"))

loans <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpb1", RCCI_query(i, code = "RCON2122"))

    names(tmpb1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpb1, envir = loans)

    }

all_loans <- do.call(merge, as.list(loans))

write.csv(all_loans, "loans_cap.csv")
saveRDS(all_loans, "loans_cap.rds")


### Commercial and Indistrial Loans: RCON1766

## source("../individual_schedule_queries/schedule_RCCI_query.R")

Cloans <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON1766"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = Cloans)

    }

all_Cloans <- do.call(merge, as.list(Cloans))

write.csv(all_Cloans, "Cloans_cap.csv")
saveRDS(all_Cloans, "Cloans_cap.rds")
