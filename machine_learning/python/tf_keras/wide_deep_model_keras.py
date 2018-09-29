
import tensorflow as tf
import rpy2.robjects as robjects
from rpy2.robjects import pandas2ri
pandas2ri.activate()
# import requests

import tensorflow

## translate the following to python-------

## the below tries to read from github --- just pasted file into filder for now
# panelOrig <- readRDS(url("https://github.com/Matt-Brigida/FFIEC_Call_Reports/blob/master/querying_data_and_analysis/analyses/panel_data_analysis/full_panel/1_panel_with_full_quarter_date/1_one_panel_all_models/full_panel.rds?raw=true"))
# r = requests.get( "https://github.com/Matt-Brigida/FFIEC_Call_Reports/blob/master/querying_data_and_analysis/analyses/panel_data_analysis/full_panel/1_panel_with_full_quarter_date/1_one_panel_all_models/full_panel.rds?raw=true")


readRDS = robjects.r['readRDS']
df = readRDS('full_panel.rds')
df = pandas2ri.ri2py(df)


df.head()
df1 = df[["quarter", "totSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind"]]

df1.head()

df2 = df1.dropna(how='any')

df2.head()
