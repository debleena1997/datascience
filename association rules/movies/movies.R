install.packages("arules")
data()
library("arules") # Used for building association rules i.e. apriori algorithm
movie<-read.csv(file.choose())
View(movie)
movie<-movie[,c(-1,-2,-3,-4,-5)]
class(movie)
str(movie)
movie[,1]<-as.factor(movie[,1])
movie[,2]<-as.factor(movie[,2])
movie[,3]<-as.factor(movie[,3])
movie[,4]<-as.factor(movie[,4])
movie[,5]<-as.factor(movie[,5])
movie[,6]<-as.factor(movie[,6])
movie[,7]<-as.factor(movie[,7])
movie[,8]<-as.factor(movie[,8])
movie[,9]<-as.factor(movie[,9])
movie[,10]<-as.factor(movie[,10])

movies<-as(movie,"transactions")
inspect(movies[1:10])
summary(movies)
plot(movie$Sixth.Sense)
plot(movie$Gladiator)
plot(movie$LOTR1)
plot(movie$Harry.Potter1)
plot(movie$Patriot)
plot(movie$LOTR2)
plot(movie$Harry.Potter2)
plot(movie$LOTR)
plot(movie$Braveheart)
plot(movie$Green.Mile)


install.packages("arueslViz")
library("arulesViz") # for visualizing rules

# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules

# Building rules using apriori algorithm
arules <- apriori(movies, parameter = list(support=0.002,confidence=0.6,minlen=3))
arules
inspect(head(sort(arules,by="lift")))  
head(quality(arules))

# Different Ways of Visualizing Rules
plot(arules,jitter=0)
plot(arules,method="grouped")
plot(arules[1:10],method = "graph") # for good visualization try plotting only few rules
arules1<- apriori(movies, parameter = list(support=0.005,confidence=0.7,minlen=4))
arules1
inspect(head(sort(arules1,by="lift"))) # to view we use inspect 


head(quality(arules1))

# Different Ways of Visualizing Rules
plot(arules1,jitter=0)
plot(arules1,method="grouped")
plot(arules1[1:10],method = "graph") 

arules3 <- apriori(movies, parameter = list(support=0.006,confidence=0.5,minlen=5))
arules3
inspect(head(sort(arules3,by="lift"))) # to view we use inspect 
head(quality(arules3))

# Different Ways of Visualizing Rules
plot(arules3,jitter=0)
windows()
plot(arules3,method="grouped")
plot(arules3[1:10],method = "graph") 

