# -*- coding: utf-8 -*-
"""
Created on Wed Feb  5 20:53:16 2020

@author: Lenovo
"""

import pandas as pd
import seaborn as sb

from sklearn.linear_model import LogisticRegression


bank = pd.read_csv("E:\\DATA SCIENCE MATERIALS\\ASSIGMENTS\\Logistic regression\\bank-full.csv")

bank.head(10)

print(bank.dtype)
# Getting the barplot for the categorical columns 

sb.countplot(x="y",data=bank)
pd.crosstab(bank.y,bank.job).plot(kind="bar")
sb.countplot(x="marital",data=bank)
pd.crosstab(bank.marital,bank.job).plot(kind="bar")
sb.countplot(x="education",data=bank,)
pd.crosstab(bank.education,bank.job).plot(kind="bar")

sb.countplot(x="default",data=bank)
sb.countplot(x="housing",data=bank)
sb.countplot(x="loan",data=bank)
sb.countplot(x="month",data=bank)
sb.countplot(x="contact",data=bank)
sb.countplot(x="poutcome",data=bank)


# Data Distribution - Boxplot of continuous variables wrt to each category of categorical columns

sb.boxplot(data =bank,orient = "v")
sb.boxplot(x="y",y="age",data=bank,palette = "hls")
sb.boxplot(x="marital",y="balance",data=bank,palette="hls")
sb.boxplot(x="education",y="day",data=bank,palette="hls")
sb.boxplot(x="default",y="duration",data=bank,palette="hls")
sb.boxplot(x="housing",y="campaign",data=bank,palette="hls")
sb.boxplot(x="loan",y="pdays",data=bank,palette="hls")
sb.boxplot(x="month",y="previous",data=bank,palette="hls")
sb.boxplot(x="contact",y="pdays",data=bank,palette="hls")

# To get the count of null values in the data 

bank.isnull().sum()

names = list(bank.columns)
bank_dummies = pd.get_dummies(bank[["job","marital","education","default","housing","loan","month","contact","poutcome","y"]])
# Dropping the columns for which we have created dummies
bank.drop(["job","marital","education","default","housing","loan","month","contact","poutcome","y"],inplace=True,axis = 1)

# adding the columns to the salary data frame 

bank= pd.concat([bank,bank_dummies],axis=1)



# Model building 


bank.shape
X = bank.iloc[:,[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
Y = bank.iloc[:,16]
classifier = LogisticRegression()
classifier.fit(X,Y)

classifier.coef_ # coefficients of features 
classifier.predict_proba (X) # Probability values 

y_pred = classifier.predict(X)
bank["y_pred"] = y_pred
y_prob = pd.DataFrame(classifier.predict_proba(X.iloc[:,:]))
new_df = pd.concat([bank,y_prob],axis=1)
from sklearn.metrics import confusion_matrix
confusion_matrix = confusion_matrix(Y,y_pred)
print (confusion_matrix)
