#install.packages("scatterplot3d",dependencies=T)

library(gridExtra)
library(grid)
library(dplyr)


#-----Se organizan los datos-----
datos <- read.csv("Practica2/Archivos Entrada Final/CSVs/PresionSanguineaEdad.csv")

#Inciso A
png("Rep4-a.png", height=900, width=1700)
with(datos,plot(datos$Edad,datos$Systolic.Blood.Pressure,xlab = "Edad", ylab = "Presion Sanguinea", main = "Analisis Exploratorio Presion Sanguinea - Edad"))
dev.off()


#Inciso B
png("Rep4-b.png", height=900, width=1700)
modelo_simple <- lm(data = datos, formula = datos$Systolic.Blood.Pressure ~ datos$Edad)
#comprobacion de regresion lineal
summary(modelo_simple)
anova(modelo_simple)
plot(x = datos$Edad, y = datos$Systolic.Blood.Pressure, ylab = "Presion Sanguinea", main = " Presion Sanguinea - Edad", pch = 20, col = "grey30")
abline(modelo_simple, lwd = 3, col = "red")
dev.off()