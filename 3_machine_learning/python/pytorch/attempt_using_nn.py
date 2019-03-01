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
os.environ['USE_CUDA'] = 'True'
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

x = torch.tensor(train_inputs.astype(np.float32).values, device = device)
y = torch.tensor(train_output.astype(np.float32).values, device = device)

## to normalize data
# def normalize(x):
#     x_normed = x / x.max(0, keepdim=True)[0]
#     return x_normed

# x = normalize(x)
# y = normalize(y)

# Use the nn package to define our model as a sequence of layers. nn.Sequential
# is a Module which contains other Modules, and applies them in sequence to
# produce its output. Each Linear Module computes output from input using a
# linear function, and holds internal Tensors for its weight and bias.
model = torch.nn.Sequential(
    torch.nn.Linear(D_in, H),
    torch.nn.ReLU(),
    torch.nn.Linear(H, D_out),
)

# The nn package also contains definitions of popular loss functions; in this
# case we will use Mean Squared Error (MSE) as our loss function.
loss_fn = torch.nn.MSELoss(reduction='sum')

learning_rate = 1e-4
for t in range(500):
    # Forward pass: compute predicted y by passing x to the model. Module objects
    # override the __call__ operator so you can call them like functions. When
    # doing so you pass a Tensor of input data to the Module and it produces
    # a Tensor of output data.
    y_pred = model(x)

    # Compute and print loss. We pass Tensors containing the predicted and true
    # values of y, and the loss function returns a Tensor containing the
    # loss.
    loss = loss_fn(y_pred, y)
    print(t, loss.item())

    # Zero the gradients before running the backward pass.
    model.zero_grad()

    # Backward pass: compute gradient of the loss with respect to all the learnable
    # parameters of the model. Internally, the parameters of each Module are stored
    # in Tensors with requires_grad=True, so this call will compute gradients for
    # all learnable parameters in the model.
    loss.backward()

    # Update the weights using gradient descent. Each parameter is a Tensor, so
    # we can access its gradients like we did before.
    with torch.no_grad():
        for param in model.parameters():
            param -= learning_rate * param.grad

## getting error: Expected object of backend CPU but got backend CUDA for argument #4 'mat1'
