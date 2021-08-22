
library(data.table)
library(ggplot2)
library(scales)

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


