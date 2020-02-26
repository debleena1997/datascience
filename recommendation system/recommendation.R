#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
install.packages("Matrix")
library("recommenderlab")
library(caTools)


book <- read.csv(file.choose())
View(book)
book<-book[,-1]
View(book)
#metadata about the variable
str(book)


#rating distribution

hist(book$ratings...3.)
boxplot(book$ratings...3.)
plot(book$ratings...3.)
#the datatype should be realRatingMatrix inorder to build recommendation engine
book_matrix <- as(book, 'realRatingMatrix')
View(book_matrix)

#Popularity based 

book_model1 <- Recommender(book_matrix, method="POPULAR")

#Predictions for two users 
book_items1 <- predict(book_model1, book_matrix[2], n=1)
as(book_items1, "list")

?Recommender
## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

book_model2 <- Recommender(book_matrix, method="UBCF")

#Predictions for two users 
book_items2 <- predict(book_model2, book_matrix[1], n=1)
as(book_items2, "list")

book_model3<- Recommender(book_matrix, method="IBCF")


book_items3 <- predict(book_model3, book_matrix[1], n=1)
as(book_items3, "list")

?Recommender

