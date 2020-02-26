del = read.csv("E:/DATA SCIENCE MATERIALS/ASSIGMENTS/simple linear regression/delivery_time.csv")
View(del)
summary(del)
attach(del)

plot(Delivery.Time)
plot(Sorting.Time)
boxplot(Delivery.Time)
boxplot(Sorting.Time)
hist(Delivery.Time)
hist(Sorting.Time)



plot(Sorting.Time,Delivery.Time)
cor(Delivery.Time,Sorting.Time)


reg <- lm(Delivery.Time~Sorting.Time, data=del)
summary(reg)
pred <- predict(reg,interval="predict")
pred
confint(reg,level=0.95)

cor(Delivery.Time,sqrt(Sorting.Time))
plot(sqrt(Sorting.Time),Delivery.Time)
reg_sqrt <- lm(Delivery.Time~sqrt(Sorting.Time), data=del)
summary(reg_sqrt)



cor(Delivery.Time,log(Sorting.Time))
plot(log(Sorting.Time),Delivery.Time)

reg_log<-lm(Delivery.Time~log(Sorting.Time), data=del)
summary(reg_log)

cor(log(Delivery.Time),Sorting.Time)
plot(Sorting.Time,log(Delivery.Time))

reg_log<-lm(log(Delivery.Time)~Sorting.Time, data=del)
summary(reg_log)

cor(Delivery.Time,Sorting.Time*Sorting.Time)
plot(Sorting.Time*Sorting.Time,Delivery.Time)

sqr<-lm(Delivery.Time~Sorting.Time*Sorting.Time, data=del)
summary(sqr)

predict(reg_log,interval="predict")

confint(reg_log,level=0.95)
