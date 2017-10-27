### matching IDRSSD to FDIC code on MDI data file ----

library(readxl)
library(dplyr)

## look in latest 062017 file
full_set <- readRDS("../data/06302017/bulk_POR_06302017.rds")

## read in MDI list

mdis <- read_excel("MDI Data 2017q1.xls", skip = 2)
names(mdis)[5] <- "FDIC Certificate Number"

joined <- inner_join(mdis, full_set, by = "FDIC Certificate Number")

write.csv(joined, "full_sample.csv", row.names = FALSE)
