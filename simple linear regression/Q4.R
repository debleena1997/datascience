sal = read.csv("E:/DATA SCIENCE MATERIALS/ASSIGMENTS/simple linear regression/Salary_Data.csv")
View(sal)
summary(sal)
attach(sal)

plot(Salary)
plot(YearsExperience)
boxplot(Salary)
boxplot(YearsExperience)
hist(Salary)
hist(YearsExperience)



plot(YearsExperience,Salary)
cor(Salary,YearsExperience)


reg <- lm(Salary~YearsExperience, data=sal)
summary(reg)
pred <- predict(reg,interval="predict")
pred
confint(reg,level=0.95)

cor(Salary,sqrt(YearsExperience))
plot(sqrt(YearsExperience),Salary)
reg_sqrt <- lm(Salary~sqrt(YearsExperience), data=sal)
summary(reg_sqrt)



cor(Salary,log(YearsExperience))
plot(log(YearsExperience),Salary)

reg_log<-lm(Salary~log(YearsExperience), data=sal)
summary(reg_log)

cor(log(Salary),YearsExperience)
plot(YearsExperience,log(Salary))

reg_log<-lm(log(Salary)~YearsExperience, data=sal)
summary(reg_log)

cor(Salary,YearsExperience*YearsExperience)
plot(YearsExperience*YearsExperience,Salary)

sqr<-lm(Salary~YearsExperience*YearsExperience, data=sal)
summary(sqr)

predict(reg_log,interval="predict")

confint(reg_log,level=0.95)
