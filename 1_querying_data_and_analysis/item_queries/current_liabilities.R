## function to query current assets from the balance sheet.
## there is no entry for all current assets, so we'll have to pull a few entries and sum them.
library(xts)

query_current_liabilities <- function(ID){

    reports <- c("03312012/sch_RC_03312012.rds", "06302012/sch_RC_06302012.rds", "09302012/sch_RC_09302012.rds", "12312012/sch_RC_12312012.rds", "03312013/sch_RC_03312013.rds", "06302013/sch_RC_06302013.rds", "09302013/sch_RC_09302013.rds", "12312013/sch_RC_12312013.rds", "03312014/sch_RC_03312014.rds", "06302014/sch_RC_06302014.rds", "09302014/sch_RC_09302014.rds", "12312014/sch_RC_12312014.rds", "03312015/sch_RC_03312015.rds", "06302015/sch_RC_06302015.rds", "09302015/sch_RC_09302015.rds", "12312015/sch_RC_12312015.rds", "03312016/sch_RC_03312016.rds", "06302016/sch_RC_06302016.rds", "09302016/sch_RC_09302016.rds", "12312016/sch_RC_12312016.rds", "03312017/sch_RC_03312017.rds", "06302017/sch_RC_06302017.rds", "09302017/sch_RC_09302017.rds", "12312017/sch_RC_12312017.rds")
    num <- length(reports)

    ##deposits: RCON2200
    deposits <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]

    ## deposits in schedule RC is RCON2200
    deposits[i] <- as.numeric(sch$RCON2200)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }

    deposits <- xts::as.xts(as.numeric(deposits), order.by = rept_date)
    names(deposits) <- "deposits"

    ##ffp: RCONB993---------------------
    ffp <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]

    ## ffp in schedule RC is RCONB993
    ffp[i] <- as.numeric(sch$RCONB993)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }

    ffp <- xts::as.xts(as.numeric(ffp), order.by = rept_date)
    names(ffp) <- "ffp"

    ##repo: RCONB995--------------------
    repo <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]

    ## repo in schedule RC is RCONB995
    repo[i] <- as.numeric(sch$RCONB995)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }

    repo <- xts::as.xts(as.numeric(repo), order.by = rept_date)
    names(repo) <- "repo"

    ## current liabilities--------------------
    current_liabilities <- 0

    current_liabilities <- xts::as.xts(rowSums( cbind (deposits, ffp, repo), na.rm=TRUE), order.by = rept_date)
    names(current_liabilities) <- "current_liabilities"
    return(current_liabilities)
}
