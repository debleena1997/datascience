# -*- coding: utf-8 -*-
"""
Created on Thu Feb  6 09:35:11 2020

@author: Lenovo
"""

import pandas as pd 
import numpy as np
wine = pd.read_csv("E:\DATA SCIENCE MATERIALS\ASSIGMENTS\principal component analysis\\wine.csv")
wine.describe()
wine.head()

from sklearn.decomposition import PCA
import matplotlib.pyplot as plt
from sklearn.preprocessing import scale 

# Considering only numerical data 
wine.data = wine.iloc[:,1:]
wine.data.head(4)

# Normalizing the numerical data 
wine_normal = scale(wine.data)

pca = PCA(n_components = 6)
pca_values = pca.fit_transform(wine_normal)


# The amount of variance that each PCA explains is 
var = pca.explained_variance_ratio_
var
pca.components_[0]

# Cumulative variance 

var1 = np.cumsum(np.round(var,decimals = 4)*100)
var1

# Variance plot for PCA components obtained 
plt.plot(var1,color="red")

# plot between PCA1 and PCA2 
x = pca_values[:,0]
y = pca_values[:,1]
plt.scatter(x,y,color=["red"])


################### Clustering  ##########################
new_df = pd.DataFrame(pca_values[:,0:3])
new_df.head()
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt 
from scipy.spatial.distance import cdist 


def norm_func(i):
    x = (i-i.min())	/	(i.max()	-	i.min())
    return (x)

df_norm = norm_func(new_df.iloc[:,1:])
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

new_df['clust']=cluster_labels  
new_df= new_df.iloc[:,[3,0,1,2]]
new_df.head()


new_df.groupby(new_df.clust).mean()

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

 
model=KMeans(n_clusters=3) 
model.fit(df_norm)


