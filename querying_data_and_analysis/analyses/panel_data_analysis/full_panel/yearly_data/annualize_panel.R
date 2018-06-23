### annualize panel to se if it increases our R^2

library(plm)
library(dplyr)

panel <- readRDS("../panel_mdi_ind.rds")

panel$year <- NA

panel$year[panel$quarter %in% 1:4] <- 2001
panel$year[panel$quarter %in% 5:8] <- 2002
panel$year[panel$quarter %in% 9:12] <- 2003
panel$year[panel$quarter %in% 13:16] <- 2004
panel$year[panel$quarter %in% 17:20] <- 2005
panel$year[panel$quarter %in% 21:24] <- 2006
panel$year[panel$quarter %in% 25:28] <- 2007
panel$year[panel$quarter %in% 29:32] <- 2008
panel$year[panel$quarter %in% 33:36] <- 2009
panel$year[panel$quarter %in% 37:40] <- 2010
panel$year[panel$quarter %in% 41:44] <- 2011
panel$year[panel$quarter %in% 45:48] <- 2012
panel$year[panel$quarter %in% 49:52] <- 2013
panel$year[panel$quarter %in% 53:56] <- 2014
panel$year[panel$quarter %in% 57:60] <- 2015
panel$year[panel$quarter %in% 61:64] <- 2016
panel$year[panel$quarter %in% 65:68] <- 2017

### group by year as sum---_no_ most variables have to be average because they are ratios

### need to group by both IDRSSD and year and then take average

annualized_panel <- panel[, -1] %>%
    group_by(year, IDRSSD) %>%
    summarise_all(function(x){mean(x, na.rm = TRUE)})

## convert to panel data frame

annualized_panel <- pdata.frame(annualized_panel, index = c("IDRSSD", "year"), drop.index=TRUE, row.names=TRUE)

saveRDS(object = annualized_panel, file = "annualized_panel.rds")
