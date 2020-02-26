profit= read.csv(file.choose())
View(profit)


install.packages("psych")
library(psych)
state_dummy <- dummy.code(profit$State, group = NULL)
profit <- as.data.frame(cbind(profit,state_dummy))
attach(profit)
summary(profit) 
str(profit)
profit<-profit[,-4]
View(profit)

#EDA
plot(R.D.Spend,Profit) 
hist(profit$R.D.Spend)
plot(Administration,Profit)
hist(profit$Administration)
plot(Marketing.Spend,Profit)
hist(profit$Marketing.Spend)
plot(California,Profit)
hist(profit$California)
plot(`New York`,Profit)
hist(profit$`New York`)
plot(Florida,Profit)
hist(profit$Florida)

cor(profit)
#MODEL BUILDING
#MODEL 1
model.profit <- lm(Profit~R.D.Spend+Administration+Marketing.Spend+California+`New York`+Florida)
summary(model.profit)
error = model.profit$residuals
pred = predict(model.profit,profit)
View(pred)
conf_value = confint(model.profit,level = 0.95)

#MODEL 2
model.profitad<-lm(Profit~Administration)
summary(model.profitad)

#MODEL 3
model.profitmar <- lm(Profit~Marketing.Spend)
summary(model.profitmar)

#MODEL 4
model.profitadmar <- lm(Profit~Administration+Marketing.Spend)
summary(model.profitadmar)

#MODEL 5
model.profit1 <- lm(Profit~R.D.Spend+Marketing.Spend+California+`New York`+Florida)
summary(model.profit1)

#MODEL 6
model.profit2 <- lm(Profit~R.D.Spend+Administration+California+`New York`+Florida)
summary(model.profit2)

# MODEL 7
model.profit3 <- lm(Profit~R.D.Spend+California+`New York`+Florida)
summary(model.profit3)
# Diagnostic Plots
install.packages("carData")
library(car)
plot(model.profit)
qqPlot(model.profit, id.n=5)

influence.measures(model.profit)
influenceIndexPlot(model.profit)
influencePlot(model.profit) 


model.profit5<-lm(Profit~R.D.Spend+Marketing.Spend+Administration, data=profit[-49,-50])
summary(model.profit5)
library("MASS")
stepAIC(model.profit)

# MODEL 8
model.profit4<-lm(Profit~R.D.Spend+Marketing.Spend, data=profit[-49,-50])
summary(model.profit4)


### Variance Inflation Factors
vif(model.profit)  # VIF is > 10 => collinearity
#### Added Variable Plots ######
avPlots(model.profit, id.n=2, id.cex=0.8, col="red")
?avPlot

