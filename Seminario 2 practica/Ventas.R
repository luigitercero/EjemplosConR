#!/usr/bin/env Rscript

# Import the data and look at the first six rows
ventasT <- read.csv(file = 'Practica2/Archivos Entrada Final/CSVs/VENTAS.csv')
head(ventasT)

#subset(ventasT, Country=='Guatemala')
x <- c("Belize","Guatemala","El Salvador","Panama","Honduras", "Costa Rica", "Nicaragua")
df1 = ventasT[(ventasT['Country'] == x[1]) | 
  (ventasT['Country'] == x[2]) |
  (ventasT['Country'] == x[3]) | 
  (ventasT['Country'] == x[4]) |
  (ventasT['Country'] == x[5]) |
  (ventasT['Country'] == x[6]) |
  (ventasT['Country'] == x[7]) 
]
print(df1)

library(gridExtra)
png("test.png", height=2000, width=2000)
p<-tableGrob(df1)
grid.arrange(p)
dev.off()

smokerData <- read.csv(file='Practica2/Archivos Entrada Final/CSVs/VENTAS.csv',sep=',',header=T)
smoke <- table(smokerData$Country)
mosaicplot(smoke)
help(mosaicplot)
mosaicplot(smoke,main="Smokers",xlab="Status",ylab="Economic Class")
mosaicplot(smoke,dir=c("v","h"))