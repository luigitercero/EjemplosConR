#!/usr/bin/env Rscript
## CAMBIAR AL PATH ACTUAL

library(gridExtra)

##########################
# LEER CSV
#########################
data1 <- read.csv("Practica2/Archivos Entrada Final/CSVs/PresionSanguineaEdad.csv")
presion <-as.data.frame(data1)
print(cor(presion$Edad, presion$Systolic.Blood.Pressure))
print("LA CORRELACION ES MAS CERCANA A 1, POR LO TANTO EXISTE UNA RELACION FUERTE")

linearMod <- lm(Edad ~ Systolic.Blood.Pressure, data=presion)  # build linear regression model on full data
print(linearMod)
info <- summary(linearMod)
print(info)

modelSummary <- summary(linearMod)  # capture model summary as an object
modelCoeffs <- modelSummary$coefficients  # model coefficients
beta.estimate <- modelCoeffs["Systolic.Blood.Pressure", "Estimate"]  # get beta estimate for speed
std.error <- modelCoeffs["Systolic.Blood.Pressure", "Std. Error"]  # get std.error for speed
t_value <- beta.estimate/std.error  # calc t statistic
p_value <- 2*pt(-abs(t_value), df=nrow(presion)-ncol(presion))  # calc p Value
f_statistic <- linearMod$fstatistic[1]  # fstatistic
f <- summary(linearMod)$fstatistic  # parameters for model p-value calc
model_p <- pf(f[1], f[2], f[3], lower=FALSE)

########################FORMULA#######################
png(file = "Regrsoiom6.png")
# Plot the chart.
plot(presion$Edad, presion$Systolic.Blood.Pressure,col = "blue",
     abline(lm(presion$Systolic.Blood.Pressure~presion$Edad)),
     main = "Edad & Pressure Regression",
     #cex = 1.3,pch = 16,
     xlab = "Edad",
     ylab = "Pressure",
     #sub=paste("Funciones: ", linearMod$coefficients)
        )
# Save the file.
dev.off()
########################ANALISIS######################
#/////////////////

png(file = "r01.png")
scatter.smooth(x=presion$Edad, y=presion$Systolic.Blood.Pressure, 
               main="Edad ~ SystolicBloodPressure",
               ylab="Systolic Blood Pressure", 
               xlab="Edad", 
               )  # scatterplot
dev.off()
par(mfrow=c(1, 2))  # divide graph area in 2 columns
#/////////////////
png(file = "R1.png")
boxplot(presion$Edad, main="Edad", sub=paste("Outlier rows: ", boxplot.stats(presion$Edad)$out))  # box plot for 'Edad'
dev.off()
#/////////////////
png(file = "R2.png")
boxplot(presion$Systolic.Blood.Pressure, main="BloodPress", sub=paste("Outlier rows: ", boxplot.stats(presion$Systolic.Blood.Pressure)$out))  # box plot for 'distance'
dev.off()
#////////////////
install.packages("e1071",dependencies=T)
library(e1071)
par(mfrow=c(1, 2))  # divide graph area in 2 columns
png(file = "R3.png")
plot(density(presion$Edad), main="Density Plot: Edad", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(presion$Edad), 2)))  # density plot for 'speed'
polygon(density(presion$Edad), col="red")
dev.off()
#////////////////
png(file = "R4.png")
plot(density(presion$Systolic.Blood.Pressure), main="Density Plot: Distance", ylab="Frequency", sub=paste("Skewness:", round(e1071::skewness(presion$Systolic.Blood.Pressure), 2)))  # density plot for 'dist'
polygon(density(presion$Systolic.Blood.Pressure), col="red")
dev.off()