## merge all schedules in a given quarter ------

library(data.table)

rcs <- readRDS("../data/sch_RCS_06302017.rds")
rcs <- as.data.table(rcs)
setkey(x = rcs, "IDRSSD")
rid <- readRDS("../data/sch_RID_06302017.rds")
rid <- as.data.table(rid)
setkey(x = rid, "IDRSSD")
rci <- readRDS("../data/sch_RCI_06302017.rds")
rci <- as.data.table(rci)
setkey(x = rci, "IDRSSD")

test <- rcs[rid,][rci,]
