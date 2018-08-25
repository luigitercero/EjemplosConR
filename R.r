#!/usr/bin/env Rscript
N=as.numeric(commandArgs(TRUE)[1])
if (is.na(N)) N=10
res=runif(N)
cat(res,"\n")

