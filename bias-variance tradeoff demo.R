x11()
for (i in 1:400){
  if (i < 200) bw = 0.5
  else bw = 0.2
  Sys.sleep(0.1)
  plot(seq(-3,3,0.01),dnorm(seq(-3,3,0.01)),type = 'l',ylim = c(0,0.6),
       main = paste('bandwidth =', bw))
  temp = rnorm(100)
  temp_den = density(temp,bw = bw)
  lines(temp_den,col = 'red')
  if (i == 1 | i == 201) {
    temp_all = temp
    avg_x = temp_den$x
    avg_y = temp_den$y
    lines(temp_den, col = 'green')
  }
  else {
    temp_all = c(temp_all,temp)
    lines(density(temp_all,bw = bw), col = 'green')
  }
  legend(-3,0.6,legend = c('theoretical distribution','density estimation for 100 random sample',
                               'density estimation for all the sample until this loop'),
         col = c('black','red','green'),lty = 1)
  
}
