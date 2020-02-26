price= read.csv(file.choose())
View(price)

attach(price)
summary(price) # Explore the data

plot(Age_08_04,Price)# Plot relation ships between each X with Y
hist(price$Age_08_04)
plot(KM,Price)
hist(price$KM)
plot(HP,Price)
hist(price$HP)
plot(cc,Price)
hist(price$cc)
plot(Doors,Price)
hist(price$Doors)
plot(Gears,Price)
hist(price$Gears)
plot(Quarterly_Tax,Price)
hist(price$Quarterly_Tax)
plot(Weight,Price)
hist(price$Weight)

cor(price)
# The Linear Model of interest
model.price <- lm(Price~Age_08_04+KM+HP+cc+Doors++Gears+Quarterly_Tax+Weight)
#model.car = lm(Mpg~.,data = )
# lm(Y ~ X)
summary(model.price)
error = model.price$residuals
pred = predict(model.price,price)
?predict
View(pred)
conf_value = confint(model.price,level = 0.95)

model.pricecc<-lm(Price~cc)
summary(model.pricecc)

model.priced <- lm(Price~Doors)
summary(model.priced)

model.pricecd <- lm(Price~cc+Doors)
summary(model.pricecd)

# Diagnostic Plots
install.packages("carData")
library(car)
plot(model.price)# Residual Plots, QQ-Plos, Std. Residuals vs Fitted, Cook's distance
qqPlot(model.price, id.n=5) # QQ plots of studentized residuals, helps identify outliers

# Deletion Diagnostics for identifying influential variable
influence.measures(model.price)
influenceIndexPlot(model.price) # Index Plots of the influence measures
influencePlot(model.price) # A user friendly representation of the above

## Regression after deleting the 77th observation
model.price1<-lm(Price~Age_08_04+KM+HP+cc+Doors+Gears+Quarterly_Tax+Weight, data=price[-81,-222,-961])
summary(model.price1)


### Variance Inflation Factors
vif(model.price)  # VIF is > 10 => collinearity
#### Added Variable Plots ######
avPlots(model.price, id.n=2, id.cex=0.8, col="red")
?avPlot

library("MASS")
stepAIC(model.price) # backward

plot(model.price)

model.final <- lm(Price~Age_08_04+KM+HP+Gears+Quarterly_Tax+Weight, data=price)
summary(model.final)


model.final1 <- lm(Price~Age_08_04+KM+HP+Gears+Quarterly_Tax+Weight, data=price[-81,-222,-961])
summary(model.final1)

avPlots(model.final1, id.n=2, id.cex=0.8, col="red")

vif(model.final1)
