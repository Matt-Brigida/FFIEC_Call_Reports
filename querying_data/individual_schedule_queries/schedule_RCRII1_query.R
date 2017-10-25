library(xts)

RCRII_1_of_X_query <- function(ID, code){

  ## this function can query any variable on the schedule RCR_1_of_2 -----
  ## arguments to the function are ID (the firm's IDRSSD) and the variable code (starting wtih RD...)

    reports <- c("03312014/sch_RCRII_1_of_2_03312014.rds", "06302014/sch_RCRII_1_of_2_06302014.rds", "09302014/sch_RCRII_1_of_2_09302014.rds", "12312014/sch_RCRII_1_of_2_12312014.rds", "03312015/sch_RCRII_1_of_3_03312015.rds", "06302015/sch_RCRII_1_of_3_06302015.rds", "09302015/sch_RCRII_1_of_3_09302015.rds", "12312015/sch_RCRII_1_of_3_12312015.rds", "03312016/sch_RCRII_1_of_3_03312016.rds", "06302016/sch_RCRII_1_of_3_06302016.rds", "09302016/sch_RCRII_1_of_3_09302016.rds", "12312016/sch_RCRII_1_of_3_12312016.rds", "03312017/sch_RCRII_1_of_4_03312017.rds", "06302017/sch_RCRII_1_of_4_06302017.rds")

    num <- length(reports)

    the_code <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0("../../data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]
    the_code[i] <- as.numeric(eval(parse(text = paste0("sch$", code))))
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][6], "\\.")[[1]][1], "%m%d%Y")
    }
    
    result <- xts::as.xts(as.numeric(the_code), order.by = rept_date)
    names(result) <- quote(code)
    return(result)
}

