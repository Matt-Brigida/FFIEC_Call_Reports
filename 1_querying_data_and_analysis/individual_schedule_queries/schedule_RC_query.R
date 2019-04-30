library(xts)
library(here)

RC_query <- function(ID, code){

  ## this function can query any variable on the schedule RCR_1_of_2 -----
  ## arguments to the function are ID (the firm's IDRSSD) and the variable code (starting wtih RD...)

    reports <- c("03312001/sch_RC_03312001.rds", "06302001/sch_RC_06302001.rds", "09302001/sch_RC_09302001.rds", "12312001/sch_RC_12312001.rds", "03312002/sch_RC_03312002.rds", "06302002/sch_RC_06302002.rds", "09302002/sch_RC_09302002.rds", "12312002/sch_RC_12312002.rds", "03312003/sch_RC_03312003.rds", "06302003/sch_RC_06302003.rds", "09302003/sch_RC_09302003.rds", "12312003/sch_RC_12312003.rds", "03312004/sch_RC_03312004.rds", "06302004/sch_RC_06302004.rds", "09302004/sch_RC_09302004.rds", "12312004/sch_RC_12312004.rds", "03312005/sch_RC_03312005.rds", "06302005/sch_RC_06302005.rds", "09302005/sch_RC_09302005.rds", "12312005/sch_RC_12312005.rds", "03312006/sch_RC_03312006.rds", "06302006/sch_RC_06302006.rds", "09302006/sch_RC_09302006.rds", "12312006/sch_RC_12312006.rds", "03312007/sch_RC_03312007.rds", "06302007/sch_RC_06302007.rds", "09302007/sch_RC_09302007.rds", "12312007/sch_RC_12312007.rds", "03312008/sch_RC_03312008.rds", "06302008/sch_RC_06302008.rds", "09302008/sch_RC_09302008.rds", "12312008/sch_RC_12312008.rds", "03312009/sch_RC_03312009.rds", "06302009/sch_RC_06302009.rds", "09302009/sch_RC_09302009.rds", "12312009/sch_RC_12312009.rds", "03312010/sch_RC_03312010.rds", "06302010/sch_RC_06302010.rds", "09302010/sch_RC_09302010.rds", "12312010/sch_RC_12312010.rds", "03312011/sch_RC_03312011.rds", "06302011/sch_RC_06302011.rds", "09302011/sch_RC_09302011.rds", "12312011/sch_RC_12312011.rds", "03312012/sch_RC_03312012.rds", "06302012/sch_RC_06302012.rds", "09302012/sch_RC_09302012.rds", "12312012/sch_RC_12312012.rds", "03312013/sch_RC_03312013.rds", "06302013/sch_RC_06302013.rds", "09302013/sch_RC_09302013.rds", "12312013/sch_RC_12312013.rds", "03312014/sch_RC_03312014.rds", "06302014/sch_RC_06302014.rds", "09302014/sch_RC_09302014.rds", "12312014/sch_RC_12312014.rds", "03312015/sch_RC_03312015.rds", "06302015/sch_RC_06302015.rds", "09302015/sch_RC_09302015.rds", "12312015/sch_RC_12312015.rds", "03312016/sch_RC_03312016.rds", "06302016/sch_RC_06302016.rds", "09302016/sch_RC_09302016.rds", "12312016/sch_RC_12312016.rds", "03312017/sch_RC_03312017.rds", "06302017/sch_RC_06302017.rds",  "09302017/sch_RC_09302017.rds", "12312017/sch_RC_12312017.rds", "03312018/sch_RC_03312018.rds", "06302018/sch_RC_06302018.rds",  "09302018/sch_RC_09302018.rds", "12312018/sch_RC_12312018.rds")

    num <- length(reports)

    the_code <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0(here(), "/data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]
    the_code[i] <- if( length(as.numeric(eval(parse(text = paste0("sch$", code))))) == 0){
                       NA
                   } else {
                       as.numeric(eval(parse(text = paste0("sch$", code))))
                   }
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }
    
    result <- xts::as.xts(as.numeric(the_code), order.by = rept_date)
    names(result) <- quote(code)
    return(result)
}

