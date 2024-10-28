
# Actividad: Pertinencia de la mediana

# Generamos datos simetricos
set.seed(110)
n <- 100
datos1 <- rnorm(n, mean=100, sd=10 )
intervalo <- seq( min(datos1)-1, max(datos1)+1, by=2)

hist(datos1, 
     main="Histograma datos simetricos sin datos extremos ", 
     breaks=intervalo )

# Agregamos valores extremos a la derecha del promedio
set.seed(23)
datos2 <- c(datos1, rnorm(15, mean=200, sd=10))

# Graficamos caja y bigotes y observamos los valores extremos
boxplot(datos2, horizontal = TRUE, 
        main="Caja y bigotes con valores extremos")

summary(datos2)
media <- mean(datos2)
mediana <- median(datos2)

print(paste("Media:", media))
print(paste("Mediana:", mediana))
print(paste("Diferencia media -mediana:", media - mediana))

intervalo2 <- seq(min(datos2), max(datos2)+1, by= 1)

# Histograma con valores 
hist(datos2, breaks=intervalo2,
     main="Histograma datos simétricos con valores extremos")
abline( v= media33, col="blue", lwd=3)
abline( v= mediana33 , col="red", lwd=3)
legend("topright", legend=c("Mediana", "Media"), 
       col=c("red", "blue"), lwd=3, cex = 1.5)


hist(datos2, 
     main="Histograma datos simetricos transladados. Omitimos valores extremos", 
     breaks=intervalo2,
     xlim = c(60, 150))

abline( v= media33, col="blue", lwd=3)
abline( v= mediana33 , col="red", lwd=3)
legend("topright", legend=c("Mediana", "Media"), 
       col=c("red", "blue"), lwd=3, cex = 1.5)


# Propiedad del promedio

# Crear un vector de datos original
datos <- c(10, 12, 14, 16, 18)

# Calcular la media original
media_original <- mean(datos)
print(paste("Media original:", media_original))

# Sumar una constante (por ejemplo, 5) a cada valor
datos_sumados <- datos + 10


# Calcular la nueva media
media_sumada <- mean(datos_sumados)
print(paste("Media después de sumar 10:", media_sumada))

# Comparar las medias mediante la diferencia
diferencia <- media_sumada - media_original
print(paste("Diferencia entre las medias:", diferencia))


# Reunir los datos en solo un una matriz
X <- data.frame(x= c(datos, datos_sumados), y=c(rep("No sumado",5), rep("Sumado",5)) )
boxplot(x~y, data=X)
abline( h= media_original, col="blue", lwd=3)
abline( h= media_sumada , col="red", lwd=3)
legend("topleft", legend=c("Media sumada", "Media no sumada"), 
       col=c("red", "blue"), lwd=3, cex = 1)

# Propiedad de la varianza

# Crear un vector de datos original
datos <- c(10, 15, 20, 25, 30)

# Calcular la varianza original
varianza_original <- var(datos)
print(paste("Varianza original:", varianza_original))

# Sumar y verificar varianza
datos + 10
varianza_mas_10 <- var(datos + 10)
print(paste("Varianza X+10:", varianza_mas_10))

# Las varianzas son iguales
print(paste("Diferencia entre las medias:", 
            varianza_original - varianza_mas_10))

# Multiplicar cada valor por una constante (por ejemplo, 3)
datos_multiplicados <- 3*datos

# Calcular la nueva varianza
varianza_multiplicada <- var(datos_multiplicados)
print(paste("Varianza después de multiplicar por 3:", varianza_multiplicada))

# Calcular el factor de multiplicación de la varianza
factor_multiplicacion <- varianza_multiplicada / varianza_original
print(paste("Factor de multiplicación de la varianza:", factor_multiplicacion))

# Reunir los datos en solo un una matriz
Y <- data.frame(x= c(datos, datos_multiplicados), 
                y=c(rep("Original",5), rep("Múltiplicado",5)) )

boxplot(x~y, data=Y,
        horizontal = TRUE)
abline( h= media_original, col="blue", lwd=3)
abline( h= media_sumada , col="red", lwd=3)
legend("topright", 
       legend=c(paste("Varianza original", varianza_original), 
                paste("Varianza aumentada",varianza_multiplicada)), 
        lwd=3, cex = 1.5)


