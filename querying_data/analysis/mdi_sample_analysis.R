### pull data and run an prelimiary analysis on the mdi data set ------

mdi_firms <- read.csv("../../bank_codes/full_sample.csv")

idrssds <- mdi_firms$IDRSSD

## pull tier_1_capital for all firms ----

source("../item_queries/tier_1_capital.R")

tier_1 <- new.env()

## firm type 1
for (i in idrssds){

    ## tryCatch({
        assign("tmp1", query_tier_1_capital(i, firm_type = 1))
    ## },
             ## error = function(cond){assign("tmp2", NA)})

## firm type 2

    ## tryCatch({
        assign("tmp2", query_tier_1_capital(i, firm_type = 2))
    ## },
             ## error = function(e){assign("tmp2", NA)})

    ## now merge these two into one series.
    ## need to say 'keep non NA vallue'

    ## maybe have to say anything which is not a number is na, and then remove all NAs -- I think some NAs and really "NA"

    tmp1[!is.numeric(tmp1)] <- NA
    tmp2[!is.numeric(tmp2)] <- NA

    tmp1 <- tmp1[!is.na(tmp1)]
    tmp2 <- tmp2[!is.na(tmp2)]

    tmp3 <- rbind(tmp1, tmp2)
    
    names(tmp3) <- paste0("ID_", i, "_tier_1_capital")
    
    assign(paste0("ID_", i, "_tier_1_capital"),
           tmp3, envir = tier_1)

    rm(tmp1)
    rm(tmp2)
    rm(tmp3)

}


all_tier_1 <- do.call(merge, as.list(tier_1))

write.csv(all_tier_1, "mdi_tier_1_cap.csv")
saveRDS(all_tier_1, "mdi_tier_1_cap.rds")


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


### Expgenous RHS variables ------
