#!/usr/bin/env Rscript

# Import the data and look at the first six rows
ventasT <- read.csv(file = 'Practica2/Archivos Entrada Final/CSVs/VENTAS.csv')

x <- c("Belize","Guatemala","El Salvador","Panama","Honduras", "Costa Rica", "Nicaragua")
vt0 <- subset(ventasT, Country==x[1] |
Country==x[2] |
Country==x[3] |
Country==x[4] |
Country==x[5] |
Country==x[6] |
Country==x[7], select = c(Country,Units.Sold), drop = FALSE
)
vt0

#cantidad de unidades vendidas por pais
vt<-aggregate(vt0$Units.Sold, by=list(Country=vt0$Country), FUN=sum)
freq_Acum <- cumsum(vt$x)
freq_relat<- prop.table(vt$x)*100 
Freq_relat_acum<-cumsum(freq_relat)
tablafinal<-cbind(vt,freq_Acum,freq_relat,Freq_relat_acum )
tablafinal

library(gridExtra)
png("test.png", height=200, width=400)
p<-tableGrob(tablafinal)
grid.arrange(p)
dev.off()

#cantidad de veces que aparece el pais por facturacion
vt<-aggregate(vt0$Units.Sold, by=list(Country=vt0$Country), FUN=length)
freq_Acum <- cumsum(vt$x) #la frecuencia acumulada
freq_relat<- prop.table(vt$x)*100 #La frecuencia relativa en porcentaje
Freq_relat_acum<-cumsum(freq_relat) #La frecuencia relativa acumulada
tablafinal<-cbind(vt,freq_Acum,freq_relat,Freq_relat_acum ) #juntamos todo
tablafinal # Allí está el resultado

library(gridExtra)
png("test.png", height=200, width=400)
p<-tableGrob(tablafinal)
grid.arrange(p)
dev.off()

#----------------------------------------- inciso b
legends2 <- vt[ , "Country"]

barplot(tablafinal$x,col=rainbow(7), main = "Cantidad de compras", ylim = c(0,35),
        names.arg =  legends2, las = 2)

#----------------------------------------- inciso c
plot(tablafinal$freq_Acum,col=rainbow(7), main = "Frecuencias acumuladas")
lines(lowess(tablafinal$freq_Acum))
