from sklearn import datasets
from sklearn import metrics
from sklearn.neural_network import MLPClassifier
# load iris the datasets
dataset = datasets.load_iris()
# fit a MLP model to the data
model = MLPClassifier()
model.fit(dataset.data, dataset.target)
print model
# make predictions
expected = dataset.target
predicted = model.predict(dataset.data)
# summarize the fit of the model
print metrics.classification_report(expected, predicted)
print metrics.confusion_matrix(expected, predicted)
