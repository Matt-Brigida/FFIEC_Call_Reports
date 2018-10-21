## function to query tier 1 and 2 capital ------
library(xts)

query_capital1 <- function(ID){
    ## this is tier 1 capital
    ## looks like tier 1 capital is in RCRI from 03312015 forward.  Schedule RCRI doesn't exist before then.

    reports <- c("03312012merged.rds", "06302012merged.rds", "09302012merged.rds", "12312012merged.rds") 
    num <- length(reports)

    tier_1_capital <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0("../merging_data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]
    tier_1_capital[i] <- as.numeric(sch$RCFA8274)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }
    ## result <- data.frame(as.numeric(tier_1_capital), row.names = date)
    ## names(result) <- c("tier_1_capital")
    result <- xts::as.xts(as.numeric(tier_1_capital), order.by = rept_date)
    names(result) <- "Tier_1_Capital"
    return(result)
}

