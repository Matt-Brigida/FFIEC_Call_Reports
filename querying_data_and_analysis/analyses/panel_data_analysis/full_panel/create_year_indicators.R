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
