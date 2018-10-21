## Querying total loans and leases --- RCON2122 in schedule RC-C part 1 in Carver's 2002 call report.

query_total_loans_leases <- function(ID){

    library(xts)

        source("../individual_schedule_queries/schedule_RCCI_query.R") ## code is RCON2122

        code <- "RCON2122"

        rcci <- RCCI_query(ID, code)
        names(rcci) <- "total_loans_and_leases"

        total_loans_and_leases <- rcci

        total_loans_and_leases

}
