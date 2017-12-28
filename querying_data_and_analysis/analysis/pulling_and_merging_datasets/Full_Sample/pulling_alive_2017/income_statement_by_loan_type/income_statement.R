library(here)

## sample of firms

idrssds <- readRDS("../idrssds_alive_06302017.rds")

### Pulling Data for Sample --------

## pull (non)interest income data ------

### Interest Income from 1 to 4 Residential Properties -------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

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

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

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
    
    assign("tmp", RI_query(i, code = "RIAD4436"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = interest_income_comm_and_ind_loans)

    }

all_interest_income_comm_and_ind_loans <- do.call(merge, as.list(interest_income_comm_and_ind_loans))

write.csv(all_interest_income_comm_and_ind_loans, "interest_income_comm_and_ind_loans.csv")
saveRDS(all_interest_income_comm_and_ind_loans, "interest_income_comm_and_ind_loans.rds")

