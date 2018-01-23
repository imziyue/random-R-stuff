x11()
plot(runif(10), runif(10), 
     xlim=c(-1, 1), ylim=c(0,1), 
     axes=T, #Don't plot the axis 
     type="n",  #hide the points
     ylab="", xlab="") #No axis labels
abline(v = 0, col = 2)
success <- 0
for (i in 1:200){
  sample_i <- rnorm(100)
  mean_i <- mean(sample_i)
  lower <- sd(sample_i) * qt(0.025,99)/10 + mean_i
  upper <- sd(sample_i) * qt(0.975,99)/10 + mean_i
  if(0 > lower & 0 < upper)
    success <- success + 1
  segments(lower,i/200,upper,i/200)
  Sys.sleep(0.05)
}
title(c(success/2, 'percent of 95% confidence intervals succeed in capturing the true value'))


