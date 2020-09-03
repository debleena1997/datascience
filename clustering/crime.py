# -*- coding: utf-8 -*-
"""
Created on Wed Feb  5 15:18:48 2020

@author: Lenovo
"""

import pandas as pd
import matplotlib.pyplot as plt 
from sklearn.cluster import	KMeans
from scipy.spatial.distance import cdist 
import numpy as np

crime = pd.read_csv("E:\\DATA SCIENCE MATERIALS\\ASSIGMENTS\\clustering\\crime_data.csv")
print(crime.dtypes)





# Normalization function 
def norm_func(i):
    x = (i-i.min())	/	(i.max()	-	i.min())
    return (x)

df_norm = norm_func(crime.iloc[:,1:])
df_norm.describe()


from scipy.cluster.hierarchy import linkage 
import scipy.cluster.hierarchy as sch # for creating dendrogram 


z = linkage(df_norm, method="complete",metric="euclidean")


plt.figure(figsize=(15, 5));plt.title('Hierarchical Clustering Dendrogram');plt.xlabel('Index');plt.ylabel('Distance')
sch.dendrogram(
    z,
    leaf_rotation=0.,  
    leaf_font_size=8.,  
)
plt.show()


from sklearn.cluster import	AgglomerativeClustering 
h_complete	=	AgglomerativeClustering(n_clusters=3,linkage='complete',affinity = "euclidean").fit(df_norm) 

h_complete.labels_

cluster_labels=pd.Series(h_complete.labels_)

crime['clust']=cluster_labels  
crime= crime.iloc[:,[5,0,1,2,3,4]]
crime.head()


crime.groupby(crime.clust).mean()

# k mean clustering

###### screw plot or elbow curve ############
k = list(range(2,15))
k
TWSS = []  
for i in k:
    kmeans = KMeans(n_clusters = i)
    kmeans.fit(df_norm)
    WSS = []  
    for j in range(i):
        WSS.append(sum(cdist(df_norm.iloc[kmeans.labels_==j,:],kmeans.cluster_centers_[j].reshape(1,df_norm.shape[1]),"euclidean")))
    TWSS.append(sum(WSS))


# Scree plot 
plt.plot(k,TWSS, 'ro-');plt.xlabel("No_of_Clusters");plt.ylabel("total_within_SS");plt.xticks(k)

 
model=KMeans(n_clusters=4) 
model.fit(df_norm)

model.labels_ 
md=pd.Series(model.labels_) 
crime['clust']=md
crime.iloc[:,1:5].groupby(crime.clust).mean()

