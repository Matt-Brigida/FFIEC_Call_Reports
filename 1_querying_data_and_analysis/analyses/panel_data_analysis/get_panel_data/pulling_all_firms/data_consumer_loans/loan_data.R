library(here)
library(xts)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")
idrssds_births_since_12312017 <- readRDS("../idrssds_births_since_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead, idrssds_births_since_12312017)

source(paste0(here(), "/1_querying_data_and_analysis/individual_schedule_queries/schedule_RCCI_query.R"))

### Credit cards: RCONB538

credit_cards <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpb1", RCCI_query(i, code = "RCONB538"))

    names(tmpb1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpb1, envir = credit_cards)

    }

all_credit_cards <- do.call(merge, as.list(credit_cards))

write.csv(all_credit_cards, "credit_cards.csv")
saveRDS(all_credit_cards, "credit_cards.rds")


### other revolving--------

other_revolving <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCONB539"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = other_revolving)

    }

all_other_revolving <- do.call(merge, as.list(other_revolving))

write.csv(all_other_revolving, "other_revolving.csv")
saveRDS(all_other_revolving, "other_revolving.rds")


### other consumer--------

other_consumer <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON2011"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = other_consumer)

    }

all_other_consumer <- do.call(merge, as.list(other_consumer))

write.csv(all_other_consumer, "other_consumer.csv")
saveRDS(all_other_consumer, "other_consumer.rds")
