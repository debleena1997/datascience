Cdata= read.csv(file.choose())
View(Cdata)
install.packages("psych")
library(psych)
cd_dummy <- dummy.code(Cdata$cd, group = NULL)
multi_dummy <- dummy.code(Cdata$multi, group = NULL)
premium_dummy <- dummy.code(Cdata$premium, group = NULL)
Cdata <- as.data.frame(cbind(Cdata,cd_dummy,multi_dummy,premium_dummy))
View(Cdata)
names(Cdata[11])<-"cd_no"
names(Cdata[12])<-"cd_yes"
names(Cdata[13])<-"multi_no"
names(Cdata[14])<-"multi_yes"
names(Cdata[15])<-"premium_yes"
names(Cdata[16])<-"premiun_no"
Cdata<-Cdata[,c(-6,-7,-8)]
View(Cdata)


attach(Cdata)
summary(Cdata) 
str(Cdata)




plot(speed,price) # Plot relation ships between each X with Y
hist(Cdata$speed)
plot(hd,price)
hist(Cdata$hd)
plot(ram,price)
hist(Cdata$ram)
plot(screen,price)
hist(Cdata$screen)
plot(ads,price)
hist(Cdata$ads)
plot(trend,price)
hist(Cdata$trend)
plot(no,price)
hist(data$no)
plot(yes,price)
hist(Cdata$yes)
plot(no.1,price)
hist(Cdata$no.1)
plot(yes.1,price)
hist(Cdata$yes.1)
plot(yes.2,price)
hist(Cdata$yes.2)
plot(no.2,price)
hist(Cdata$no.2)
## Or make a combined plot
pairs(Cdata)   # Scatter plot for all pairs of variables

cor(Cdata) # correlation matrix

# The Linear Model of interest
model.cdata <- lm(price~.,data=Cdata)
#model.car = lm(Mpg~.,data = )
# lm(Y ~ X)
summary(model.cdata)
error = model.cdata$residuals
pred = predict(model.cdata,Cdata)
?predict
View(pred)
conf_value = confint(model.cdata,level = 0.95)

model.cdata1<-lm(price~yes)
summary(model.cdata1)

model.cdata2 <- lm(price~yes.1)
summary(model.cdata2)

model.cdata3 <- lm(price~no.2)
summary(model.cdata3)

model.cdata4<- lm(price~yes+no.2)
summary(model.cdata4)

model.cdata5 <- lm(price~speed+hd+ram+screen+ads+trend+no+yes+no.1+no.2+yes.2)
summary(model.cdata5)

# Diagnostic Plots
install.packages(car)
library(car)
plot(model.cdata)
qqPlot(model.cdata, id.n=5) 

# Deletion Diagnostics for identifying influential variable
influence.measures(model.cdata)
influenceIndexPlot(model.cdata) 
influencePlot(model.cdata) 

## Regression after deleting the 77th observation
model.cdata6<-lm(price~., data=Cdata[-4478,-1441,-1701])
summary(model.cdata6)


### Variance Inflation Factors
vif(model.cdata)  # VIF is > 10 => collinearity
VIFWT<-lm(WT~VOL+HP+SP)
VIFVOL<-lm(VOL~WT+HP+SP)
VIFHP<-lm(HP~VOL+WT+SP)
VIFSP<-lm(SP~VOL+HP+WT)
summary(VIFWT)
summary(VIFVOL)
summary(VIFHP)
summary(VIFSP)
#### Added Variable Plots ######
avPlots(model.cdata, id.n=2, id.cex=0.8, col="red")
?avPlot

library("MASS")
stepAIC(model.cdata) # backward

plot(model.cdata)

model.final <- lm(price~speed+hd+ram+screen+ads+trend+no+no.1+yes.2, data=Cdata)
summary(model.final)


model.final1 <- lm(price~speed+hd+ram+screen+ads+trend+no+no.1+yes.2, data=Cdata[-4478,-1441,-1701])
summary(model.final1)

avPlots(model.final1, id.n=2, id.cex=0.8, col="red")

vif(model.final1)

