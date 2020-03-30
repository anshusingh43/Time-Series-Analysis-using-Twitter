# Time Series Analysis using Twitter
The objective of this study is to find the right time series model to make predictions about the future customer sentiment in Twitter network of AT&T. 

#### About the Data

The data contains the average hourly sentiment of tweets customers sent to AT&T’s Twitter handle. 

#### Let's dig into it

Packages used in this code are:
- forecast
- timeSeries
- rugarch

The initial time series plot is given below:

![img1](https://user-images.githubusercontent.com/13045656/77777453-f84b3280-7025-11ea-92ed-4a2c37986752.png)

Let's see if our time series is random walk process or not and for that, I will write these codes in R

![img2](https://user-images.githubusercontent.com/13045656/77777911-9939ed80-7026-11ea-84fd-736fce79baef.png)

Since the p-val = 0.01, hence rejection of null hypothesis and hence it is not Random-Walk.

Let's use ACF and PACF to determine if the times series has any MA or AR process and if it has, what is the order.

![img3](https://user-images.githubusercontent.com/13045656/77778033-c5ee0500-7026-11ea-95d5-1d839397bf67.png)

If you look carefully, the first one only crosses the line and there is no line before that which is below the dotted line and therefore , I can say the order is 1.

I am using auto arima model for finding out the best ARIMA model for this data.
![img4](https://user-images.githubusercontent.com/13045656/77778234-0f3e5480-7027-11ea-9058-c75a921ed3d1.png)

Now, we must check ARCH adn GARCH models and for that, I am using ***rugarch*** package with ***sGARCH*** specifications.

<img width="333" alt="img5" src="https://user-images.githubusercontent.com/13045656/77778448-60e6df00-7027-11ea-896f-606b331c7b5b.PNG">

The ***value for AIC: -3.4473 and BIC: -3.4392*** for this model. Now, I will try with armaOrder(0,1).

<img width="323" alt="img6" src="https://user-images.githubusercontent.com/13045656/77778549-8d026000-7027-11ea-8363-759323c2e110.PNG">

The ***value for AIC : -3.4451 and BIC : -3.4348***. Now, doing the same thing all over again but with ***apARCH*** specifications.

<img width="327" alt="img7" src="https://user-images.githubusercontent.com/13045656/77778729-d5218280-7027-11ea-92a6-5f87b48ea039.PNG">

The ***value for armaOrder(0,0) AIC = -3.6601 and for BIC = -3.6478*** and for ***armaOrder(0,1) , we have AIC = -3.6672 and BIC = -3.6529***.

#### Conclusion and Findings

Lets compare the value of AIC and BIC for GARCH and apARCH with armaOrder(0,0) and (0,1). 

For Garch with armaOrder(0,0): The value for AIC: -3.4473 and BIC: -3.4392
For Garch with armaOrder(0,1): The value for AIC : -3.4451 and BIC : -3.4348
For apArch with armaOrder(0,0): The value for AIC = -3.6601 and BIC = -3.6478
For apArch with armaOrder(0,1): The value for AIC = -3.6672 and BIC = -3.6529

It is said that lesser the value for BIC and AIC, better the model. So first we will check BIC for all the models and if BIC is same for any of the two moel, AIC will come in picture.

**As we observe, BIC for apArch with armaOrder(0,1) is least and I would choose this specification for predicting the future values over all the other specifications.**

Any suggestions or comments are welcome at anshusingh7091994@gmail.com.




