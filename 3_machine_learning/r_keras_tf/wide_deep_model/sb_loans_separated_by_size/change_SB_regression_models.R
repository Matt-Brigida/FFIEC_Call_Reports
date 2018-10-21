### using tutorial from here: https://tensorflow.rstudio.com/tfestimators/

### Load libraries-------

library("tfestimators")
library("keras")

### Pull and clean data from github---------

panelOrig <- readRDS(url("https://github.com/Matt-Brigida/FFIEC_Call_Reports/blob/master/querying_data_and_analysis/analyses/panel_data_analysis/full_panel/panel_mdi_ind.rds?raw=true"))

## panelOrig <<- pdata.frame(panelOrig, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)
## panelOrig <- pdata.frame(panelOrig, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)

panelOrig <- panelOrig[panelOrig$t1_LR_lagged_1_year > -0.5, ]
panelOrig <- panelOrig[panelOrig$t1_LR_lagged_1_year < 1.5, ]

panelOrig <- panelOrig[panelOrig$total_assets_lagged_1_year > 0, ]
panelOrig <- panelOrig[panelOrig$total_assets_lagged_1_year < 100000000, ]

## get rid of NaN and such

panelOrig <- panelOrig[complete.cases(panelOrig), ]

panelOrig$log_TA <- log(panelOrig$total_assets_lagged_1_year)
panelOrig$aa_cap_int <- panelOrig$t1_LR_lagged_1_year * panelOrig$black_ind
panelOrig$his_cap_int <- panelOrig$t1_LR_lagged_1_year * panelOrig$hispanic_ind

### Construct model-------

## return an input_fn for a given subset of data
panel_100_input_fn <- function(data, num_epochs = 1) {
  input_fn(data,
           features = c("t1_LR_lagged_1_year", "less_100_lagged_SB_loans_TA", "ROA", "NPA_TA", "TD_TA", "log_TA", "aa_cap_int", "his_cap_int"),
           response = "amt_CI_less_100_SB_loans_Delt",
           batch_size = 32,
           num_epochs = num_epochs)
}


panel_250_input_fn <- function(data, num_epochs = 1) {
  input_fn(data,
           features = c("t1_LR_lagged_1_year", "less_100_lagged_SB_loans_TA", "ROA", "NPA_TA", "TD_TA", "log_TA", "aa_cap_int", "his_cap_int"),
           response = "amt_CI_100_250_SB_loans_Delt",
           batch_size = 32,
           num_epochs = num_epochs)
}


##  define the feature columns for our model
## says we can do transformations here, but doesn't specify how.  Look at.
cols_linear_feature <- feature_columns(
    column_numeric("t1_LR_lagged_1_year"),
    column_numeric("less_100_lagged_SB_loans_TA"),
    column_numeric("ROA"),
    column_numeric("NPA_TA"),
    column_numeric("TD_TA")
    )

cols_dnn_feature <- feature_columns(
        column_numeric("log_TA"),
        column_numeric("aa_cap_int"),
        column_numeric("his_cap_int")
    )


model100 <- dnn_linear_combined_regressor(linear_feature_columns = cols_linear_feature, dnn_feature_columns = cols_dnn_feature, dnn_hidden_units = c(100, 50))
model250 <- dnn_linear_combined_regressor(linear_feature_columns = cols_linear_feature, dnn_feature_columns = cols_dnn_feature, dnn_hidden_units = c(100, 50))

## create train and test set-----
indices <- sample(1:nrow(panelOrig), size = 0.80 * nrow(panelOrig))
train <- panelOrig[indices, ]
test  <- panelOrig[-indices, ]

# train the small loan model
model100 %>% train(panel_100_input_fn(train, num_epochs = 10))
model100 %>% evaluate(panel_100_input_fn(test))
obs <- panelOrig[(dim(panelOrig)[1] - 100):dim(panelOrig)[1], ]
preds100 <- model100 %>% predict(panel_100_input_fn(obs))

true_values100 <- obs$amt_CI_less_100_SB_loans_Delt
predictions100 <- unlist(preds100$predictions)
  
plot(predictions100, true_values100)
head(cbind(unlist(preds100$predictions), obs$amt_CI_less_100_SB_loans_Delt), n = 10)
##            [,1]        [,2]
##  [1,] 0.4270232 -0.13109461
##  [2,] 0.3705657  0.15055762
##  [3,] 0.4644383  0.14267269
##  [4,] 0.4469931  0.25698324
##  [5,] 0.4669707 -0.05136778
##  [6,] 0.4854952  0.17542017
##  [7,] 0.3864466  0.06015038
##  [8,] 0.4233899  0.30363423
##  [9,] 0.4475814 -0.12955693
## [10,] 0.3572634 -0.14838710

cor.test(unlist(preds100$predictions), obs$amt_CI_less_100_SB_loans_Delt)
## data:  unlist(preds100$predictions) and obs$amt_CI_less_100_SB_loans_Delt
## t = 0.48256, df = 99, p-value = 0.6305
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.1484020  0.2415942
## sample estimates:
##        cor 
## 0.04844224

## root mean squared error
sq_errors100 <- (true_values100 - predictions100)^2
avg_error100 <- sum(sq_errors100) / (length(sq_errors100))
rmse <- sqrt(avg_error100)
# [1] 0.4330372

saved_model_dir <- model_dir(model100)
tensorboard(log_dir = saved_model_dir, launch_browser = TRUE)  ## doesnt work


model250 %>% train(panel_250_input_fn(train, num_epochs = 10))
model250 %>% evaluate(panel_250_input_fn(test))
obs <- panelOrig[(dim(panelOrig)[1] - 100):dim(panelOrig)[1], ]
preds250 <- model250 %>% predict(panel_250_input_fn(obs))

predictions250 <- unlist(preds250$predictions)
true_values250 <- obs$amt_CI_100_250_SB_loans_Delt

plot(predictions250, true_values250)
head(cbind(predictions250, true_values250))
##            [,1]        [,2]
##  [1,] 0.4270232 -0.13109461
##  [2,] 0.3705657  0.15055762
##  [3,] 0.4644383  0.14267269
##  [4,] 0.4469931  0.25698324
##  [5,] 0.4669707 -0.05136778
##  [6,] 0.4854952  0.17542017
##  [7,] 0.3864466  0.06015038
##  [8,] 0.4233899  0.30363423
##  [9,] 0.4475814 -0.12955693
## [10,] 0.3572634 -0.14838710

cor.test(predictions250, true_values250)
## data:  unlist(preds250$predictions) and obs$amt_CI_less_250_SB_loans_Delt
## t = 0.48256, df = 99, p-value = 0.6305
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.1484020  0.2415942
## sample estimates:
##        cor 
## 0.04844224 

## root mean squared error
sq_errors250 <- (true_values250 - predictions250)^2
avg_error250 <- sum(sq_errors250) / (length(sq_errors250))
rmse <- sqrt(avg_error250)
# [1] 0.4636793