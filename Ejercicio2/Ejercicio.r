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
#summary(tr);
maximiliano = max(tr) +1.10
minimiliano = min(tr) -1.10
cat("la media es:", media,"\n")
desviacion = sd(tr)
cat("la desviacion es:", desviacion,"\n")
x = minimiliano:maximiliano
#x
min = 100
max = 100
T =  10

LSL = 8
USL = 10
#par(mfrow = c(1,1))
#grafica = dnorm(x, media,desviacion)
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




grapNorm = dnorm(x, media,desviacion)
plot(x,grapNorm) #pnorm distribuci�n normal acumulada
lines(x,grapNorm,type="l",col="blue",lwd=3)
lines(x,pnorm(x, media,desviacion),type="l",col="yellow",lwd=3)
abline(v =T, col="blue", lwd=1, lty=1)
abline(v =T, col="red", lwd=3, lty=2)
abline(v=c(z1,z2), col=c("blue", "blue"), lty=c(1,2), lwd=c(1, 3))


cat("rendimiento:", rendimiento,"\n")

if (rendimiento>0.999997) {
   cat("Nivel sigma es: 6\n");
} else {
    if (rendimiento>0.9998) {
       cat("Nivel sigma es: 5\n");
    } else {
       if (rendimiento>0.993) {
          cat("Nivel sigma es: 4\n");
       } else {
          if (rendimiento>0.933) {
              cat("Nivel sigma es: 3\n");
          } else {
            if (rendimiento>0.6915) {
               cat("Nivel sigma es: 2\n");
            } else {
               if (rendimiento>0.3015) {
                  cat("Nivel sigma es: 1\n");
               } else {
                  if(rendimiento<0.0668) {
                      cat("Nivel sigma es: 0\n");
                  }else {
                      cat("no se que nivel sigma sigma es: -0\n");
                  }
               }
            }
          }
       }
    }
}