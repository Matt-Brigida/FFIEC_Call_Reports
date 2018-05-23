library(xts)

RCRI_codes_query <- function(){

  ## this function can query any variable on the schedule RCR_1_of_2 -----
  ## arguments to the function are ID (the firm's IDRSSD) and the variable code (starting wtih RD...)

    reports <- c("03312015/sch_RCRI_03312015.rds", "06302015/sch_RCRI_06302015.rds", "09302015/sch_RCRI_09302015.rds", "12312015/sch_RCRI_12312015.rds", "03312016/sch_RCRI_03312016.rds", "06302016/sch_RCRI_06302016.rds", "09302016/sch_RCRI_09302016.rds", "12312016/sch_RCRI_12312016.rds", "03312017/sch_RCRI_03312017.rds", "06302017/sch_RCRI_06302017.rds")

    latest_sch <- readRDS(paste0("../../data/", reports[length(reports)]))
    
    return(names(latest_sch))
}

