
#Instalar paquetes

install.packages("readxl")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages()
#confirmar en libreria
library(readxl)
library(ggplot2)
library(tidyverse)

#elegir archivo "cogoti" mediante la opcion "import dataset" en la carpeta de precipitacion

# hacer grafico de precipitacion por mes

precipitacion <- ggplot(data = cogoti, aes(x = as.factor(mes), y = valor)) +
  geom_boxplot() +
  labs(
    title = "Precipitacion por mes",
    x = "Mes",
    y = "Precipitación (mm)"
  )

print(precipitacion)

#ANALISIS EXPLORATORIO

dim(cogoti)
head(cogoti)
summary(cogoti$valor)

# Convertir 'año' a numérico si aún no lo está
cogoti$agno <- as.numeric(cogoti$agno)

library(dplyr)

# Calcular los valores máximos por año
maximos_por_año <- cogoti %>%
  group_by(agno) %>%
  summarise(valor_max = max(valor, na.rm = TRUE))

# Crear gráfico con línea conectando los valores máximos
grafico <- ggplot() +
  # Opcional: agregar puntos de máximos
  
  # Dibujar línea conectando los valores máximos en cada año
  geom_line(data = maximos_por_año, aes(x = agno, y = valor_max), color = "blue") +
  labs(
    title = "Valores máximos por año con línea conectada",
    x = "Año",
    y = "Valor máximo"
  ) +
  theme_minimal()

print(grafico)



