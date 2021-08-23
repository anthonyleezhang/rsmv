
library(data.table)
library(ggplot2)
library(scales)
library(Cairo)

reprow = function(x,n){
  matrix(rep(x,each=n),nrow=n)
}
repcol = function(x,n){
  matrix(rep(x,each=n), ncol=n, byrow=TRUE)
}

qfun = function(x) {
  return(qnorm(x))
}

rfun = function(n) {
  return(rnorm(n))
}


d = function(...) {
  print(paste(..., sep = ""))
}
