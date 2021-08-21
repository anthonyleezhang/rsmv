
setwd('C:/Dropbox/projects/rsmv/code')
rm(list = ls())

source('functions.R')

distcutoff = 1
majshare = 0.5

Vqres = 1000
nv = Vqres - 1

#########
# Sampled version
#########

Ntries = 20000

subsetN = 10

ind = 1

outdatalist = list()

for(my_subsetN in c(3, 5, 11, 21, 41)) {
  d('SUBSET N: ', my_subsetN)
  
  nt = my_subsetN
  
  Vqgrid = (1:(Vqres-1))/Vqres
  vals = qfun(Vqgrid)
  
  valmat = repcol(vals, nt)
  
  for(i in 1:Ntries) {
    d(i)
    
    tvec = rfun(my_subsetN)
    nt = my_subsetN
    
    tmat = reprow(tvec, nv)
    
    ######
    
    voteshares = rowSums((abs(valmat - tmat) < distcutoff) * 1/nt)
    passvec = (voteshares > majshare) * 1
    
    outtable = data.table(subsetN = my_subsetN, rep = i, v = vals, pass = passvec)
    
    outdatalist[[ind]] = outtable
    ind = ind+1
    
  }
  
}

data = rbindlist(outdatalist)

fwrite(data, file = '../results/subsets_fulldata.csv')

subdata = data[, .(passrate = mean(pass)), by = .(v, subsetN)]

fwrite(subdata, file = '../results/subsets_sumdata.csv')







