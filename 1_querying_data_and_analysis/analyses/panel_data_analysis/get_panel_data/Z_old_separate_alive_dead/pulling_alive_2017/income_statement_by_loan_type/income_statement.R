library(here)

## sample of firms

idrssds <- readRDS("../idrssds_alive_06302017.rds")

### Pulling Income Statement Data from Schedule RI --------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

### Interest Income from 1 to 4 Residential Properties -------

interest_income_1_4_residential_prop <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4435"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = interest_income_1_4_residential_prop)

    }

all_interest_income_1_4_residential_prop <- do.call(merge, as.list(interest_income_1_4_residential_prop))

write.csv(all_interest_income_1_4_residential_prop, "interest_income_1_4_residential_prop.csv")
saveRDS(all_interest_income_1_4_residential_prop, "interest_income_1_4_residential_prop.rds")


### Interest Income from all_other_real_estate -------

interest_income_all_other_real_estate <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4436"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = interest_income_all_other_real_estate)

    }

all_interest_income_all_other_real_estate <- do.call(merge, as.list(interest_income_all_other_real_estate))

write.csv(all_interest_income_all_other_real_estate, "interest_income_all_other_real_estate.csv")
saveRDS(all_interest_income_all_other_real_estate, "interest_income_all_other_real_estate.rds")



### Interest Income from comm_and_ind_loans -------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

interest_income_comm_and_ind_loans <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4012"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = interest_income_comm_and_ind_loans)

    }

all_interest_income_comm_and_ind_loans <- do.call(merge, as.list(interest_income_comm_and_ind_loans))

write.csv(all_interest_income_comm_and_ind_loans, "interest_income_comm_and_ind_loans.csv")
saveRDS(all_interest_income_comm_and_ind_loans, "interest_income_comm_and_ind_loans.rds")

### Interest Income from credit_cards -------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

interest_income_credit_cards <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIADB485"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = interest_income_credit_cards)

    }

all_interest_income_credit_cards <- do.call(merge, as.list(interest_income_credit_cards))

write.csv(all_interest_income_credit_cards, "interest_income_credit_cards.csv")
saveRDS(all_interest_income_credit_cards, "interest_income_credit_cards.rds")

### Interest Income from other_personal -------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

interest_income_other_personal <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIADB486"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = interest_income_other_personal)

    }

all_interest_income_other_personal <- do.call(merge, as.list(interest_income_other_personal))

write.csv(all_interest_income_other_personal, "interest_income_other_personal.csv")
saveRDS(all_interest_income_other_personal, "interest_income_other_personal.rds")
