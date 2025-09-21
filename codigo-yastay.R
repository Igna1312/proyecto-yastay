
#Instalar paquetes

install.packages("readxl")
install.packages("ggplot2")
install.packages("tidyverse")
#confirmar en libreria
library(readxl)
library(ggplot2)
library(tidyverse)

#elegir archivo
file.choose()
tulahuen <- read_excel("/Users/ignacio/Desktop/PROYECTO YASTAY/Manejo en R/proyecto-yastay/precipitacion/precip_tulahuen.xlsx")

# grafico precipitacion por mes


precipitacion <- ggplot(data = tulahuen, aes(x = as.factor(mes), y = valor)) +
  geom_boxplot() +
  labs(
    title = "Precipitacion por mes",
    x = "Mes",
    y = "Precipitación (mm)"
  )

print(precipitacion)

#

ggplot(tulahuen , aes( y = valor)) + geom_boxplot()

#ANALISIS EXPLORATORIO

dim(tulahuen)
head(tulahuen)
summary(tulahuen)
