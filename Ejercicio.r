#!/usr/bin/env Rscript

tr=c(
   99
,99
,95
,98
,100
,100
,98
,98
,100
,99
,103
,99
,98
,98
,95
,98
,100
,98
,99
,99
,100
,96
,100
,98
,105
,98
,100
,98
,99
,100
,95
,98
,100
,100
,100
,97
,99
,98
,102
,100
,100
,101
,105
,100
,95
,99
,100
,99
,98
,95
,99
,99
,97
,100
,100
,102
,105
,99
,97
,100
,99
,98
,100
,101
,98
,99
,96
,99
,99
,103
,101
,100
,100
,98
,98
,99
,98
,103
,99
,98
,105
,98
,99
,97
,105
,100
,97
,98
,100
,100
,99
,98
,98
,100
,99
,98
,98
,98
)
sd(tr)

media = mean(tr)
cat("la media es:", media,"\n")
desviacion = sd(tr)
cat("la desviacion es:", desviacion,"\n")
x = 120:120
x

par(mfrow = c(1,1))
plot(dnorm(x, mean = media, sd = desviacion)) #pnorm distribuci�n normal acumulada

min = 100
max = 100
T = 104

LSL = 97
USL = 101


z1 = (USL - media)/desviacion
cat("z1:", z1,"\n")
pz1 = pnorm(z1, 0,1)
cat("la probabilidad 1:", pz1,"\n")

z2 = (LSL - media)/desviacion
cat("z2:", z2,"\n")
pz2 = pnorm(z2, 0,1)
cat("la probabilidad 2:", pz2,"\n")
# % de productividad o rendimiento
rendimiento = pz1 - pz2
cat("rendimiento:", rendimiento,"\n")
if(rendimiento<= 0.3085)
