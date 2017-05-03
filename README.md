#This project was completed during the beginning of 2016 for a quiz that I was assigned in class.  The goal was to graphically show a comparison between two securites of my choice over an arbitrary time period.  I chose a slightly odd choice by comparing eBay with the S&P500 market index, but I wanted to compare two things that were significantly different.  When comparing a broad index like the S&P500 with a Nasdaq stock like eBay, generally speaking, we would not expect them to behave quite the same.  The aim here was to compare the two during 2013-2014 in the hopes of finding any similarities, differences, or any interesting details or anomalies.

#I will use the framework of a Capital Asset Pricing Model (CAPM), therefore there will be three variables used.  This model takes into consideration a risk-free rate of return (assumed to be the 3-week U.S. Treasury bill in this model), the beta, or volatility, of a risky asset (eBay), and the expected risk of the market (S&P500). We use the risk-free rate of return as a control in CAPM to account for the time value of money that is always an opportunity cost associated with investing in any risk assets, such as the U.S. equities markets.  

#This project requires a program to run R, such as R Console or RStudio.  It's free and open-source.

#First, download the ebaysp.csv file above and know where it can be located for reference.  
```
setwd("/Users/JAhmed/Desktop/RealGit/MarketWork/ebayversusthemarket")
filename = "ebaysp.csv"
ebaysp = read.csv(file = filename, header = T)
ebaysp
```

#At this stage, after we download the ebaysp.csv file, we use the setwd function to set the directory to the location of wherever the .csv file was saved. In my case, I have a folder on my desktop that I use for projects.  This line can be different for anyone- just make sure you reference the specific location of the ebaysp.csv file.  Once this is complete, you should have the ebaysp.csv file read into the program.

```
Ra = ebaysp$Ebay
Rf = ebaysp$Tbill3k
Rm = ebaysp$SP500
```
#Here, we are assigning variables in our model based off the columns located in the csv file provided.  Ra= the risk asset (eBay), Rf = the risk-free rate of return in the form of 3wk U.S. T-bills, Rm = the expected risk of the s&p500.

```
X = cbind(rep(1,length(ebaysp$SP500)),(ebaysp$SP500-ebaysp$Tbill3k))
y = ebaysp$Ebay - ebaysp$Tbill3wk
```

#We use the cbind function here to combine the two columns in the .csv file, which will account for our control, Rf, being subtracted from our variable, Rm.  This sets up our graph to have two lines, one with eBay's monthly return and one with the monthly returns of the S&P500. 

```
beta_hat = solve(t(X)%*%X)%*%t(X)%*%y
beta_hat
```
#As a linear regression model, I chose to solve for the variable, beta hat (β̂), using matrices.  β̂ is equal to the fraction of total variance accounted for by regressing the risk asset of eBay with our explanatory varaiable (the S&P500 index). This means our equation for beta hat is β̂ =(X′X)−1X′y. Essentially, we are taking the two columns from our csv file, and turning them into matrices which we can then use to solve β̂. It tells us the variance that is associated by the index of the market, which orgiinally is hypothesized to be low. This helps answer one of my original questions which was how correlated the two securities are relative to one another and the control.

```
plot(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$Ebay,type = 'l', col='blue',ylim=c(-10,15))
lines(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$Ebay, col='blue',ylim=c(-10,15))
lines(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$SP500, col='green')
legend('topleft', c("Ebay", "S&P500"), lty = 1, col = c('blue','green'),merge = T, bg = "gray90")
```

#Finally, we can produce a graph to show what we have done.  The above code is how to produce a simple graph in R that will show us a comparison of eBay versus the S&P500. I used limits of (-10 - 15) to zoom in a fair bit, but these numbers are arbitrary and don't have to be the same as the ones I used.  If you want the lines to be zoomed in more or less, you can change those numbers until you have the desired outcome you are looking for.  Most of this code can be messed about with, such as the colors desired or where the legend is located.  Ultimately though, the final stage is graphing the model and using it to further conclude any findings about this project.

