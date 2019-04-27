#install.packages("scatterplot3d",dependencies=T)
library(gridExtra)
library(grid)
library(dplyr)



datos <- read.csv("Practica2/Archivos Entrada Final/CSVs/PobrezaDesempleoAsesinatos.csv")


#Inciso A
png("Rep5-a1.png", height=900, width=1700)
with(datos,plot(datos$Porcentaje.con.ingresos.debajo.de.5000,datos$Porcentaje.desempleado,
  xlab = "Pobreza", ylab = "Desempleo", main = "Analisis Exploratorio Pobreza - Desempleo"))
dev.off()
png("Rep5-a2.png", height=900, width=1700)
with(datos,plot(datos$Porcentaje.con.ingresos.debajo.de.5000,
  datos$Asesinatos.por.1000000.habitantes,
  xlab = "Pobreza", ylab = "Asesinatos", main = "Analisis Exploratorio Pobreza - Asesinatos"))
dev.off()



#Inciso B
png("Rep5-b2.png", height=900, width=1700)
modelo_simple <- lm(data = datos, 
  formula =  datos$Asesinatos.por.1000000.habitantes~datos$Porcentaje.con.ingresos.debajo.de.5000 )
summary(modelo_simple)
anova(modelo_simple)
plot(x = datos$Porcentaje.con.ingresos.debajo.de.5000, 
  y = datos$Asesinatos.por.1000000.habitantes, main = "medv vs lstat", pch = 20, col = "grey30")
abline(modelo_simple, lwd = 3, col = "red")
dev.off()



png(file = "Rep5-b1.png.png", height=900, width=1700)

# Plot the chart.
plot(datos$Porcentaje.con.ingresos.debajo.de.5000,
datos$Porcentaje.desempleado, col = "blue",main = "medv vs lstat",
     abline(
       lm( datos$Porcentaje.desempleado~datos$Porcentaje.con.ingresos.debajo.de.5000 ))
       ,cex = 1.3,pch = 16,xlab = "ingreso",ylab = "desempleado"
    )
# Save the file.
dev.off()

