#!/usr/bin/env Rscript

# Import the data and look at the first six rows
infoT <- read.csv(file = 'Practica2/Archivos Entrada Final/CSVs/MuertesSexoEdad.csv')

salida<-infoT[ !(infoT$Age %in% c("Total")), ]
salida<-salida[!(salida$Sex %in% c("Total")), ]


vt<-aggregate(salida$Count, by=list(Age=salida$Age), FUN=sum)

library(gtools)

vt<-vt[order(vt$Age),] 
#vt<-vt[mixedsort(vt$Age),] 

# A
freq_Acum <- cumsum(vt$x)
freq_relat<- prop.table(vt$x)*100 
Freq_relat_acum<-cumsum(freq_relat)
tablafinal<-cbind(vt,freq_Acum,freq_relat,Freq_relat_acum )
tablafinal
library(gridExtra)
png("test.png", height=700, width=400)
p<-tableGrob(tablafinal)
grid.arrange(p)
dev.off()


# B
legends2 <- vt[ , "Age"]

barplot(tablafinal$x,col=rainbow(7), main = "Age", ylim = c(0,60000),
        names.arg =  legends2, las = 2)
# C
plot(tablafinal$x,col=rainbow(7), main = "poligono de frecuencua",xaxt ='n')
axis(1, at=1:22, labels=tablafinal$Age, cex.axis=0.6,las=2)
lines(tablafinal$x)
#D
plot(tablafinal$freq_Acum,col=rainbow(7), main = "Frecuencias acumuladas",xaxt ='n')
axis(1, at=1:22, labels=tablafinal$Age, cex.axis=0.6,las=2)
lines(lowess(tablafinal$freq_Acum))
