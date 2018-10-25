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


### closed end first: RCON5367

closed_end_first <- new.env()

for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON5367"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = closed_end_first)

    }

all_closed_end_first <- do.call(merge, as.list(closed_end_first))

write.csv(all_closed_end_first, "closed_end_first.csv")
saveRDS(all_closed_end_first, "closed_end_first.rds")


### closed end junior: RCON5368

closed_end_junior <- new.env()

for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON5368"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = closed_end_junior)

    }

all_closed_end_junior <- do.call(merge, as.list(closed_end_junior))

write.csv(all_closed_end_junior, "closed_end_junior.csv")
saveRDS(all_closed_end_junior, "closed_end_junior.rds")

### multifamily: RCON1460

multifamily <- new.env()

for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON1460"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = multifamily)

    }

all_multifamily <- do.call(merge, as.list(multifamily))

write.csv(all_multifamily, "multifamily.csv")
saveRDS(all_multifamily, "multifamily.rds")

### owner_occupied_nonf_nonr: RCONF160

owner_occupied_nonf_nonr <- new.env()

for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCONF160"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = owner_occupied_nonf_nonr)

    }

all_owner_occupied_nonf_nonr <- do.call(merge, as.list(owner_occupied_nonf_nonr))

write.csv(all_owner_occupied_nonf_nonr, "owner_occupied_nonf_nonr.csv")
saveRDS(all_owner_occupied_nonf_nonr, "owner_occupied_nonf_nonr.rds")


### other_nonf_nonr: RCONF161

other_nonf_nonr <- new.env()

for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCONF161"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = other_nonf_nonr)

    }

all_other_nonf_nonr <- do.call(merge, as.list(other_nonf_nonr))

write.csv(all_other_nonf_nonr, "other_nonf_nonr.csv")
saveRDS(all_other_nonf_nonr, "other_nonf_nonr.rds")
