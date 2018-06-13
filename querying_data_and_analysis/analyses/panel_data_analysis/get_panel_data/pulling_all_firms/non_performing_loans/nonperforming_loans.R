  ## /* NONPERFORMING ASSETS                     */

  ## RCFD1403 /* NONACCRUAL LOANS                */
  ## RCFD1406 /* LOANS PD 30-89 DAYS             */
  ## RCFD1407 /* LOANS PD 90+   DAYS             */
  ## RCFD2150 /* OREO                            */
## RCFD3123 /* ALLL                            */
## ^^^ I don't see the above codes in the example call report'

### What I did find
## Additions to nonaccrual assets during the quarter: RCONC410

## Commercial and industrial loans(30 through 89 days): RCON1606
## Commercial and industrial loans(90+ days): RCON1607
## Commercial and industrial loans (Nonaccrual): RCON1608

library(xts)
library(here)

## sample of firms

idrssds_dead <- readRDS("../idrssds_deaths_through_12312017.rds")
idrssds_alive <- readRDS("../idrssds_alive_12312017.rds")

idrssds <- c(idrssds_alive, idrssds_dead)

###  --------

source(paste0(here(), "/querying_data_and_analysis/item_queries/npa_30_89.R"))

###  Comm and in loans, 30 to 89 -------

npa_30_89 <- new.env()

for (i in idrssds){

    ## change query and code as needed
    assign("tmp", query_npa_30_89(i))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = npa_30_89)

    }

all_npa_30_89 <- do.call(merge, as.list(npa_30_89))

write.csv(all_npa_30_89, "npa_30_89.csv")
saveRDS(all_npa_30_89, "npa_30_89.rds")

## check number of firm that we have some data for
sum(1*(apply(all_npa_30_89, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## [1] 9811

###  --------

source(paste0(here(), "/querying_data_and_analysis/item_queries/npa_90_plus.R"))

###  Comm and in loans, 30 to 89 -------

npa_90_plus <- new.env()

for (i in idrssds){

    ## change query and code as needed
    assign("tmp", query_npa_90_plus(i))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = npa_90_plus)

    }

all_npa_90_plus <- do.call(merge, as.list(npa_90_plus))

write.csv(all_npa_90_plus, "npa_90_plus.csv")
saveRDS(all_npa_90_plus, "npa_90_plus.rds")

sum(1*(apply(all_npa_90_plus, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## [1] 8074

###  --------

source(paste0(here(), "/querying_data_and_analysis/item_queries/npa_nonacc.R"))

###  Comm and in loans, 30 to 89 -------

npa_nonacc <- new.env()

for (i in idrssds){

    ## change query and code as needed
    assign("tmp", query_npa_nonacc(i))

    names(tmp) <- paste0("ID_", i)

    assign(paste0("ID_", i),
           tmp, envir = npa_nonacc)

    }

all_npa_nonacc <- do.call(merge, as.list(npa_nonacc))

write.csv(all_npa_nonacc, "npa_nonacc.csv")
saveRDS(all_npa_nonacc, "npa_nonacc.rds")

sum(1*(apply(all_npa_nonacc, 2, function(x){sum(x, na.rm=TRUE)}) > 0))
## [1] 9255
