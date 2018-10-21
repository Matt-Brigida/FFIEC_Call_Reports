### Load libraries -----

library(plm)

### read in data with indicators for MDI type-----

panel <- readRDS("./panel_mdi_ind.rds")


panel$X2002 <- ifelse(panel$quarter %in% 5:8, 1, 0)
panel$X2003 <- ifelse(panel$quarter %in% 9:12, 1, 0)
panel$X2004 <- ifelse(panel$quarter %in% 13:16, 1, 0)
panel$X2005 <- ifelse(panel$quarter %in% 17:20, 1, 0)
panel$X2006 <- ifelse(panel$quarter %in% 21:24, 1, 0)
panel$X2007 <- ifelse(panel$quarter %in% 25:28, 1, 0)
panel$X2008 <- ifelse(panel$quarter %in% 29:32, 1, 0)
panel$X2009 <- ifelse(panel$quarter %in% 33:36, 1, 0)
panel$X2010 <- ifelse(panel$quarter %in% 37:40, 1, 0)
panel$X2011 <- ifelse(panel$quarter %in% 41:44, 1, 0)
panel$X2012 <- ifelse(panel$quarter %in% 45:48, 1, 0)
panel$X2013 <- ifelse(panel$quarter %in% 49:52, 1, 0)
panel$X2014 <- ifelse(panel$quarter %in% 53:56, 1, 0)
panel$X2015 <- ifelse(panel$quarter %in% 57:60, 1, 0)
panel$X2016 <- ifelse(panel$quarter %in% 61:64, 1, 0)
panel$X2017 <- ifelse(panel$quarter %in% 65:68, 1, 0)

saveRDS(panel, "panel_mdi_ind_year_ind.rds")
