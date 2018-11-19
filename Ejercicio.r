#!/usr/bin/env Rscript

tr=c(
9
,9
,11
,8
,8
,9
,9
,8
,11
,9
,8
,9
,9
,8
,9
,11
,9
,9
,10
,9
,9
,9
,8
,9
,11
,9
,9
,11
,9
,9
,8
,12
,9
,9
,9
,9
,9
,9
,9
,8
,11
,9
,9
,11
,12
,9
,9
,11
,10
)
#sd(tr)

media = mean(tr)
summary(tr);
maximiliano = max(tr) +  max(tr)*0.50
minimiliano = min(tr) -  min(tr)*0.50
cat("la media es:", media,"\n")
desviacion = sd(tr)
cat("la desviacion es:", desviacion,"\n")
x = minimiliano:maximiliano
x
min = 100
max = 100
T =  10

LSL = 8
USL = 10
par(mfrow = c(1,1))

#cat("esto es la grafica")
#grafica




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
cat ("el 6 sigma es de: ")

if(rendimiento>= 0.99997 ){
    cat("6:")
} else
if(rendimiento>= 0.9998 ){
    cat("5")
}else 
if(rendimiento>= 0.993 ){
    cat("4")
}else
if(rendimiento>= 0.933 ){
    cat("3")
}else
if(rendimiento>= 0.6915 ){
    cat("2")
}else 
if(rendimiento>= 0.3085 ){
    cat("1")
}else 
if(rendimiento>= 0.068 ){
    cat("0")
}

cat("\n")
grafica = dnorm(x, media,desviacion)
plot(x,grafica,type="l",col="red") #pnorm distribuci�n normal acumulada

abline(v=LSL, col="gray",lty=1,lwd=2)
abline(v=USL, col="gray",lty=1,lwd=3)
abline(v=T, col="purple",lty=1,lwd=1)