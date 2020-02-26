affairs <- read.csv(file.choose())
View(affairs)
sum(is.na(affairs))
 colnames(affairs)
 str(affairs)
 affairs[,1]<-as.factor(affairs[,1])
 affairs[,2]<-as.factor(affairs[,2])
 affairs[,3]<-as.factor(affairs[,3])
 affairs[,4]<-as.factor(affairs[,4])
 affairs[,5]<-as.factor(affairs[,5])
 affairs[,6]<-as.factor(affairs[,6])
 affairs[,7]<-as.factor(affairs[,7])
 affairs[,8]<-as.factor(affairs[,8])
 affairs[,9]<-as.factor(affairs[,9])
plot(affairs$gender) 
plot(affairs$age) 
plot(affairs$yearsmarried)
plot(affairs$children)
plot(affairs$religiousness)
plot(affairs$education)
plot(affairs$occupation)
plot(affairs$rating)

model <- glm(affairs~.,data=affairs,family = "binomial")

# To calculate the odds ratio manually we going r going to take exp of coef(model)
exp(coef(model))

# Confusion matrix table 
prob <- predict(model,affairs,type="response")
summary(model)


# Confusion matrix and considering the threshold value as 0.5 
confusion<-table(prob>0.5,affairs$affairs)
confusion
# Model Accuracy 
Accuracy<-sum(diag(confusion)/sum(confusion))
Accuracy 
error<-1-Accuracy
error

# Creating empty vectors to store predicted classes based on threshold value
pred_values <- NULL
yes_no <- NULL

pred_values <- ifelse(prob>=0.5,1,0)
yes_no <- ifelse(prob>=0.5,"yes","no")

# Creating new column to store the above values
affairs[,"prob"] <- prob
affairs[,"pred_values"] <- pred_values
affairs[,"yes_no"] <- yes_no

View(affairs[,c(1,10:12)])

table(affairs$affairs,affairs$pred_values)

