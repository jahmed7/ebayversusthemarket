setwd("/Users/JAhmed/Desktop/RealGit/MarketWork/ebayversusthemarket")

filename = "ebaysp.csv"
ebaysp = read.csv(file = filename, header = T)
ebaysp

Ra = ebaysp$Ebay
Rf = ebaysp$Tbill3k
Rm = ebaysp$SP500

X = cbind(rep(1,length(ebaysp$SP500)),(ebaysp$SP500-ebaysp$Tbill3k))
y = ebaysp$Ebay - ebaysp$Tbill3wk

beta_hat = solve(t(X)%*%X)%*%t(X)%*%y
beta_hat

plot(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$Ebay,type = 'l', col='blue',ylim=c(-10,15))
lines(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$Ebay, col='blue',ylim=c(-10,15))
lines(x = as.Date(ebaysp$Date, "%m/%d/%y"), y = ebaysp$SP500, col='green')
legend('topleft', c("Ebay", "S&P500"), lty = 1, col = c('blue','green'),merge = T, bg = "gray90")