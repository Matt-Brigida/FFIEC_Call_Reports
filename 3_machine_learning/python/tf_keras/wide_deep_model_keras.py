
import tensorflow as tf
from keras.models import Sequential
from keras.layers import Dense, Activation
import rpy2.robjects as robjects
from rpy2.robjects import pandas2ri
pandas2ri.activate()
# import requests
import numpy as np
import tensorflow as tf
from tensorflow import keras
import scipy as sc
from scipy import stats
from sklearn.model_selection import train_test_split
import seaborn as sns
import matplotlib.pyplot as plt

import os
cwd = os.getcwd()
print(cwd)

## read in data
readRDS = robjects.r['readRDS']
# df = readRDS('./3_machine_learning/python/tf_keras/full_panel.rds')
df = readRDS('./full_panel.rds')
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

## look at data
df2.head()

## TODO: convert indicators to one hots???


## removed "IDRSSD", "quarter",
inputs = df2[["t1_LR_lagged_1_year", "tot_SB_loans_TA_lagged_1", "ROA_lagged_1", "NPA_TA_lagged_1", "total_assets_lagged_1_year", "TD_TA_lagged_1", "african_am_ind", "hispanic_ind", "de_novo", "TETA_lagged_1_year", "post_crisis_ind", "fin_crisis_ind"]]

output = df2[["totSBloans_Delt"]]

## visualize
sns.pairplot(inputs[["t1_LR_lagged_1_year", "ROA_lagged_1", "tot_SB_loans_TA_lagged_1", "NPA_TA_lagged_1"]], diag_kind="kde")
plt.show()

## divide into training and testing data total_assets_lagged_1_year

X_train, X_test, y_train, y_test = train_test_split(inputs, output, test_size=0.33)

model = Sequential()
model.add(Dense(100, input_dim=12))
model.add(Activation('relu'))
model.add(Dense(100))
model.add(Activation('relu'))
model.add(Dense(100))
model.add(Activation('relu'))
model.add(Dense(1))
model.add(Activation('linear'))

## compile
model.compile(optimizer='rmsprop',
              loss='mse')

model.fit(X_train, y_train,
          batch_size=100, epochs=25, shuffle=False,
          validation_data=(X_test, y_test))

score = model.evaluate(X_test, y_test, batch_size=128)

## here we need to plot predicted vs actual values

## all predicted values are the same
model.predict(X_test, verbose = 1)



print(score)

from keras.utils import plot_model
plot_model(model, to_file='./3_machine_learning/python/tf_keras/model.png')

history = model.fit(inputs, output, validation_split=0.25, epochs=50, batch_size=16, verbose=1)

# Plot training & validation accuracy values
## doens't work, no 'acc'
# plt.plot(history.history['acc'])
# plt.plot(history.history['val_acc'])
# plt.title('Model accuracy')
# plt.ylabel('Accuracy')
# plt.xlabel('Epoch')
# plt.legend(['Train', 'Test'], loc='upper left')
# plt.show()

plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('Model loss')
plt.ylabel('Loss')
plt.xlabel('Epoch')
plt.legend(['Train', 'Test'], loc='upper left')
plt.show()
