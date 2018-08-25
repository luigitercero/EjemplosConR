#!/usr/bin/env Rscript
N1=as.numeric(commandArgs(TRUE)[1])
N2=as.numeric(commandArgs(TRUE)[2])
res1=runif(N1)
res2=rnorm(N2)
cat(res1,"\n")
cat(res2,"\n")
