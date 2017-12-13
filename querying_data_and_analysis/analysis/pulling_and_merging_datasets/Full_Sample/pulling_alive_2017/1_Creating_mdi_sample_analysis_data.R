
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

write.csv(all_loans, "mdi_loans_cap.csv")
saveRDS(all_loans, "mdi_loans_cap.rds")


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

write.csv(all_Cloans, "mdi_Cloans_cap.csv")
saveRDS(all_Cloans, "mdi_Cloans_cap.rds")

### Total Assets -------

source("../individual_schedule_queries/schedule_RC_query.R")

total_assets <- new.env()

for (i in idrssds){
    
    assign("tmpta", RC_query(i, code = "RCON2170"))

    names(tmpta) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpta, envir = total_assets)

    }

all_total_assets <- do.call(merge, as.list(total_assets))

write.csv(all_total_assets, "mdi_total_assets.csv")
saveRDS(all_total_assets, "mdi_total_assets.rds")


