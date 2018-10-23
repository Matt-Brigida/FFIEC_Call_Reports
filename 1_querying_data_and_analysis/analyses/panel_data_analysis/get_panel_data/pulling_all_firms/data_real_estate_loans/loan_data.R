library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)

source(paste0(here(), "/1_querying_data_and_analysis/individual_schedule_queries/schedule_RCCI_query.R"))

### one-four res:  RCONF158

one_four_res <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpb1", RCCI_query(i, code = "RCONF158"))

    names(tmpb1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpb1, envir = one_four_res)

    }

all_one_four_res <- do.call(merge, as.list(one_four_res))

write.csv(all_one_four_res, "one_four_res.csv")
saveRDS(all_one_four_res, "one_four_res.rds")


### other construction:  RCONF159--------

other_construction <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCONF159"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = other_construction)

    }

all_other_construction <- do.call(merge, as.list(other_construction))

write.csv(all_other_construction, "other_construction.csv")
saveRDS(all_other_construction, "other_construction.rds")


### farmland:  RCON1420--------

farmland <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON1420"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = farmland)

    }

all_farmland <- do.call(merge, as.list(farmland))

write.csv(all_farmland, "farmland.csv")
saveRDS(all_farmland, "farmland.rds")



### revolving: RCON1797

revolving <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON1797"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = revolving)

    }

all_revolving <- do.call(merge, as.list(revolving))

write.csv(all_revolving, "revolving.csv")
saveRDS(all_revolving, "revolving.rds")
