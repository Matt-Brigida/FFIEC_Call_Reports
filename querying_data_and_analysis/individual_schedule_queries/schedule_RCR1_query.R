library(xts)
library(here)

RCR_1_of_2_query <- function(ID, code){

  ## this function can query any variable on the schedule RCR_1_of_2 -----
  ## arguments to the function are ID (the firm's IDRSSD) and the variable code (starting wtih RD...)

    reports <- c("03312001/sch_RCR_1_of_2_03312001.rds", "06302001/sch_RCR_1_of_2_06302001.rds", "09302001/sch_RCR_1_of_2_09302001.rds", "12312001/sch_RCR_1_of_2_12312001.rds", "03312002/sch_RCR_1_of_2_03312002.rds", "06302002/sch_RCR_1_of_2_06302002.rds", "09302002/sch_RCR_1_of_2_09302002.rds", "12312002/sch_RCR_1_of_2_12312002.rds", "03312003/sch_RCR_1_of_2_03312003.rds", "06302003/sch_RCR_1_of_2_06302003.rds", "09302003/sch_RCR_1_of_2_09302003.rds", "12312003/sch_RCR_1_of_2_12312003.rds", "03312004/sch_RCR_1_of_2_03312004.rds", "06302004/sch_RCR_1_of_2_06302004.rds", "09302004/sch_RCR_1_of_2_09302004.rds", "12312004/sch_RCR_1_of_2_12312004.rds", "03312005/sch_RCR_1_of_2_03312005.rds", "06302005/sch_RCR_1_of_2_06302005.rds", "09302005/sch_RCR_1_of_2_09302005.rds", "12312005/sch_RCR_1_of_2_12312005.rds", "03312006/sch_RCR_1_of_2_03312006.rds", "06302006/sch_RCR_1_of_2_06302006.rds", "09302006/sch_RCR_1_of_2_09302006.rds", "12312006/sch_RCR_1_of_2_12312006.rds", "03312007/sch_RCR_1_of_2_03312007.rds", "06302007/sch_RCR_1_of_2_06302007.rds", "09302007/sch_RCR_1_of_2_09302007.rds", "12312007/sch_RCR_1_of_2_12312007.rds", "03312008/sch_RCR_1_of_2_03312008.rds", "06302008/sch_RCR_1_of_2_06302008.rds", "09302008/sch_RCR_1_of_2_09302008.rds", "12312008/sch_RCR_1_of_2_12312008.rds", "03312009/sch_RCR_1_of_2_03312009.rds", "06302009/sch_RCR_1_of_2_06302009.rds", "09302009/sch_RCR_1_of_2_09302009.rds", "12312009/sch_RCR_1_of_2_12312009.rds", "03312010/sch_RCR_1_of_2_03312010.rds", "06302010/sch_RCR_1_of_2_06302010.rds", "09302010/sch_RCR_1_of_2_09302010.rds", "12312010/sch_RCR_1_of_2_12312010.rds", "03312011/sch_RCR_1_of_2_03312011.rds", "06302011/sch_RCR_1_of_2_06302011.rds", "09302011/sch_RCR_1_of_2_09302011.rds", "12312011/sch_RCR_1_of_2_12312011.rds", "03312012/sch_RCR_1_of_2_03312012.rds", "06302012/sch_RCR_1_of_2_06302012.rds", "09302012/sch_RCR_1_of_2_09302012.rds", "12312012/sch_RCR_1_of_2_12312012.rds", "03312013/sch_RCR_1_of_2_03312013.rds", "06302013/sch_RCR_1_of_2_06302013.rds", "09302013/sch_RCR_1_of_2_09302013.rds", "12312013/sch_RCR_1_of_2_12312013.rds")

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
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][6], "\\.")[[1]][1], "%m%d%Y")
    }
    
    result <- xts::as.xts(as.numeric(the_code), order.by = rept_date)
    names(result) <- quote(code)
    return(result)
}

