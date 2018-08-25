### create the final panel-------

library(plm)

data <- readRDS("./panel_mdi_ind_denovo.rds")

panel <- pdata.frame(data, index = c("IDRSSD", "quarter"), drop.index=FALSE, row.names=TRUE)

## get rid of Inf in change data
panel$totSBloans_Delt_lagged_1_year[ !is.finite(panel$totSBloans_Delt_lagged_1_year) ] <- NA
panel$totSBloans_Delt[ !is.finite(panel$totSBloans_Delt) ] <- NA

## create total equity variable
panel$TETA_lagged_1_year <- panel$total_equity_lagged_1_year / panel$total_assets_lagged_1_year

## create fin crisis and post crisis inds
# fin crisis
for(i in 1:dim(panel)[1]){
  if((as.numeric(as.character(panel$quarter[i])) > 20081231) & (as.numeric(as.character(panel$quarter[i])) < 20120101)){
    panel$fin_crisis_ind[i] <-  1
  } else {
    panel$fin_crisis_ind[i] <-  0
  }
}

# post crisis
for(i in 1:dim(panel)[1]){
  if((as.numeric(as.character(panel$quarter[i])) > 20111231) & (as.numeric(as.character(panel$quarter[i])) < 20160101)){
    panel$post_crisis_ind[i] <-  1
  } else {
    panel$post_crisis_ind[i] <-  0
  }
}

saveRDS(object = panel, file = "full_panel.rds")

