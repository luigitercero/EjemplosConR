#!/usr/bin/env Rscript
# http://www.dma.ulpgc.es/profesores/personal/stat/cursoR4ULPGC/9b-grafBarplot.html
# Import the data and look at the first six rows
ventasT <- read.csv(file = 'Practica2/Archivos Entrada Final/CSVs/VENTAS.csv')
head(ventasT)
x <- c("Cereal","Fruits","Meat","Snacks","Vegetables")
vt0 <- subset(ventasT, Item.Type==x[1] |
Item.Type==x[2] |
Item.Type==x[3] |
Item.Type==x[4] |
Item.Type==x[5] , select = c(Item.Type,Total.Revenue), drop = FALSE
)

vt<-aggregate(vt0$Total.Revenue, by=list(Item.Typ=vt0$Item.Typ), FUN=sum)
vt
barplot(prop.table(vt$x),col=c("orange","blue","green","red","yellow"),
        legend.text=c(x[1],x[2],x[3],x[4],x[5]))
barplot(vt$x,col=c("orange","blue","green","red","yellow"),
        legend.text=c(x[1],x[2],x[3],x[4],x[5]))