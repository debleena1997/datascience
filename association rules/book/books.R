install.packages("arules")
data()
library("arules") # Used for building association rules i.e. apriori algorithm
book<-read.csv(file.choose())
View(book)
class(book)
str(book)
book[,1]<-as.factor(book[,1])
book[,2]<-as.factor(book[,2])
book[,3]<-as.factor(book[,3])
book[,4]<-as.factor(book[,4])
book[,5]<-as.factor(book[,5])
book[,6]<-as.factor(book[,6])
book[,7]<-as.factor(book[,7])
book[,8]<-as.factor(book[,8])
book[,9]<-as.factor(book[,9])
book[,10]<-as.factor(book[,10])
book[,11]<-as.factor(book[,11])
books<-as(book,"transactions")
inspect(books[1:10])
summary(books)
plot(book$ChildBks)
plot(book$YouthBks)
plot(book$CookBks)
plot(book$DoItYBks)
plot(book$RefBks)
plot(book$ArtBks)
plot(book$GeogBks)
plot(book$ItalCook)
plot(book$ItalAtlas)
plot(book$ItalArt)
plot(book$Florence)

install.packages("arueslViz")
library("arulesViz") # for visualizing rules

# making rules using apriori algorithm 
# Keep changing support and confidence values to obtain different rules

# Building rules using apriori algorithm
arules <- apriori(books, parameter = list(support=0.002,confidence=0.6,minlen=3))
arules
inspect(head(sort(arules,by="lift")))  
head(quality(arules))

# Different Ways of Visualizing Rules
plot(arules,jitter=0)
plot(arules,method="grouped")
plot(arules[1:10],method = "graph") # for good visualization try plotting only few rules
arules1<- apriori(books, parameter = list(support=0.005,confidence=0.7,minlen=4))
arules1
inspect(head(sort(arules1,by="lift"))) # to view we use inspect 

 
head(quality(arules1))

# Different Ways of Visualizing Rules
plot(arules1,jitter=0)
plot(arules1,method="grouped")
plot(arules1[1:10],method = "graph") 

arules3 <- apriori(books, parameter = list(support=0.006,confidence=0.5,minlen=5))
arules3
inspect(head(sort(arules3,by="lift"))) # to view we use inspect 
head(quality(arules3))

# Different Ways of Visualizing Rules
plot(arules3,jitter=0)
windows()
plot(arules3,method="grouped")
plot(arules3[1:10],method = "graph") 

