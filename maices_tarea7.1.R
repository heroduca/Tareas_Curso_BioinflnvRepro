#Este script es para la pregunta 1 del la tarea 7.1
#Hecho por Dulce Hernández

#a. Instalar paquetería, siempre y cuando no se tenga y 
#debe hacerse desde la consola y debe hacerse una sola vez
install.packages("vegan")

#b. Cargar la librería necesaria 
library(plyr)
library(tidyr)
library(dplyr)
library(readr)
library(MASS)


fullmat<- read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")


###Contestando las siguientes preguntas

#1. Cargar en una df llamada fullmatel archivo
#'Unidad7/Prac_Uni7/maices/meta/maizteocintle_SNP50k_meta_extended.txt'
print(class(fullmat))

#2. ¿Qué tipo de objeto creamos al cargar la base?
#Con la función anterior creamos una data.frame
print(class(fullmat))

#3. ¿Cómo se ven las primeras 6 líneas del archivo?
head(fullmat, n = 6L)

#4. ¿Cuántas muestras hay?
nrow(fullmat)

#5. ¿De cuántos estados se tienen muestras?
length(levels(fullmat$Estado))
#Salen 19

#6. ¿Cuántas muestras fueron colectadas antes de 1980?
length(filter(fullmat, A.o._de_colecta<="1980"))
#salen 22


#7. ¿Cuántas muestras hay de cada raza?
razas<-table(fullmat$Raza)
razas

#8. En promedio, ¿a qué altitud fueron colectadas las muestras?
mean(fullmat$Altitud)
#Sale 1519.242

#9. ¿A qué altitud máxima y minima fueron colectadas?

summary(fullmat$Altitud)
#como min=5
#Como max=2469

#10.Crea una nueva df de datos solo con las muestras de la raza Olotillo
Olo_df<-subset(fullmat, Raza == "Olotillo")
class(Olo_df)
print(Olo_df)

#11. Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
razas_otrasdf<-subset(fullmat, Raza == c("Reventador","Jala", "Ancho"))
class(razas_otrasdf)
print(razas_otrasdf)

#previo a la pregunta 12 se debe hacer matrix la df razas_otrasdf
#matriz
razas_otrasma<- as.matrix(razas_otrasdf)
is.matrix(razas_otrasma)
class(razas_otrasma)
print(razas_otrasma)
#12. Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta.
write.matrix(razas_otrasma, "../meta/submat.csv", sep = "\t")

#al final de la sesión debemos poner la función
#>sessionInfo() para saber que fue lo que usamos
sessionInfo()
