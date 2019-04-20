#!/usr/bin/env Rscript
# Import the data and look at the first six rows
ventasT <- read.csv(file = 'Practica2/Archivos Entrada Final/CSVs/VENTAS.csv')
head(ventasT)

#subset(ventasT, Country=='Guatemala')
x <- c("Belize","Guatemala","El Salvador","Panama","Honduras", "Costa Rica", "Nicaragua")
df1 = ventasT[(ventasT['Country'] == x[1]) | 
      (ventasT['Country'] == x[1]) |

]
print(df1)