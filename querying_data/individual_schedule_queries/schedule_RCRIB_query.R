library(xts)

RCRIB_query <- function(ID, code){

  ## this function can query any variable on the schedule RCR_1_of_2 -----
  ## arguments to the function are ID (the firm's IDRSSD) and the variable code (starting wtih RD...)

    reports <- c("03312014/sch_RCRIB_03312014.rds", "06302014/sch_RCRIB_06302014.rds", "09302014/sch_RCRIB_09302014.rds", "12312014/sch_RCRIB_12312014.rds")

    num <- length(reports)

    the_code <- 0
    rept_date <- as.Date(0)
    
    for (i in 1:num){
    sch <- readRDS(paste0("../../data/", reports[i]))
    sch <- sch[sch$IDRSSD == ID, ]
    the_code[i] <- as.numeric(eval(parse(text = paste0("sch$", code))))
    rept_date[i] <- as.Date(strsplit(strsplit(reports[i], "_")[[1]][3], "\\.")[[1]][1], "%m%d%Y")
    }
    
    result <- xts::as.xts(as.numeric(the_code), order.by = rept_date)
    names(result) <- quote(code)
    return(result)
}

