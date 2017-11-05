### pull data and run an prelimiary analysis on the mdi data set ------

mdi_firms <- read.csv("../../bank_codes/full_sample.csv")

idrssds <- mdi_firms$IDRSSD

## pull tier_1_capital for all firms ----

## source("../item_queries/tier_1_capital.R")
source("../item_queries/tier_1_capital_attempt_2.R")

tier_1 <- new.env()

## firm type 1
for (i in idrssds){

    ## tryCatch({
        assign("tmp1", query_tier_1_capital(i, firm_type = 1))
    ## },
             ## error = function(cond){assign("tmp2", NA)})

## firm type 2

    ## tryCatch({
        assign("tmp2", query_tier_1_capital(i, firm_type = 2))
    ## },
             ## error = function(e){assign("tmp2", NA)})

    ## now merge these two into one series.
    ## need to say 'keep non NA vallue'

    ## maybe have to say anything which is not a number is na, and then remove all NAs -- I think some NAs and really "NA"

    tmp1[!is.numeric(tmp1)] <- NA
    tmp2[!is.numeric(tmp2)] <- NA

    tmp1 <- tmp1[!is.na(tmp1)]
    tmp2 <- tmp2[!is.na(tmp2)]

    tmp3 <- rbind(tmp1, tmp2)
    
    names(tmp3) <- paste0("ID_", i)
    
    assign(paste0("ID_", i),
           tmp3, envir = tier_1)

    rm(tmp1)
    rm(tmp2)
    rm(tmp3)

}


all_tier_1 <- do.call(merge, as.list(tier_1))

write.csv(all_tier_1, "mdi_tier_1_cap.csv")
saveRDS(all_tier_1, "mdi_tier_1_cap.rds")


### Total Loans (domestic offices): RCON2122

source("../individual_schedule_queries/schedule_RCCI_query.R")

loans<- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpb1", RCCI_query(i, code = "RCON2122"))

    names(tmpb1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpb1, envir = loans)

    }

all_loans <- do.call(merge, as.list(loans))

write.csv(all_loans, "mdi_loans_cap.csv")
saveRDS(all_loans, "mdi_loans_cap.rds")


### Commercial and Indistrial Loans: RCON1766

source("../individual_schedule_queries/schedule_RCCI_query.R")

Cloans <- new.env()

## firm type 1
for (i in idrssds){
    
    assign("tmpc1", RCCI_query(i, code = "RCON1766"))

    names(tmpc1) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmpc1, envir = Cloans)

    }

all_Cloans <- do.call(merge, as.list(Cloans))

write.csv(all_Cloans, "mdi_Cloans_cap.csv")
saveRDS(all_Cloans, "mdi_Cloans_cap.rds")


### Exogenous RHS variables ------
## pull data from FRED

library(quantmod)
library(tseries)

## T10Y2YM -- 10 - 2 year treasury rate (monthly)
## GS10 -- 10 year (monthly)
## CPIAUCSL -- CPI season adj (monthly)
## (PAYEMS) nonfarm payrolls season adj (monthly)

ten_two <- getSymbols('T10Y2YM', src = "FRED", auto.assign = FALSE)
ten_two <- to.quarterly(ten_two)
ten_two <- (ten_two$ten_two.High + ten_two$ten_two.Low) / 2
adf.test(ten_two) ## => stationary
ten_two_unexp <- xts(ar(ten_two)$resid, order.by = index(ten_two))
names(ten_two) <- "ten_two"
names(ten_two_unexp) <- "ten_two_unexp"

ten <- getSymbols('GS10', src = "FRED", auto.assign = FALSE)
ten <- to.quarterly(ten)
ten <- (ten$ten.High + ten$ten.Low) / 2
adf.test(ten) ## => nonstationary
ten <- Delt(ten, type = 'log')[-1]
adf.test(ten) ## => stationary
ten_unexp <- ar(ten)$resid
ten_unexp <- xts(ar(ten)$resid, order.by = index(ten))
names(ten) <- "ten"
names(ten_unexp) <- "ten_unexp"

cpi <- getSymbols('CPIAUCSL', src = "FRED", auto.assign = FALSE)
cpi <- to.quarterly(cpi)
cpi <- (cpi$cpi.High + cpi$cpi.Low) / 2
adf.test(cpi)                           # => nonstationary
cpi <- Delt(cpi, type = 'log')[-1]
adf.test(cpi)                           # => stationary
cpi_unexp <- ar(cpi)$resid
cpi_unexp <- xts(ar(cpi)$resid, order.by = index(cpi))
names(cpi) <- "cpi"
names(cpi_unexp) <- "cpi_unexp"

jobs <- getSymbols('PAYEMS', src = "FRED", auto.assign = FALSE)
jobs <- to.quarterly(jobs)
jobs <- (jobs$jobs.High + jobs$jobs.Low) / 2
adf.test(jobs)                           # => nonstationary
jobs <- Delt(jobs, type = 'log')[-1]
adf.test(jobs)                           # => stationary
jobs_unexp <- ar(jobs)$resid
jobs_unexp <- xts(ar(jobs)$resid, order.by = index(jobs))
names(jobs) <- "jobs"
names(jobs_unexp) <- "jobs_unexp"

exog <- merge.xts(ten_two, ten_two_unexp, ten, ten_unexp, cpi, cpi_unexp, jobs, jobs_unexp, join = "inner")

saveRDS(exog, "exog.rds")
write.csv(exog, "Exog_vars.csv")

### Variables for analysis
# Independent Variables
# Exogenous
# Interest Rates
# Monthly GDP growth rate
# Monthly Jobs report
# CPI
#  
# Endogenous
# Net Interest Margin
# RWA
# Tier 1 Capital
# Total Capital
# ROAA
# Derivative Proxy
#  
# Dependent Variables
# Loans/Assets
# Res Mortg./Total Loans
# PAR >90
# NPLs
