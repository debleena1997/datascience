cal = read.csv("E:/DATA SCIENCE MATERIALS/ASSIGMENTS/simple linear regression/calories_consumed.csv")
View(cal)
 summary(cal)

plot(cal$Calories.Consumed)
plot(cal$Weight.gained..grams.)
boxplot(cal$Calories.Consumed)
boxplot(cal$Weight.gained..grams.)
hist(cal$Calories.Consumed)
hist(cal$Weight.gained..grams.)


attach(cal)
plot(Calories.Consumed,Weight.gained..grams.)
cor(Weight.gained..grams.,Calories.Consumed)


reg <- lm(Weight.gained..grams.~Calories.Consumed, data=cal)
summary(reg)
pred <- predict(reg,interval="predict")
pred
confint(reg,level=0.95)

cor(Weight.gained..grams.,sqrt(Calories.Consumed))
plot(sqrt(Calories.Consumed),Weight.gained..grams.)
reg_sqrt <- lm(Weight.gained..grams.~sqrt(Calories.Consumed), data=cal)
summary(reg_sqrt)



cor(Weight.gained..grams.,log(Calories.Consumed))
plot(log(Calories.Consumed),Weight.gained..grams.)

reg_log<-lm(Weight.gained..grams.~log(Calories.Consumed), data=cal)
summary(reg_log)
