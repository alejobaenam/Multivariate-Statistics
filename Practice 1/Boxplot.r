data(nhtemp)

plot.new()

rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4],
     col = "#ebebeb")

# Añadimos un grid blanco
grid(nx = NULL, ny = NULL, col = "white", lty = 1,
     lwd = par("lwd"), equilogs = TRUE)

# Boxplot
par(new = TRUE)
boxplot(nhtemp, # Datos
        horizontal = FALSE, # Horizontal o vertical
        lwd = 2, # Lines width
        col = rgb(1, 0, 0, alpha = 0.4), # Color
        ylab = "Temperatura promedio",  # Etiqueta eje Y
        main = "Boxplot de temperatura anual en grados Fahrenheit en New Haven, Connecticut, from 1912 to 1971.", # Título
        notch = TRUE, # Añade intervalos de confianza para la mediana
        border = "black",  # Color del borde del boxplot
        outpch = 25,       # Símbolo para los outliers
        outbg = "green",   # Color de los datos atípicos
        whiskcol = "blue", # Color de los bigotes
        whisklty = 2,      # Tipo de línea para los bigotes
        lty = 1) # Tipo de línea (caja y mediana)

# Agregamos una leyenda
legend("topright", legend = "Boxplot", # Posición y título
    fill = rgb(1, 0, 0, alpha = 0.4),  # Color
    inset = c(0.03, 0.05), # Cambiamos los márgenes
    bg = "white") # Color de fondo de la leyenda