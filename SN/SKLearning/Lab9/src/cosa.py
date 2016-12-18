import numpy as np
import pandas as pd

input_file = "train.csv"
# comma delimited is the default
df = pd.read_csv(input_file, header = 0)
# put the original column names in a python list
original_headers = list(df.columns.values)
# remove the non-numeric columns
df = df._get_numeric_data()
# put the numeric column names in a python list
numeric_headers = list(df.columns.values)
# create a numpy array with the numeric values for input into scikit-learn
numpy_array = df.as_matrix()

from sklearn import datasets
from sklearn import metrics
from sklearn.tree import DecisionTreeClassifier
# load the datasets
dataset = numpy_array
# fit a CART model to the data
model = DecisionTreeClassifier()
model.fit(dataset.data, dataset.target)
print model
# make predictions
expected = dataset.target
predicted = model.predict(dataset.data)
# summarize the fit of the model
print metrics.classification_report(expected, predicted)
print metrics.confusion_matrix(expected, predicted)
