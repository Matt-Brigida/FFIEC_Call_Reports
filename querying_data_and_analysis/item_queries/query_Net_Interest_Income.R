## function to query net interest income ------
library(xts)

query_net_interest_income <- function(ID){
    ## this is tier 1 capital
    ## looks like tier 1 capital is in RCRI from 03312015 forward.  Schedule RCRI doesn't exist before then.

    reports <- c("03312012/sch_RI_03312012.rds", "06302012/sch_RI_06302012.rds", "09302012/sch_RI_09302012.rds", "12312012/sch_RI_12312012.rds", "03312013/sch_RI_03312013.rds", "06302013/sch_RI_06302013.rds", "09302013/sch_RI_09302013.rds", "12312013/sch_RI_12312013.rds", "03312014/sch_RI_03312014.rds", "06302014/sch_RI_06302014.rds", "09302014/sch_RI_09302014.rds", "12312014/sch_RI_12312014.rds", "03312015/sch_RI_03312015.rds", "06302015/sch_RI_06302015.rds", "09302015/sch_RI_09302015.rds", "12312015/sch_RI_12312015.rds", "03312016/sch_RI_03312016.rds", "06302016/sch_RI_06302016.rds", "09302016/sch_RI_09302016.rds", "12312016/sch_RI_12312016.rds", "03312017/sch_RI_03312017.rds", "06302017/sch_RI_06302017.rds", "09302017/sch_RI_09302017.rds", "12312017/sch_RI_12312017.rds")
    num <- length(reports)

    net_interest_income <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0("../data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]
    net_interest_income[i] <- as.numeric(sch$RIAD4074)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }
    ## result <- data.frame(as.numeric(net_interest_income), row.names = date)
    ## names(result) <- c("net_interest_income")
    result <- xts::as.xts(as.numeric(net_interest_income), order.by = rept_date)
    names(result) <- "net_interest_income"
    return(result)
}

