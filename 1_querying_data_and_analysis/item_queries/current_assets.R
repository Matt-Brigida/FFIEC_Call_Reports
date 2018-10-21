## function to query current assets from the balance sheet.
## there is no entry for all current assets, so we'll have to pull a few entries and sum them.
library(xts)
library(here)

query_current_assets <- function(ID){

    reports <- c("03312012/sch_RC_03312012.rds", "06302012/sch_RC_06302012.rds", "09302012/sch_RC_09302012.rds", "12312012/sch_RC_12312012.rds", "03312013/sch_RC_03312013.rds", "06302013/sch_RC_06302013.rds", "09302013/sch_RC_09302013.rds", "12312013/sch_RC_12312013.rds", "03312014/sch_RC_03312014.rds", "06302014/sch_RC_06302014.rds", "09302014/sch_RC_09302014.rds", "12312014/sch_RC_12312014.rds", "03312015/sch_RC_03312015.rds", "06302015/sch_RC_06302015.rds", "09302015/sch_RC_09302015.rds", "12312015/sch_RC_12312015.rds", "03312016/sch_RC_03312016.rds", "06302016/sch_RC_06302016.rds", "09302016/sch_RC_09302016.rds", "12312016/sch_RC_12312016.rds", "03312017/sch_RC_03312017.rds", "06302017/sch_RC_06302017.rds", "09302017/sch_RC_09302017.rds", "12312017/sch_RC_12312017.rds")
    num <- length(reports)

    ##currency: RCON0081
    currency <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]

    ## currency in schedule RC is RCON0081
    currency[i] <- as.numeric(sch$RCON0081)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }

    currency <- xts::as.xts(as.numeric(currency), order.by = rept_date)
    names(currency) <- "currency"


    ##ibBal: RCON0071--------------------
    ibBal <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]

    ## ibBal in schedule RC is RCON0071
    ibBal[i] <- as.numeric(sch$RCON0071)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }

    iBal <- xts::as.xts(as.numeric(ibBal), order.by = rept_date)
    names(iBal) <- "ibBal"

    ##ffs: RCONB987---------------------
    ffs <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]

    ## ffs in schedule RC is RCONB987
    ffs[i] <- as.numeric(sch$RCONB987)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }

    ffs <- xts::as.xts(as.numeric(ffs), order.by = rept_date)
    names(ffs) <- "ffs"

    ##rrepo: RCONB989--------------------
    rrepo <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]

    ## rrepo in schedule RC is RCONB989
    rrepo[i] <- as.numeric(sch$RCONB987)
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }

    rrepo <- xts::as.xts(as.numeric(rrepo), order.by = rept_date)
    names(rrepo) <- "rrepo"

    ## current assets--------------------
    current_assets <- 0

    current_assets <- xts::as.xts(rowSums( cbind (currency, ibBal, ffs, rrepo), na.rm=TRUE), order.by = rept_date)
    names(current_assets) <- "current_assets"
    return(current_assets)
}
