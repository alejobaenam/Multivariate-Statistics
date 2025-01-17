# Gráfico 1 (SPLOM)
# Cargamos la biblioteca colorspace para obtener colores agradables
library(colorspace)
library(dendextend)

# Cargamos el conjunto de datos de iris desde el paquete datasets
iris <- datasets::iris
# Creamos un nuevo dataframe excluyendo la quinta columna que contiene las etiquetas de especies
iris2 <- iris[, -5]
# Extraemos las etiquetas de especies del dataframe original
species_labels <- iris[, 5]

# Creamos un vector de colores basado en las etiquetas de especies
species_col <- rev(rainbow_hcl(3))[as.numeric(species_labels)]

# Dibujamos un SPLOM (scatterplot matrix):
pairs(iris2, # Usamos el dataframe iris2
    col = species_col, # Asignamos colores según las etiquetas de especies
    lower.panel = NULL, # No mostramos paneles inferiores
    cex.labels = 2, pch = 19, cex = 2 # Ajustamos el tamaño de las etiquetas y puntos en el gráfico
)

# Agregamos una leyenda
legend(
    x = 0.05, y = 0.4, cex = 2, # Posición y tamaño de la leyenda
    legend = as.character(levels(species_labels)), # Etiquetas de especies como leyenda
    fill = unique(species_col) # Colores únicos asociados a las etiquetas de especies
)


## Grafico 2 (Dendrograma con enlace único)

# Calculamos la distancia euclidiana entre las observaciones en el conjunto de datos iris2
d_iris <- dist(iris2)
# Realizamos un agrupamiento jerárquico completo utilizando la distancia calculada
hc_iris <- hclust(d_iris, method = "single")
# Definimos el orden del dendrograma lo más cercano posible al orden de las observaciones
iris_species <- rev(levels(iris[, 5]))
dend <- as.dendrogram(hc_iris)
dend <- rotate(dend, 1:150)

# Coloreamos las ramas basadas en los clusters
dend <- color_branches(dend, k = 3)

# Asignamos manualmente los colores de las etiquetas, en la medida de lo posible, a la clasificación real de las flores
labels_colors(dend) <-
    rainbow_hcl(3)[sort_levels_values(
        as.numeric(iris[, 5])[order.dendrogram(dend)]
    )]

# Agregamos el tipo de flor a las etiquetas
labels(dend) <- paste(as.character(iris[, 5])[order.dendrogram(dend)],
    "(", labels(dend), ")",
    sep = ""
)
# Ajustamos la altura del dendrograma
dend <- hang.dendrogram(dend, hang_height = 0.1)
# Reducimos el tamaño de las etiquetas
dend <- set(dend, "labels_cex", 0.5)
# Y dibujamos el dendrograma
par(mar = c(3, 3, 3, 7))
plot(dend,
    main = "Iris dataset clusterizado con enlace único",
    horiz = TRUE, nodePar = list(cex = .007)
)
# Agregamos una leyenda
legend("topleft", legend = iris_species, fill = rainbow_hcl(3))


## Grafico 3 (Dendrograma con enlace completo)

# Calculamos la distancia euclidiana entre las observaciones en el conjunto de datos iris2
d_iris <- dist(iris2)
# Realizamos un agrupamiento jerárquico completo utilizando la distancia calculada
hc_iris <- hclust(d_iris, method = "complete")
# Definimos el orden del dendrograma lo más cercano posible al orden de las observaciones
iris_species <- rev(levels(iris[, 5]))
dend <- as.dendrogram(hc_iris)
dend <- rotate(dend, 1:150)

# Coloreamos las ramas basadas en los clusters
dend <- color_branches(dend, k = 3)

# Asignamos manualmente los colores de las etiquetas, en la medida de lo posible, a la clasificación real de las flores
labels_colors(dend) <-
    rainbow_hcl(3)[sort_levels_values(
        as.numeric(iris[, 5])[order.dendrogram(dend)]
    )]

# Agregamos el tipo de flor a las etiquetas
labels(dend) <- paste(as.character(iris[, 5])[order.dendrogram(dend)],
    "(", labels(dend), ")",
    sep = ""
)
# Ajustamos la altura del dendrograma
dend <- hang.dendrogram(dend, hang_height = 0.1)
# Reducimos el tamaño de las etiquetas
dend <- set(dend, "labels_cex", 0.5)
# Y dibujamos el dendrograma
par(mar = c(3, 3, 3, 7))
plot(dend,
    main = "Iris dataset clusterizado con enlace completo",
    horiz = TRUE, nodePar = list(cex = .007)
)
# Agregamos una leyenda
legend("topleft", legend = iris_species, fill = rainbow_hcl(3))
