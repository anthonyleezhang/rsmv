
setwd('C:/Dropbox/projects/rsmv/code')
rm(list = ls())

source('functions.R')

distcutoff = 1

outdatalist = list()

i = 1

for(my_majshare in c(0.2, 0.35, 0.5, 0.65)) {
  
  d('MAJSHARE: ', my_majshare)
  
  
  Tqres = 1000
  Tqgrid = (1:(Tqres-1))/Tqres
  
  tvec = qfun(Tqgrid)
  nt = length(tvec)
  
  Vqres = 1000
  nv = Vqres - 1
  
  Vqgrid = (1:(Vqres-1))/Vqres
  vals = qfun(Vqgrid)
  
  valmat = repcol(vals, nt)
  tmat = reprow(tvec, nv)
  
  voteshares = rowSums((abs(valmat - tmat) < distcutoff) * 1/nt)
  passvec = (voteshares > my_majshare) * 1
  
  outdata = data.table(majshare = my_majshare, v = vals, passrate = passvec)
  
  outdatalist[[i]] = outdata
  i = i+1
  
}

data = rbindlist(outdatalist)

fwrite(data, file = '../results/fullsample_data.csv')




