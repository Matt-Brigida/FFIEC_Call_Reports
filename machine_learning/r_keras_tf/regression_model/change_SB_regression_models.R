### using tutorial from here: https://tensorflow.rstudio.com/tfestimators/

### Load libraries-------

library("tfestimators")

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


### Construct model-------

## return an input_fn for a given subset of data
panel_100_input_fn <- function(data, num_epochs = 1) {
  input_fn(data,
           features = c("t1_LR_lagged_1_year", "less_100_lagged_SB_loans_TA", "ROA", "NPA_TA", "TD_TA", "total_assets_lagged_1_year", "hispanic_ind", "black_ind"),
           response = "amt_CI_less_100_SB_loans_Delt",
           batch_size = 32,
           num_epochs = num_epochs)
}


panel_250_input_fn <- function(data, num_epochs = 1) {
  input_fn(data,
           features = c("t1_LR_lagged_1_year", "less_100_lagged_SB_loans_TA", "ROA", "NPA_TA", "TD_TA", "total_assets_lagged_1_year", "hispanic_ind", "black_ind"),
           response = "amt_CI_100_250_SB_loans_Delt",
           batch_size = 32,
           num_epochs = num_epochs)
}


##  define the feature columns for our model
## says we can do transformations here, but doesn't specify how.  Look at.
cols <- feature_columns(
    column_numeric("t1_LR_lagged_1_year"),
    column_numeric("less_100_lagged_SB_loans_TA"),
    column_numeric("ROA"),
    column_numeric("NPA_TA"),
    column_numeric("TD_TA")
    )


model100 <- linear_regressor(feature_columns = cols)
model250 <- linear_regressor(feature_columns = cols)


## create train and test set-----
indices <- sample(1:nrow(panelOrig), size = 0.80 * nrow(panelOrig))
train <- panelOrig[indices, ]
test  <- panelOrig[-indices, ]


# train the small loan model
model100 %>% train(panel_100_input_fn(train, num_epochs = 10))
model100 %>% evaluate(panel_100_input_fn(test))
obs <- panelOrig[(dim(panelOrig)[1] - 100):dim(panelOrig)[1], ]
model100 %>% predict(panel_100_input_fn(obs))

saved_model_dir <- model_dir(model100)

tensorboard(log_dir = saved_model_dir, launch_browser = TRUE)  ## doesnt work



model250 %>% train(panel_250_input_fn(train, num_epochs = 10))
model250 %>% evaluate(panel_250_input_fn(test))
obs <- panelOrig[(dim(panelOrig)[1] - 100):dim(panelOrig)[1], ]
model250 %>% predict(panel_250_input_fn(obs))

preds250 <- model250 %>% predict(panel_250_input_fn(obs))
