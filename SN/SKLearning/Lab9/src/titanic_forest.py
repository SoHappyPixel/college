import pandas as pd
from sklearn.preprocessing import Imputer
from sklearn.tree import DecisionTreeClassifier
from sklearn.cross_validation import cross_val_score

# MODEL !
RF = DecisionTreeClassifier()

# TRAIN !
trainner = pd.read_csv("train.csv")
trainner["Sex"] = trainner["Sex"].apply(lambda sex: 0 if sex == "male" else 1)

in_data = ["Fare", "Pclass", "Sex"]
bool_value = trainner["Survived"].values
data_values = trainner[list(in_data)].values

RF_score = cross_val_score(RF, data_values, bool_value).mean()

print("{0} -> ET: {1}\n".format(in_data, RF_score))

# PREDICT !

testter = pd.read_csv('test.csv')
testter["Sex"] = testter["Sex"].apply(lambda sex: 0 if sex == "male" else 1)

formatter = Imputer(missing_values='NaN', strategy='mean', axis=0)

formatter.fit(data_values)
RF.fit(data_values,bool_value)

print RF.predict(formatter.transform(testter[in_data].values))
