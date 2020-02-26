emp = read.csv("E:/DATA SCIENCE MATERIALS/ASSIGMENTS/simple linear regression/emp_data.csv")
View(emp)
summary(emp)
attach(emp)

plot(Churn_out_rate)
plot(Salary_hike)
boxplot(Churn_out_rate)
boxplot(Salary_hike)
hist(Churn_out_rate)
hist(Salary_hike)



plot(Salary_hike,Churn_out_rate)
cor(Churn_out_rate,Salary_hike)


reg <- lm(Churn_out_rate~Salary_hike, data=emp)
summary(reg)
pred <- predict(reg,interval="predict")
pred
confint(reg,level=0.95)

cor(Churn_out_rate,sqrt(Salary_hike))
plot(sqrt(Salary_hike),Churn_out_rate)
reg_sqrt <- lm(Churn_out_rate~sqrt(Salary_hike), data=emp)
summary(reg_sqrt)



cor(Churn_out_rate,log(Salary_hike))
plot(log(Salary_hike),Churn_out_rate)

reg_log<-lm(Churn_out_rate~log(Salary_hike), data=emp)
summary(reg_log)

cor(log(Churn_out_rate),Salary_hike)
plot(Salary_hike,log(Churn_out_rate))

reg_log<-lm(log(Churn_out_rate)~Salary_hike, data=emp)
summary(reg_log)

cor(Churn_out_rate,Salary_hike*Salary_hike)
plot(Salary_hike*Salary_hike,Churn_out_rate)

sqr<-lm(Churn_out_rate~Salary_hike*Salary_hike, data=emp)
summary(sqr)

predict(reg_log,interval="predict")

confint(reg_log,level=0.95)
