# Cargar las librerías necesarias
library(vegan)
library(ggbiplot)

# Leer el dataframe
df <- iris[, 1:4]  # Seleccionar las columnas del dataframe

# Análisis de componentes principales
df.pca <- rda(df, scale = TRUE)
summary(df.pca)

# Modelo de "Broken stick" para los valores propios
(inventory <- df.pca$CA$eig)
screeplot(df.pca, bstick = TRUE, npcs = length(df.pca$CA$eig))

par(mfrow = c(1,1))
# Análisis de componentes principales
pc <- prcomp(df, 
             center = TRUE, # Queremos usar el centro como promedio para las variables 
             scale. = TRUE) # Normalización

# Gráfico biplot
g <- ggbiplot(pc,
              obs.scale = 1,
              var.scale = 1,
              groups = iris$Species,
              ellipse = TRUE, # Elipse alrededor del punto de los datos
              circle = TRUE, # Círculo en el gráfico
              varname.size = 6) # Tamaño de los nombres de las variables

# Ajustar el tamaño del título y los ejes
g <- g + theme(axis.title = element_text(size = 25), # Tamaño de los títulos de los ejes
               text = element_text(size = 35),
               legend.direction = "horizontal",
               legend.position = "top")  # Tamaño del texto en general

g <- g + scale_color_discrete(name = "")

print(g)