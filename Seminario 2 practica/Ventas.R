#!/usr/bin/env Rscript

# Import the data and look at the first six rows
ventasT <- read.csv(file = 'Practica2/Archivos Entrada Final/CSVs/VENTAS.csv')
head(ventasT)
x <- c("Belize","Guatemala","El Salvador","Panama","Honduras", "Costa Rica", "Nicaragua")
vt <- subset(ventasT, Country==x[1] |
Country==x[2] |
Country==x[3] |
Country==x[4] |
Country==x[5] |
Country==x[6] |
Country==x[7], select = c(Country,Units.Sold), drop = FALSE
)
library("dplyr") 
otro<-filter(ventasT, Country==x[1] |
Country==x[2] |
Country==x[3] |
Country==x[4] |
Country==x[5] |
Country==x[6] |
Country==x[7]
)%>%
select(Country, Units.Sold)

vt<-aggregate(vt$Units.Sold, by=list(Country=vt$Country), FUN=sum)
vt
#table(vt$Country)
#Svt
#summary(vt)
#table(vt)
#prop.table(table(vt))
#esto lo saque de a aqui http://joseincio.com/como-pedir-una-tabla-de-frecuencia-en-r/
tabla<- as.data.frame(table(vt$Country,vt$x))
freq_Acum <- cumsum(tabla$Freq)
freq_relat<- prop.table(tabla$Freq)*100 
Freq_relat_acum<-cumsum(freq_relat)
tablafinal<-cbind(tabla,freq_Acum,freq_relat,Freq_relat_acum )
#tablafinal
#library(gridExtra)
#png("test.png", height=2000, width=2000)
#p<-tableGrob(summary(vt))
#grid.arrange(p)
#dev.off()  

#
#df1 = ventasT[(ventasT['Country'] == x[1]) | 
#  (ventasT['Country'] == x[2]) |
#  (ventasT['Country'] == x[3]) | 
# (ventasT['Country'] == x[4]) |
#  (ventasT['Country'] == x[5]) |
#  (ventasT['Country'] == x[6]) |
#  (ventasT['Country'] == x[7]) 
#]
#print(df1)



#tab <- table(df1$Region,df1$Country)
#summary(ventasT)

#library(dplyr)
#ed_exp5 <- select(filter(education, Region == 2),c(State,Minor.Population:Education.Expenditures))

#convertir a tabla un objeto
#smoke <- matrix(c(51,43,22,92,28,21,68,22,9),ncol=3,byrow=TRUE)
#colnames(smoke) <- c("High","Low","Middle")
#rownames(smoke) <- c("current","former","never")
#smoke <- as.table(smoke)
#graficar la tabla anterior
#library(gridExtra)
#png("test.png", height=2000, width=2000)
#p<-tableGrob(smoke)
#grid.arrange(p)
#dev.off()


#plot grafica de barras
#barplot(smoke,legend=T,beside=T,main='Smoking Status by SES')
#plot(smoke,main="Smoking Status By Socioeconomic Status")


#mosaicPlot que no es lo que esperaba :'( )
#smokerData <- read.csv(file='smoker.csv',sep=',',header=T)
#summary(smokerData)
#smoke <- table(smokerData$Smoke,smokerData$SES)
#smoke
#mosaicplot(smoke,main="Smokers",xlab="Status",ylab="Economic Class")
#mosaicplot(smoke,sort=c(2,1))