install.packages("arules")
data()
library("arules") # Used for building association rules i.e. apriori algorithm
grocery<-read.csv(file.choose())
View(grocery)
movie<-movie[,c(-1,-2,-3,-4,-5)]
class(grocery)
str(grocery)
grocery[,1]<-as.factor(grocery[,1])
grocery[,2]<-as.factor(grocery[,2])
grocery[,3]<-as.factor(grocery[,3])
grocery[,4]<-as.factor(grocery[,4])


groceries<-as(grocery,"transactions")
inspect(groceries[1:10])
summary(groceries)
plot(grocery$citrus.fruit)
plot(grocery$semi.finished.bread)
plot(grocery$margarine)
plot(grocery$ready.soups)



install.packages("arueslViz")
library("arulesViz") # for visualizing rules

# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules

# Building rules using apriori algorithm
arules <- apriori(groceries, parameter = list(support=0.002,confidence=0.6,minlen=3))
arules
inspect(head(sort(arules,by="lift")))  
head(quality(arules))

# Different Ways of Visualizing Rules
plot(arules,jitter=0)
plot(arules,method="grouped")
plot(arules[1:10],method = "graph") # for good visualization try plotting only few rules
arules1<- apriori(groceries, parameter = list(support=0.005,confidence=0.7,minlen=4))
arules1
inspect(head(sort(arules1,by="lift"))) # to view we use inspect 


head(quality(arules1))

# Different Ways of Visualizing Rules
plot(arules1,jitter=0)
plot(arules1,method="grouped")
plot(arules1[1:10],method = "graph") 

arules3 <- apriori(groceries, parameter = list(support=0.006,confidence=0.4,minlen=4))
arules3
inspect(head(sort(arules3,by="lift"))) # to view we use inspect 
head(quality(arules3))

# Different Ways of Visualizing Rules
plot(arules3,jitter=0)
windows()
plot(arules3,method="grouped")
plot(arules3[1:10],method = "graph") 

