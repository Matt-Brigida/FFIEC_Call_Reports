import pandas as pd
pd.set_option('display.max_columns', None)

import os

print(os.getcwd())

os.chdir("./1_querying_data_and_analysis/analyses/panel_data_analysis/full_panel/1_panel_with_full_quarter_date/1_one_panel_all_models/de_novo_stats/")

panel = pd.read_csv("../full_panel.csv")

panel = panel[["quarter", "totSBloans_Delt", "totNumSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind"]]

de_novo = panel[panel.de_novo == 0]

not_de_novo = panel[panel.de_novo == 1]

de_novo.describe()

#             quarter  totSBloans_Delt  totNumSBloans_Delt  t1_LR_lagged_1_year  \
# count  6.758020e+05    201353.000000       201354.000000        436488.000000   
# mean   2.008798e+07         0.012982            0.128181             0.113867   
# std    4.803022e+04         4.735902           45.203468             0.338048   
# min    2.001033e+07        -1.000000           -1.000000            -5.194700   
# 25%    2.005033e+07        -0.094884           -0.093750             0.083100   
# 50%    2.009033e+07         0.005010           -0.008032             0.095800   
# 75%    2.013063e+07         0.106791            0.073508             0.115600   
# max    2.017063e+07      1900.000000        19965.000000           213.702100   

#        tot_SB_loans_TA_lagged_1  ROA_lagged_1  NPA_TA_lagged_1  \
# count             215361.000000  4.434260e+05    436530.000000   
# mean                   0.059130          -inf         0.002769   
# std                    0.051908           NaN         0.005404   
# min                    0.000000          -inf         0.000000   
# 25%                    0.025526  2.306127e-03         0.000076   
# 50%                    0.048685  4.855772e-03         0.000947   
# 75%                    0.079830  8.662802e-03         0.003165   
# max                    0.977501  3.617116e+00         0.286936   

#        total_assets_lagged_1_year  TD_TA_lagged_1   de_novo  \
# count                4.434260e+05   443425.000000  675802.0   
# mean                 1.379005e+06        0.818595       0.0   
# std                  2.357088e+07        0.127138       0.0   
# min                  0.000000e+00        0.000000       0.0   
# 25%                  6.207625e+04        0.797955       0.0   
# 50%                  1.316480e+05        0.847122       0.0   
# 75%                  3.046675e+05        0.882394       0.0   
# max                  1.645291e+09        8.829756       0.0   

#        TETA_lagged_1_year  post_crisis_ind  fin_crisis_ind  
# count       436531.000000    675802.000000   675802.000000  
# mean             0.117398         0.237139        0.182132  
# std              0.093590         0.425329        0.385953  
# min             -5.194690         0.000000        0.000000  
# 25%              0.085831         0.000000        0.000000  
# 50%              0.100189         0.000000        0.000000  
# 75%              0.121361         0.000000        0.000000  
# max              1.000495         1.000000        1.000000  


not_de_novo.describe()

#             quarter  totSBloans_Delt  totNumSBloans_Delt  t1_LR_lagged_1_year  \
# count  3.488600e+04     12889.000000        12889.000000         25661.000000   
# mean   2.009554e+07         0.450289            0.521140             0.264983   
# std    3.913952e+04         4.479919            7.236077             0.941288   
# min    2.001063e+07        -1.000000           -1.000000            -0.153200   
# 25%    2.006123e+07        -0.098231           -0.078125             0.101179   
# 50%    2.009093e+07         0.047041            0.048583             0.135500   
# 75%    2.013063e+07         0.302898            0.305556             0.224892   
# max    2.017063e+07       326.410000          703.488372            82.906250   

#        tot_SB_loans_TA_lagged_1  ROA_lagged_1  NPA_TA_lagged_1  \
# count              13435.000000  25760.000000     25664.000000   
# mean                   0.044012     -0.004577         0.001290   
# std                    0.057894      0.271688         0.004855   
# min                    0.000000    -34.710425         0.000000   
# 25%                    0.002745     -0.008321         0.000000   
# 50%                    0.023858      0.000593         0.000000   
# 75%                    0.062495      0.003429         0.000485   
# max                    0.633146     21.719978         0.213893   

#        total_assets_lagged_1_year  TD_TA_lagged_1  de_novo  \
# count                2.576100e+04    25760.000000  34886.0   
# mean                 8.204095e+05        0.725827      1.0   
# std                  5.563495e+06        0.214051      0.0   
# min                  0.000000e+00        0.000000      1.0   
# 25%                  4.309000e+04        0.696965      1.0   
# 50%                  9.205300e+04        0.796028      1.0   
# 75%                  1.991770e+05        0.855285      1.0   
# max                  1.630660e+08        1.056059      1.0   

#        TETA_lagged_1_year  post_crisis_ind  fin_crisis_ind  
# count        25664.000000     34886.000000    34886.000000  
# mean             0.210612         0.344809        0.175744  
# std              0.196319         0.475313        0.380608  
# min             -0.234221         0.000000        0.000000  
# 25%              0.102722         0.000000        0.000000  
# 50%              0.135633         0.000000        0.000000  
# 75%              0.213563         1.000000        0.000000  
# max              1.000000         1.000000        1.000000  
