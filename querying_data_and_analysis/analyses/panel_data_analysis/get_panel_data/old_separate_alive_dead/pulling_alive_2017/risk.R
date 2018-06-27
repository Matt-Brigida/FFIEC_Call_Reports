#### Create time series of ROE -----

library(xts)

ni <- readRDS("net_income.rds")
te <- readRDS("total_equity.rds")

roe <- ni / te

roe_for_sample <- roe['2010-01-01/']

## number of years of history
ll <- 3

result_list <- list()

sample_dates <- index(roe_for_sample)[-c(1:12)]

for (i in 13:length(sample_dates)){
    result_list[i] <- data.frame(apply(roe_for_sample[paste0(sample_dates[i - 12], "/", sample_dates[i])], 2, sd))
}

risk <- data.frame(do.call(rbind, result_list))
names(risk) <- names(ni)
risk <- as.xts(risk, order.by = sample_dates[13:18])

saveRDS(risk, "risk.rds")
write.csv(risk, "risk.csv")
