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

        rcrib_portion <- RCRIB_query(ID, code2)
        names(rcrib_portion) <- "tier_1_capital"

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

        rcrib_portion <- RCRIA_query(ID, code1)
        names(rcrib_portion) <- "tier_1_capital"

        rcri_portion <- RCRI_query(ID, code2)
        names(rcri_portion) <- "tier_1_capital"

        tier_1_capital <- rbind(rcr1_portion, rcrib_portion, rcri_portion)

        tier_1_capital

        
    }

}
