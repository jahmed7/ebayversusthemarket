setwd("/Users/JAhmed/Documents/")

filename = "example3.csv"
example_3 = read.csv(file = filename, header = T)
example_3

Ra = example_3$Ebay
Rf = example_3$Tbill3k
Rm = example_3$SP500

X = cbind(rep(1,length(example_3$SP500)),(example_3$SP500-example_3$Tbill3k))
y = example_3$Ebay - example_3$Tbill3wk

beta_hat = solve(t(X)%*%X)%*%t(X)%*%y
beta_hat

plot(x = as.Date(example_3$Date, "%m/%d/%y"), y = example_3$Ebay,type = 'l', col='blue',ylim=c(-10,15))
lines(x = as.Date(example_3$Date, "%m/%d/%y"), y = example_3$Ebay, col='blue',ylim=c(-10,15))
lines(x = as.Date(example_3$Date, "%m/%d/%y"), y = example_3$SP500, col='green')
legend('topleft', c("Ebay", "S&P500"), lty = 1, col = c('blue','green'),merge = T, bg = "gray90")