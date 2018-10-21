library(plm)

panelOrig <- readRDS(url("https://github.com/Matt-Brigida/FFIEC_Call_Reports/blob/master/querying_data_and_analysis/analyses/panel_data_analysis/full_panel/panel_mdi_ind.rds?raw=true"))

## panelOrig <<- pdata.frame(panelOrig, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)
panelOrig <- pdata.frame(panelOrig, index = c("IDRSSD", "quarter"), drop.index=TRUE, row.names=TRUE)

panelOrig <- panelOrig[panelOrig$t1_LR_lagged_1_year > -0.5, ]
panelOrig <- panelOrig[panelOrig$t1_LR_lagged_1_year < 1.5, ]

panelOrig <- panelOrig[panelOrig$total_assets_lagged_1_year > 0, ]
panelOrig <- panelOrig[panelOrig$total_assets_lagged_1_year < 100000000, ]

## first divide into samples by size

smallest_bank <- min(panelOrig$total_assets_lagged_1_year, na.rm = TRUE)
largest_bank <- max(panelOrig$total_assets_lagged_1_year, na.rm = TRUE)

interval_size <- 100000  # this is $100 million
step_size <- 20000  # $20 million

start_lower <- interval_size * 0
start_upper <- interval_size * 1

## initialize coefs
t1_coef <- 0
t1_aa_coef <- 0
t1_his_coef <- 0
total_t1_aa <- 0
total_t1_his <- 0


## sb_coef <- 0
## sb_aa_coef <- 0
## sb_his_coef <- 0
## total_sb_aa <- 0
## total_sb_his <- 0

## start counter
i <- 1

while (start_upper + step_size * i < largest_bank){

    panel <- panelOrig[panelOrig$total_assets_lagged_1_year > (start_lower + step_size * i), ]
    panel <- panel[panelOrig$total_assets_lagged_1_year < (start_upper + step_size * i), ]

    tryCatch({

        FEmodel1 <- plm(amt_CI_250_1000_SB_loans_Delt ~  t1_LR_lagged_1_year + less_100_lagged_SB_loans_TA + ROA + NPA_TA + I(log(panel$total_assets_lagged_1_year)) + TD_TA + I(post_crisis_ind) + I(t1_LR_lagged_1_year * black_ind) + I(t1_LR_lagged_1_year * hispanic_ind), data = panel, model = "within", effect = "twoways")


        result1 <- summary(FEmodel1)

        t1_coef[i] <- result1$coefficients[rownames(result1$coefficients) == "t1_LR_lagged_1_year"][1]
        t1_aa_coef[i] <- result1$coefficients[rownames(result1$coefficients) == "I(t1_LR_lagged_1_year * black_ind)"][1]
        t1_his_coef[i] <- result1$coefficients[rownames(result1$coefficients) == "I(t1_LR_lagged_1_year * hispanic_ind)"][1]

        total_t1_aa[i] <- t1_coef[i] + t1_aa_coef[i]
        total_t1_his[i] <- t1_coef[i] + t1_his_coef[i]


        ## sb_coef[i] <- result1$coefficients[rownames(result1$coefficients) == "less_100_lagged_SB_loans_TA"][1]
        ## sb_aa_coef[i] <- result1$coefficients[rownames(result1$coefficients) == "I(black_ind * less_100_lagged_SB_loans_TA)"][1]
        ## sb_his_coef[i] <- result1$coefficients[rownames(result1$coefficients) == "I(hispanic_ind * less_100_lagged_SB_loans_TA)"][1]

        ## total_sb_aa[i] <- sb_coef[i] + sb_aa_coef[i]
        ## total_sb_his[i] <- sb_coef[i] + sb_his_coef[i]
    },
    error = function(cond){return(NA)}
    )

    ## output to see if all is OK
    print(i)
    print(t1_coef[i])
    print(total_t1_aa[i])
    print(total_t1_his[i])

    ## print(sb_coef[i])
    ## print(total_sb_aa[i])
    ## print(total_sb_his[i])

### increment
    i <- i + 1
    
}

## xaxis <- rep(0, length(t1_coef))
xaxis <- 0
for (k in 1:length(t1_coef)){
          xaxis[k] <- interval_size + step_size * (k - 1)
}

saveRDS(xaxis, "xaxis.rds")
saveRDS(t1_coef, "t1_coef.rds")
saveRDS(total_t1_aa, "total_t1_aa.rds")
saveRDS(total_t1_his, "total_t1_his.rds")
## saveRDS(sb_coef, "sb_coef.rds")
## saveRDS(total_sb_aa, "total_sb_aa.rds")
## saveRDS(total_sb_his, "total_sb_his.rds")

