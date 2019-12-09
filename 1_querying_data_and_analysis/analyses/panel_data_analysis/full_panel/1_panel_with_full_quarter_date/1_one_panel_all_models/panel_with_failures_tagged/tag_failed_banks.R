### tag all failed banks-------

library(plm)
library(readr)

## get panel----
data <- readRDS("../full_panel.rds")

data$rssd <- as.character(data$IDRSSD)
data$rssd <- as.double(data$rssd)

## get failure data------
latest <- read_csv("./latest_data.csv")
previous <- read_csv("./previous_data.csv")


## get rssd and cert map-----

map <- read_csv("./all_rssd_and_cert.csv")
