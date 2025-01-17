# Cargar bibliotecas necesarias para llevar a cabo las pruebas de normalidad multivariante
library(MVN)         # Proporciona funciones para el análisis de normalidad multivariante
library(mvnormtest)  # Proporciona diferentes pruebas de normalidad multivariante

# Cargar el conjunto de datos 'iris' incorporado en R
data(iris)

# Seleccionar las primeras 50 filas y las primeras 4 columnas del conjunto de datos 'iris',
# que corresponden a la especie 'setosa'
setosa <- iris[1:50, 1:4]


# Realizar la prueba de Shapiro-Wilk multivariante utilizando la función mshapiro.test()
# Se transpone el conjunto de datos 'setosa' utilizando la función t() para que los datos 
# estén en el formato adecuado para la prueba
result1 <- mshapiro.test(t(setosa))

# Imprimir los resultados de la prueba de Shapiro-Wilk multivariante
print(result1)

# Realizar prueba de normalidad multivariante utilizando el método de Mardia
result2 <- mvn(setosa, mvnTest = "mardia")

# Imprimir los resultados de la prueba de normalidad multivariante
print(result2$multivariateNormality)