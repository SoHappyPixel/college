# A
print "A:"
from sklearn import datasets
from sklearn import metrics

from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier

from sklearn.model_selection import cross_val_predict

model1 = SVC()
model2 = RandomForestClassifier()
# load dataset
iris = datasets.load_iris()
# calculate accuracy
predicted1 = cross_val_predict(model1, iris.data, iris.target, cv=10)
predicted2 = cross_val_predict(model2, iris.data, iris.target, cv=10)
# print accuracy
print "SVM          = {}".format(metrics.accuracy_score(iris.target, predicted1))
print "RAND_FOREST  = {}".format(metrics.accuracy_score(iris.target, predicted2))


# B
print "\nB:"
import numpy as np
from random import randint
from sklearn.model_selection import KFold

# generate model with more than 10 items.
dataset = [x*x for x in range( randint(10,25) )]

# k-fold with k=10.
kf = KFold(n_splits=10)
for train, test in kf.split(dataset):
    print("%s %s" % (train, test))
