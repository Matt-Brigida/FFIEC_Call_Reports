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

