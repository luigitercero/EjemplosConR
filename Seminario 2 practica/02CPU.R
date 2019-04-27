#!/usr/bin/env Rscript

# Import the data and look at the first six rows
infoT <- read.csv(file = 'Practica2/Archivos Entrada Final/CSVs/DesempenioCPU.csv')

x <- c("amdahl")
tr <- subset(infoT, Compania==x[1] , select = c(Compania,PRP,ERP), drop = FALSE
)

tr

media = mean(tr$PRP)
maximiliano = max(tr$PRP) 
minimiliano = min(tr$PRP) 
media
maximiliano
minimiliano

tab <- matrix(c(media,maximiliano,minimiliano),ncol=3,byrow=TRUE)
colnames(tab) <- c("Media","Max","Min")
#rownames(smoke) <- c("current","former","never")
tab <- as.table(tab)
tab

barplot(tab,col=c("orange","blue","green"),
        #legend.text=c("media","maximo","Minimo")
        )


tr<-aggregate(infoT$PRP, by=list(Compania=infoT$Compania), FUN=mean)

media = mean(tr$x)
maximiliano = max(tr$x) 
minimiliano = min(tr$x)
desviacion = sd(tr$x) 



tr0 <- subset(tr, x==maximiliano , select = c(Compania,x), drop = FALSE
)
#tr0

tr1 <- subset(tr, x==minimiliano , select = c(Compania,x), drop = FALSE
)
lf0 = as.list(tr0$Compania)  
lf1 = as.list(tr1$Compania) 
A0<-as.character(lf0[[1]])          # get the first row
A1<-as.character(lf1[[1]])  
#tr1[1,]    

tab <- matrix(c(media,tr0$x,tr1$x),ncol=3,byrow=TRUE)
colnames(tab) <- c("Media", A0, A1)
#rownames(smoke) <- c("current","former","never")
tab <- as.table(tab)
barplot(tab,col=c("orange","blue","green"),
        #legend.text=c("media","maximo","Minimo")
        )
title(xlab="Medida",ylab ="modelos")