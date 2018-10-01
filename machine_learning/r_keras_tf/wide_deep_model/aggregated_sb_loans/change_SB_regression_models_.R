### using tutorial from here: https://tensorflow.rstudio.com/tfestimators/

### Load libraries-------

library("tfestimators")
library("keras")

### Pull and clean data from github---------

panelOrig <- readRDS(url("https://github.com/Matt-Brigida/FFIEC_Call_Reports/blob/master/querying_data_and_analysis/analyses/panel_data_analysis/full_panel/1_panel_with_full_quarter_date/1_one_panel_all_models/full_panel.rds?raw=true"))

cols <- c("quarter", "totNumSBloans_Delt", "totSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind")

panel <- panelOrig[, cols]

## Create indicator and other variables

panel$log_TA_lagged_1 <- log(panel$total_assets_lagged_1_year)
panel$aa_t1_int <- panel$african_am_ind * panel$t1_LR_lagged_1_year
panel$h_t1_int <- panel$hispanic_ind * panel$t1_LR_lagged_1_year
panel$log_TA_ROA <- log(panel$total_assets_lagged_1_year) * panel$ROA_lagged_1
panel$log_TA_NPA <- log(panel$total_assets_lagged_1_year) * panel$NPA_TA_lagged_1


## get rid of NAs

panel <- panel[complete.cases(panel), ]
panel$TE_orthogonal <- lm(panel$TETA_lagged_1_year ~ panel$t1_LR_lagged_1_year)$resid

### Construct model-------

## return an input_fn for a given subset of data
panel_input_fn <- function(data, num_epochs = 1) {
  input_fn(data,
           features = c("t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "TD_TA_lagged_1", "log_TA_lagged_1", "aa_t1_int", "h_t1_int", "log_TA_ROA", "log_TA_NPA"),
           response = "totSBloans_Delt",
           batch_size = 32,
           num_epochs = num_epochs)
}


##  define the feature columns for our model
## says we can do transformations here, but doesn't specify how.  Look at.
cols_linear_feature <- feature_columns(
    column_numeric("tot_SB_loans_TA_lagged_1"),
    column_numeric("NPA_TA_lagged_1"),
    column_numeric("log_TA_lagged_1"),
    column_numeric("TD_TA_lagged_1"),
    column_numeric("ROA_lagged_1")
    )

cols_dnn_feature <- feature_columns(
    column_numeric("t1_LR_lagged_1_year"),
    column_numeric("aa_t1_int"),
    column_numeric("h_t1_int"),
    column_numeric("log_TA_ROA"),
    column_numeric("log_TA_NPA")
    )


model1 <- dnn_linear_combined_regressor(linear_feature_columns = cols_linear_feature, dnn_feature_columns = cols_dnn_feature, dnn_hidden_units = c(100, 50))

## create train and test set-----
indices <- sample(1:nrow(panel), size = 0.80 * nrow(panel))
train <- panel[indices, ]
test  <- panel[-indices, ]

# train the small loan model
model1 %>% train(panel_input_fn(train, num_epochs = 10))
model1 %>% evaluate(panel_input_fn(test))
obs <- panel[(dim(panel)[1] - 100):dim(panel)[1], ]
preds1 <- model1 %>% predict(panel_input_fn(obs))

true_values1 <- obs$totSBloans_Delt
predictions1 <- unlist(preds1$predictions)

plot(predictions1, true_values1)
head(cbind(unlist(preds1$predictions), obs$totSBloans_Delt), n = 10)

cor.test(unlist(preds1$predictions), obs$totSBloans_Delt)
## data:  unlist(preds1$predictions) and obs$totSBloans_Delt
## t = 9.5319, df = 99, p-value = 1.149e-15
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.5739325 0.7815496
## sample estimates:
##      cor
## 0.691776

## root mean squared error
sq_errors1 <- (true_values1 - predictions1)^2
avg_error1 <- sum(sq_errors1) / (length(sq_errors1))
rmse <- sqrt(avg_error1)
## [1] 1.342739

saved_model_dir <- model_dir(model1)
tensorboard(log_dir = saved_model_dir, launch_browser = TRUE)  
