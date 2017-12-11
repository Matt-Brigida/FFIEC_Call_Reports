## the tier 1 capital item switches schedules over time (and switches item codes).  So here we create a query which will pull tier 1 capital from these multiple schedules.
## even if we were to merge all the schedules, we would still need to switch item codes in the query.

query_tier_1_capital <- function(ID, firm_type = 1){

    library(xts)

    ## read in RCR_1_of_2_query -- contains tier 1 capital through 2013 -----

    if(firm_type == 1){
        
        source("../individual_schedule_queries/schedule_RCR1_query.R") ## code is RCON8274--maybe RCFD8274 for some firms -- yep

        source("../individual_schedule_queries/schedule_RCRIB_query.R") ## only for 2014, code is RCFA8274

        source("../individual_schedule_queries/schedule_RCRI_query.R") ## 2015 onward, code is RCFA8274

        code1 <- "RCFD8274"

        code2 <- "RCFA8274"

        rcr1_portion <- RCR_1_of_2_query(ID, code1)
        names(rcr1_portion) <- "tier_1_capital"

        tmp1 <- RCRIB_query(ID, code1)
        tmp2 <- RCRIB_query(ID, code2)
        tmp3 <- RCRIB_query(ID, "RCON8274")
        tmp4 <- RCRIB_query(ID, "RCOA8274")
        
        tmp1[!is.numeric(tmp1)] <- NA
        tmp2[!is.numeric(tmp2)] <- NA
        tmp3[!is.numeric(tmp3)] <- NA
        tmp4[!is.numeric(tmp4)] <- NA

        tmp1 <- tmp1[!is.na(tmp1)]
        tmp2 <- tmp2[!is.na(tmp2)]
        tmp3 <- tmp3[!is.na(tmp3)]
        tmp4 <- tmp4[!is.na(tmp4)]

        rcrib_portion <- rbind(tmp1, tmp2, tmp3, tmp4)
        rm(tmp1)
        rm(tmp2)
        rm(tmp3)
        rm(tmp4)
        if (length(rcrib_portion) > 0){
            names(rcrib_portion) <- "tier_1_capital"
        } else {
            
            }

        rcri_portion <- RCRI_query(ID, code2)
        names(rcri_portion) <- "tier_1_capital"

        tier_1_capital <- rbind(rcr1_portion, rcrib_portion, rcri_portion)

        tier_1_capital

    } else {

        source("../individual_schedule_queries/schedule_RCR1_query.R") ## code is RCON8274--maybe RCFD8274 for some firms -- yep

        source("../individual_schedule_queries/schedule_RCRIA_query.R") ## only for 2014, code is 

        source("../individual_schedule_queries/schedule_RCRI_query.R") ## 2015 onward, code is RCFA8274

        code1 <- "RCON8274"
        
        code2 <- "RCOA8274"

        rcr1_portion <- RCR_1_of_2_query(ID, code1)
        names(rcr1_portion) <- "tier_1_capital"

        tmp1 <- RCRIA_query(ID, code1)
        tmp2 <- RCRIA_query(ID, code2)
        tmp3 <- RCRIA_query(ID, "RCFD8274")
        tmp4 <- RCRIA_query(ID, "RCFA8274")

        tmp1[!is.numeric(tmp1)] <- NA
        tmp2[!is.numeric(tmp2)] <- NA
        tmp3[!is.numeric(tmp3)] <- NA
        tmp4[!is.numeric(tmp4)] <- NA

        tmp1 <- tmp1[!is.na(tmp1)]
        tmp2 <- tmp2[!is.na(tmp2)]
        tmp3 <- tmp3[!is.na(tmp3)]
        tmp4 <- tmp4[!is.na(tmp4)]

        rcrib_portion <- rbind(tmp1, tmp2, tmp3, tmp4)
        rm(tmp1)
        rm(tmp2)
        rm(tmp3)
        rm(tmp4)
        if (length(rcrib_portion) > 0){
            names(rcrib_portion) <- "tier_1_capital"
        } else {
            
            }

        rcri_portion <- RCRI_query(ID, code2)
        names(rcri_portion) <- "tier_1_capital"

        tier_1_capital <- rbind(rcr1_portion, rcrib_portion, rcri_portion)

        tier_1_capital

        
    }

}
