## library(plm)
library(tidyverse)

data <- readRDS("../panel_mdi_type.rds")

names(data)

unique(data$mdi_type)

### Split data-----

data_non_mdi <- data[data$mdi_type == "Non-MDI", ][, -length(names(data))]
data_aa <- data[data$mdi_type == "MDI_African_American", ][, -length(names(data))]
data_his <- data[data$mdi_type == "MDI_Hispanic", ][, -length(names(data))]
data_asian <- data[data$mdi_type == "MDI_Asian", ][, -length(names(data))]
data_na <- data[data$mdi_type == "MDI_Native_American", ][, -length(names(data))]
data_multi <- data[data$mdi_type == "MDI_Multi", ][, -length(names(data))]

### create complete cases data
data_non_mdi_cc <- data_non_mdi[complete.cases(data_non_mdi), ]
data_aa_cc <- data_aa[complete.cases(data_aa), ]
data_his_cc <- data_his[complete.cases(data_his), ]
data_asian_cc <- data_asian[complete.cases(data_asian), ]
data_na_cc <- data_na[complete.cases(data_na), ]
data_multi_cc <- data_multi[complete.cases(data_multi), ]

### remove unnecessary columns-------
var <- c("quarter", "IDRSSD", "npa_30_89_lagged_1_year", "npa_90_plus_lagged_1_year", "npa_nonacc_lagged_1_year", "net_income_lagged_1_year", "domestic_deposits_lagged_1_year", "tot_SB_loans_lagged_1_year", "tot_NPA", "post_crisis_ind", "mdi_ind", "asian_ind", "bhn_ind", "black_ind", "hispanic_ind")

data_non_mdi_cc <- data.frame(data_non_mdi_cc[, !(names(data_non_mdi_cc) %in% var)])
data_aa_cc <- data.frame(data_aa_cc[, !(names(data_aa_cc) %in% var)])
data_his_cc <- data.frame(data_his_cc[, !(names(data_his_cc) %in% var)])


### least amount of variables----more observations when we run models because we ony do so for one SB loan size at aa time.
dim(data_non_mdi_cc)[1] + dim(data_aa_cc)[1] + dim(data_his_cc)[1] + dim(data_asian_cc)[1] + dim(data_na_cc)[1] + dim(data_multi_cc)[1]
## [1] 179956

### Calculate medians
data_aa_cc <- data.frame(apply(data_aa_cc, 2, as.numeric))
medians_aa <- data.frame(cbind(apply(data_aa_cc, 2, median), "African_American"))
names(medians_aa) <- c("value", "tag")

data_his_cc <- data.frame(apply(data_his_cc, 2, as.numeric))
medians_his <- data.frame(cbind(apply(data_his_cc, 2, median), "Hispanic"))
names(medians_his) <- c("value", "tag")

data_non_mdi_cc <- data.frame(apply(data_non_mdi_cc, 2, as.numeric))
medians_non_mdi <- data.frame(cbind(apply(data_non_mdi_cc, 2, median), "Non-MDI"))
names(medians_non_mdi) <- c("value", "tag")

medians <- cbind(as.numeric(as.character(medians_aa$value)), as.numeric(as.character(medians_his$value)), as.numeric(as.character(medians_non_mdi$value)))
medians <- as.tibble(medians)
medians <- cbind(medians, as.character(rownames(medians_non_mdi)))
names(medians) <- c("African_American", "Hispanic", "Non_MDI", "Measure")
medians <- as.tibble(medians)

medians_ta_te <- medians[c(1,2), ]
medians <- medians[-c(1,2), ]
medians_amt_loans <- medians[c(3, 4, 5), ]
medians <- medians[-c(3, 4, 5), ]
medians_TD <- medians[12, ]
medians <- medians[-12, ]

## name and round
medians$Measure <- c("T1_Leverage_Ratio", "T1_Risk_Based_Capital_Ratio", "Change_Small_SB", "Change_Medium_SB", "Change_Large_SB", "Total_SB_over_TA", "Small_SB_over_TA", "Medium_SB_over_TA", "Large_SB_over_TA", "ROA", "Non_Performing_Assets_over_TA")
medians$African_American <- round(medians$African_American, 4)
medians$Hispanic <- round(medians$Hispanic, 4)
medians$Non_MDI <- round(medians$Non_MDI, 4)

medians_ta_te$Measure <- c("Total_Assets", "Total_Equity")
medians_ta_te$African_American <- round(medians_ta_te$African_American, 4)
medians_ta_te$Hispanic <- round(medians_ta_te$Hispanic, 4)
medians_ta_te$Non_MDI <- round(medians_ta_te$Non_MDI, 4)

medians_amt_loans$Measure <- c("Amount_Small_SB_Loans", "Amount_Medium_SB_Loans", "Amount_Large_SB_Loans")
medians_amt_loans$African_American <- round(medians_amt_loans$African_American, 4)
medians_amt_loans$Hispanic <- round(medians_amt_loans$Hispanic, 4)
medians_amt_loans$Non_MDI <- round(medians_amt_loans$Non_MDI, 4)

medians_TD$Measure <- c("Deposits_over_TA")
medians_TD$African_American <- round(medians_TD$African_American, 4)
medians_TD$Hispanic <- round(medians_TD$Hispanic, 4)
medians_TD$Non_MDI <- round(medians_TD$Non_MDI, 4)

## create a bar chart like the one here:  http://jkunst.com/highcharter/highcharts-api.html
library(highcharter)

## first set
hc <- highchart() %>% 
  hc_xAxis(categories = medians$Measure) %>% 
  hc_add_series(name = "African_American", data = medians$African_American) %>% 
  hc_add_series(name = "Hispanic", data = medians$Hispanic) %>% 
  hc_add_series(name = "Non_MDI", data = medians$Non_MDI)

hc <- hc %>% 
  hc_chart(type = "column",
           options3d = list(enabled = TRUE, beta = 15, alpha = 15))

hc <- hc %>%
    hc_title(text = "Median Values",
                style = list(fontWeight = "bold"))

hc

library(htmlwidgets)
saveWidget(hc, file="first_medians.html")

## ta te
hc <- highchart() %>% 
  hc_xAxis(categories = medians_ta_te$Measure) %>% 
  hc_add_series(name = "African_American", data = medians_ta_te$African_American) %>% 
  hc_add_series(name = "Hispanic", data = medians_ta_te$Hispanic) %>% 
  hc_add_series(name = "Non_MDI", data = medians_ta_te$Non_MDI)

hc <- hc %>% 
  hc_chart(type = "column",
           options3d = list(enabled = TRUE, beta = 15, alpha = 15))

hc <- hc %>%
    hc_title(text = "Median Values",
                style = list(fontWeight = "bold"))

hc

saveWidget(hc, file="medians_ta_te.html")

## amt loans
hc <- highchart() %>% 
  hc_xAxis(categories = medians_amt_loans$Measure) %>% 
  hc_add_series(name = "African_American", data = medians_amt_loans$African_American) %>% 
  hc_add_series(name = "Hispanic", data = medians_amt_loans$Hispanic) %>% 
  hc_add_series(name = "Non_MDI", data = medians_amt_loans$Non_MDI)

hc <- hc %>% 
  hc_chart(type = "column",
           options3d = list(enabled = TRUE, beta = 15, alpha = 15))

hc <- hc %>%
    hc_title(text = "Median Values",
                style = list(fontWeight = "bold"))

hc

saveWidget(hc, file="medians_amt_loans.html")

## Total Deposits
hc <- highchart() %>% 
  hc_xAxis(categories = medians_TD$Measure) %>% 
  hc_add_series(name = "African_American", data = medians_TD$African_American) %>% 
  hc_add_series(name = "Hispanic", data = medians_TD$Hispanic) %>% 
  hc_add_series(name = "Non_MDI", data = medians_TD$Non_MDI)

hc <- hc %>% 
  hc_chart(type = "column",
           options3d = list(enabled = TRUE, beta = 15, alpha = 15))

hc <- hc %>%
    hc_title(text = "Median Values",
                style = list(fontWeight = "bold"))

hc

saveWidget(hc, file="medians_TD.html")
