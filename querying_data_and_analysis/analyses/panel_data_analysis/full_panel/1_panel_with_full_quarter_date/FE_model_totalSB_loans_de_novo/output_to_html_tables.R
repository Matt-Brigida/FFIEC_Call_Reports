## create output to html tables -----

library(plm)

data <- readRDS("../panel_mdi_ind_denovo.rds")

panel <- pdata.frame(data, index = c("IDRSSD", "quarter"), drop.index=FALSE, row.names=TRUE)
panel$totSBloans_Delt[ !is.finite(panel$totSBloans_Delt) ] <- NA

panel$TETA <- panel$total_equity_lagged_1_year / panel$total_assets_lagged_1_year

## T1 LR Models -------

panel1 <- panel[, c("quarter", "totSBloans_Delt", "t1_LR_lagged_1_year", "tot_lagged_SB_loans_TA", "ROA", "NPA_TA", "total_assets_lagged_1_year", "TD_TA", "black_ind", "hispanic_ind", "de_novo", "TETA")]

panel1 <- panel1[complete.cases(panel1), ]

## problem is lm() gets rid of NAs, and so is shorter than panel---first must complete.cases
panel1$TETA_resid_LR <- lm(panel1$TETA ~ panel1$t1_LR_lagged_1_year)$resid

## create fin crisis and post crisis inds
# fin crisis
for(i in 1:dim(panel1)[1]){
  if((as.numeric(as.character(panel1$quarter[i])) > 20081231) & (as.numeric(as.character(panel1$quarter[i])) < 20120101)){
    panel1$fin_crisis_ind[i] <-  1
  } else {
    panel1$fin_crisis_ind[i] <-  0
  }
}

# post crisis
for(i in 1:dim(panel1)[1]){
  if((as.numeric(as.character(panel1$quarter[i])) > 20111231) & (as.numeric(as.character(panel1$quarter[i])) < 20160101)){
    panel1$post_crisis_ind[i] <-  1
  } else {
    panel1$post_crisis_ind[i] <-  0
  }
}


## ignoring inflation just to test ----
# panel1$big_bank <- ifelse(panel1$total_assets_lagged_1_year > 1000000, 1, 0)

FEmodel1 <- plm(totSBloans_Delt ~  t1_LR_lagged_1_year + TETA_resid_LR + tot_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel1$total_assets_lagged_1_year)) + TD_TA + post_crisis_ind + fin_crisis_ind + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind) + de_novo, data = panel1, model = "within", effect = "individual")
