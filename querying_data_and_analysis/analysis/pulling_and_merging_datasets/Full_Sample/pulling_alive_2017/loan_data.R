
### Total Loans (domestic offices): RCON2122

source("../individual_schedule_queries/schedule_RCCI_query.R")

loans<- new.env()

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

source("../individual_schedule_queries/schedule_RCCI_query.R")

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

