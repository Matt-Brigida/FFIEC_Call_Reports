library(here)

## sample of firms

idrssds <- readRDS("../idrssds_alive_06302017.rds")

### Pulling Noninterest Revenues by Source from Income Statement --------

source(paste0(here(), "/querying_data_and_analysis/individual_schedule_queries/schedule_RI_query.R"))

### Fiduciary Activities -------

fiduciary_activities <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4070"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = fiduciary_activities)

    }

all_fiduciary_activities <- do.call(merge, as.list(fiduciary_activities))

write.csv(all_fiduciary_activities, "fiduciary_activities.csv")
saveRDS(all_fiduciary_activities, "fiduciary_activities.rds")

### Deposit Account Charges -------

deposit_account_charges <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIAD4080"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = deposit_account_charges)

    }

all_deposit_account_charges <- do.call(merge, as.list(deposit_account_charges))

write.csv(all_deposit_account_charges, "deposit_account_charges.csv")
saveRDS(all_deposit_account_charges, "deposit_account_charges.rds")

### Trading Revenue -------

trading_revenue <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIADA220"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = trading_revenue)

    }

all_trading_revenue <- do.call(merge, as.list(trading_revenue))

write.csv(all_trading_revenue, "trading_revenue.csv")
saveRDS(all_trading_revenue, "trading_revenue.rds")

### Securities Brokerage Fees Commissions -------

securities_brokerage_fees_comm <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIADC886"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = securities_brokerage_fees_comm)

    }

all_securities_brokerage_fees_comm <- do.call(merge, as.list(securities_brokerage_fees_comm))

write.csv(all_securities_brokerage_fees_comm, "securities_brokerage_fees_comm.csv")
saveRDS(all_securities_brokerage_fees_comm, "securities_brokerage_fees_comm.rds")

### Investment Banking, Advisory, Underwriting ------

inv_bank_advisory_underwriting <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIADC888"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = inv_bank_advisory_underwriting)

    }

all_inv_bank_advisory_underwriting <- do.call(merge, as.list(inv_bank_advisory_underwriting))

write.csv(all_inv_bank_advisory_underwriting, "inv_bank_advisory_underwriting.csv")
saveRDS(all_inv_bank_advisory_underwriting, "inv_bank_advisory_underwriting.rds")

## Fees annuity sales ----

fees_annuity_sales <- new.env()

for (i in idrssds){
    
    assign("tmp", RI_query(i, code = "RIADC887"))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = fees_annuity_sales)

    }

all_fees_annuity_sales <- do.call(merge, as.list(fees_annuity_sales))

write.csv(all_fees_annuity_sales, "fees_annuity_sales.csv")
saveRDS(all_fees_annuity_sales, "fees_annuity_sales.rds")
