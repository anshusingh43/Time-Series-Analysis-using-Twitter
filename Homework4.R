install.packages("data.table")
library("data.table")
getwd()
setwd("C:/Users/anshu/Desktop/UNCC Courses/Advanced Business Analytics/Homework4 - Time Series Analysis")
data <- fread("ATT_Twitter.csv", sep=",", header=T, strip.white = T, na.strings = c("NA","NaN","","?"))
head(data)
install.packages("ts", repos = "https://cran.r-project.org")
install.packages("forecast", repos = "https://cran.r-project.org")
library(forecast)
x = ts(data[,2], frequency = 24) 
x
plot(x)
PP.test(x)
par(mfrow = c(1,2))
acf(x,main='ACF ATT_Twitter')
pacf(x,main='PACF ATT_Twitter')
library(forecast)
ARIMAfit = auto.arima(x, approximation=FALSE,trace=TRUE)
summary(ARIMAfit)
install.packages("quantmod", repos = "https://cran.r-project.org")
install.packages("lattice", repos = "https://cran.r-project.org")
install.packages("timeSeries", repos = "https://cran.r-project.org")
install.packages("rugarch", repos = "https://cran.r-project.org")

library(quantmod)
library(lattice)
library(timeSeries)
library(rugarch)
#getSymbols("^GSPC", verbose=TRUE)   
par(mfrow = c(1,1))
plot(x)

# for (0,1)
spec1=ugarchspec(variance.model=list(model="sGARCH"),
                 mean.model=list(armaOrder=c(0,1)))
fit1=ugarchfit(data=x ,spec=spec1)
show(fit1)

#for (0,0)
spec2=ugarchspec(variance.model=list(model="sGARCH"),
                 mean.model=list(armaOrder=c(0,0)))
fit2=ugarchfit(data=x,spec=spec2)
show(fit2)


spec3=ugarchspec(variance.model=list(model="apARCH"),
                 mean.model=list(armaOrder=c(0,0)))
fit3=ugarchfit(data=x,spec=spec3)
show(fit3)

spec4=ugarchspec(variance.model=list(model="apARCH"),
                 mean.model=list(armaOrder=c(0,1)))
fit4=ugarchfit(data=x,spec=spec4)
show(fit4)
