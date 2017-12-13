### pull capital and loans ------

quarter <- "03312017"

bulk_por <- readRDS(paste0("../../../../data/", quarter, "/bulk_POR_", quarter, ".rds"))

idrssds <- bulk_por$IDRSSD

## pull tier_1_capital for all firms ----

## source("../item_queries/tier_1_capital.R")
source("../item_queries/tier_1_capital_attempt_2.R")

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
    
    names(tmp3) <- paste0("ID_", i)
    
    assign(paste0("ID_", i),
           tmp3, envir = tier_1)

    rm(tmp1)
    rm(tmp2)
    rm(tmp3)

}


all_tier_1 <- do.call(merge, as.list(tier_1))

write.csv(all_tier_1, "tier_1_cap.csv")
saveRDS(all_tier_1, "tier_1_cap.rds")
