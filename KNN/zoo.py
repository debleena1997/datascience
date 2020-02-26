# -*- coding: utf-8 -*-
"""
Created on Thu Feb  6 12:19:15 2020

@author: Lenovo
"""

# -*- coding: utf-8 -*-
"""
Created on Thu Feb  6 12:04:22 2020

@author: Lenovo
"""

 
import pandas as pd
import numpy as np


zoo = pd.read_csv("E:\\DATA SCIENCE MATERIALS\\ASSIGMENTS\KNN\\zoo.csv")

from sklearn.model_selection import train_test_split
train,test = train_test_split(zoo,test_size = 0.2) 

from sklearn.neighbors import KNeighborsClassifier as KNC

# for 3 nearest neighbours 
neigh = KNC(n_neighbors= 3)


neigh.fit(train.iloc[:,1:17],train.iloc[:,17])
 
train_acc1 = np.mean(neigh.predict(train.iloc[:,1:17])==train.iloc[:,17]) 
train_acc1

test_acc1 = np.mean(neigh.predict(test.iloc[:,1:17])==test.iloc[:,17]) 
test_acc1

# for 5 nearest neighbours
neigh = KNC(n_neighbors=5)

neigh.fit(train.iloc[:,1:17],train.iloc[:,17])

train_acc2 = np.mean(neigh.predict(train.iloc[:,1:17])==train.iloc[:,17])
train_acc2

test_acc2 = np.mean(neigh.predict(test.iloc[:,1:17])==test.iloc[:,17])
test_acc2

acc = []

 
for i in range(3,50,2):
    neigh = KNC(n_neighbors=i)
    neigh.fit(train.iloc[:,1:17],train.iloc[:,17])
    train_acc = np.mean(neigh.predict(train.iloc[:,1:17])==train.iloc[:,17])
    test_acc = np.mean(neigh.predict(test.iloc[:,1:17])==test.iloc[:,17])
    acc.append([train_acc,test_acc])



import matplotlib.pyplot as plt 

 
plt.plot(np.arange(3,50,2),[i[0] for i in acc],"bo-")

plt.plot(np.arange(3,50,2),[i[1] for i in acc],"ro-")

