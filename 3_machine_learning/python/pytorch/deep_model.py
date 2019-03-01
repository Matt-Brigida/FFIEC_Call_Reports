## Load libraries
import rpy2.robjects as robjects
from rpy2.robjects import pandas2ri
pandas2ri.activate()
# import requests
import numpy as np
import scipy as sc
from scipy import stats
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.utils.data.dataset import Dataset

## check the working directory
import os
cwd = os.getcwd()
print(cwd)

## read in data
readRDS = robjects.r['readRDS']
df = readRDS('./3_machine_learning/python/tf_keras/full_panel.rds')
# df = readRDS('../tf_keras/full_panel.rds')
df = pandas2ri.ri2py(df)

df1 = df[["IDRSSD", "quarter", "totSBloans_Delt", "t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind"]]

df2 = df1.dropna(how='any')

## create interaction and transformed variables --------

df2['T1_AA_Int'] = df2['t1_LR_lagged_1_year'] * df2['african_am_ind']
df2['T1_H_Int'] = df2['t1_LR_lagged_1_year'] * df2['hispanic_ind']

# df2['SB_H_Int'] = df2['tot_SB_loans_TA_lagged_1'] * df2['hispanic_ind']
df2['LN_TA'] = np.log(df2['total_assets_lagged_1_year'])

## now orthogonalize TE wrt t1 leverage ratio----
slope, intercept, r_value, p_value, std_err = stats.linregress(df2["t1_LR_lagged_1_year"], df2["TETA_lagged_1_year"])

# This calculates the predicted value for each observed value
obs_values = df2["t1_LR_lagged_1_year"]
pred_values = slope * df2["TETA_lagged_1_year"] + intercept

# This prints the residual for each pair of observations
df2["t1_LR_ortho"] = obs_values - pred_values
print(df2["t1_LR_ortho"])


df2.head()

## divide into training and testing data total_assets_lagged_1_year


train_size = int(0.8 * len(df2))
test_size = len(df2) - train_size
train_dataset, test_dataset = torch.utils.data.random_split(df2, [train_size, test_size])

## removed "IDRSSD", "quarter",
train_inputs = train_dataset.dataset[["t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind"]]

train_output = train_dataset.dataset[["totSBloans_Delt"]]

dtype = torch.float
device = torch.device("cuda:0")

# N is batch size; D_in is input dimension;
# H is hidden dimension; D_out is output dimension.
N, D_in, H, D_out = 200, 12, 100, 1

# Randomly initialize weights
w1 = torch.randn(D_in, H, device=device, dtype=dtype).float()
w2 = torch.randn(H, D_out, device=device, dtype=dtype).float()

x = torch.tensor(train_inputs.astype(np.float32).values, device = device)
y = torch.tensor(train_output.astype(np.float32).values, device = device)

## to normalize data
def normalize(x):
    x_normed = x / x.max(0, keepdim=True)[0]
    return x_normed

x = normalize(x)
y = normalize(y)

learning_rate = 1e-6
for t in range(100):
    # Forward pass: compute predicted y
    h = x.mm(w1)
    h_relu = h.clamp(min=0)
    y_pred = h_relu.mm(w2)

    # Compute and print loss
    loss = (y_pred - y).pow(2).sum().item()
    print(t, loss)

    # Backprop to compute gradients of w1 and w2 with respect to loss
    grad_y_pred = 2.0 * (y_pred - y)
    grad_w2 = h_relu.t().mm(grad_y_pred)
    grad_h_relu = grad_y_pred.mm(w2.t())
    grad_h = grad_h_relu.clone()
    grad_h[h < 0] = 0
    grad_w1 = x.t().mm(grad_h)

    # Update weights using gradient descent
    w1 -= learning_rate * grad_w1
    w2 -= learning_rate * grad_w2


## nan loss :/
