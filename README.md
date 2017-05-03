###This project was completed during the beginning of 2016 for a quiz that I was assigned in class.  The goal was to graphically show a comparison between two securites of my choice over an arbitrary time period.  I chose a slightly odd choice by comparing eBay with the S&P500 market index, but I wanted to compare two things that were significantly different.  The S&P500 is a broad index, while eBay is a Nasdaq stock, hence we would not expect these two to behave alike, generally speaking.  The aim here was to compare the two during 2013-2014 in the hopes of finding any similarities, differences, or any interesting details or anomalies.

###Keep in mind that this project was completed using the framework of a Capital Asset Pricing Model, therefore there will be three variables used.  This model takes into consideration a risk-free rate of return (assumed to be the 3-week U.S. Treasury bill in this model), the beta, or volatility, of a risky asset (eBay), and the expected risk of the market (S&P500). We use the risk-free rate of return as a control in CAPM to account for the time value of money that is always an opportunity cost associated with investing in any risk assets, such as the U.S. equities markets.  

```setwd("/Users/JAhmed/Desktop/RealGit/MarketWork/ebayversusthemarket")

filename = "ebaysp.csv"
ebaysp = read.csv(file = filename, header = T)
ebaysp
```

####At this stage, after you have downloaded the ebaysp.csv file, we then want to enter into the directory where this file has been saved.

```
Ra = ebaysp$Ebay
Rf = ebaysp$Tbill3k
Rm = ebaysp$SP500
```
###Here, we are assigning variables in our model based off the columns located in the csv file provided.  Ra= the risk asset (eBay), Rf = the risk-free rate of return in the form of 3wk U.S. T-bills, Rm = the expected risk of the s&p500.

```
X = cbind(rep(1,length(ebaysp$SP500)),(ebaysp$SP500-ebaysp$Tbill3k))
y = ebaysp$Ebay - ebaysp$Tbill3wk
```

####We use the cbind function here to combine the two columns in the csv file, which will account for our control being subtracted from our variable Rm.  This sets up our graph to have two lines, one with eBay's monthly return and one with the monthly return of the S&P500 during the same time period. 

```
beta_hat = solve(t(X)%*%X)%*%t(X)%*%y
beta_hat
```
###For this linear regression model, we chose to use the matrix version to solve.  This means our equation for beta hat is β̂ =(X′X)−1X′y. Essentially, we are taking the two columns from our csv file, and turning them into matrices which we can then use to solve β̂.  β̂ is interpreted as the fraction of total variance accounted for by regressing this outcome with our explanatory varaiable (the S&P500 index). This helps answer one of my original questions which was how correlated the two securities are relative to one another and the control.

```
plot(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$Ebay,type = 'l', col='blue',ylim=c(-10,15))
lines(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$Ebay, col='blue',ylim=c(-10,15))
lines(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$SP500, col='green')
legend('topleft', c("Ebay", "S&P500"), lty = 1, col = c('blue','green'),merge = T, bg = "gray90")
```

####Finally, we can produce a graph to show what we have done.  The above code is how to produce a simple graph in R that will show us a comparison of eBay versus the S&P500. I used limits of (-10 - 15) to zoom in a fair bit, but these numbers are arbitrary and don't have to be the same as the ones I used.  If you want the lines to be zoomed in more or less, you can change those numbers until you have the desired outcome you are looking for.  Most of this code can be messed about with, such as the colors desired or where the legend is located.  Ultimately though, the final stage is graphing the model and using it to further conclude any findings about this project.

