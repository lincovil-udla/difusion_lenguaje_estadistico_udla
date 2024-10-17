<img src="https://github.com/lincovil-udla/imagenes/blob/main/RStudio_logo.svg" alt="Rstudio" width="100" height="50">

# Estadística y R
Este repositorio contiene información 
## Plataformas enndonde corre R

- Snippets: https://rdrr.io/snippets/
- Programiz https://www.programiz.com/r/online-compiler/
## Taller 2

### Actividad 1

#### Reproducción de eventos aleatorios en R
```r
# Experimento 1: lanzar 3 veces una moneda una moneda al aire
Omega1 <- c("cara", "sello")

sample(Omega1, 3, prob = c(0.5, 0.5), replace = TRUE)

# Experimento 2: lanzar dos monedas al aire 3 veces

Omega2 <- c("cara-cara", "sello-sello", 
            "cara-sello", "sello-cara")

sample(Omega2, 3, prob = c(0.25, 0.25, 0.25, 0.25), replace = TRUE )

# Experimento 3:Lanzamiento de un dados
Omega3 <- c(1,2,3,4,5,6)
sample(Omega3, 1, prob = c(1/6, 1/6, 1/6,
                            1/6, 1/6, 1/6))
```
#### Creación y análisis de una matriz de datos
```r
# Construccion de matriz de datos

# Numero de mensajes de Whatsapp
# Media de mensajes diarios
set.seed(1)
x1 <- rpois(30, 4)

# Tiempo de espera en respuestas de mensajes de Whatsapp
set.seed(2)
x2 <- runif(30, 0, 10)

# Nivel de escolaridad

Omega <- c("Básica","Media","Universitaria","Postgrado")
set.seed(3)
x3 <- sample(Omega, 30, prob = c(0.25,0.25,0.25,0.25), replace = TRUE)

datos <- data.frame(x1,x2,x3)

# Grafico de barras para tiempo de espera

tabla1 <- table(datos$x2)
barplot(tabla1)

# Histograma para tiempo de espera

hist(datos$x2)

# histograma con intervalos de largo 2.5

intervalos <- c(0, 2.5, 5, 7.5,10)
hist(datos$x2, breaks = intervalos, axes = FALSE)
axis(side=1, at=seq(0,10, 2.5))

# Barplot para la variable

tabla2 <- table(datos$x1)
barplot(tabla2)

# 
tabla3 <- (table(datos$x3)/30)*100 # row percentages
barplot(tabla3,
        col = c("red", "blue", "green", "orange"))
```
### Actividad 2

Pertinencia de la mediana y media en datos asimetricos. 
Generos datos con distintos tipo de simetria

# Pertinencia de la mediana y media en datos con observaciones extremas

```r
set.seed(110)
datos3 <- rnorm(n, mean=100, sd=10 )
intervalo <- seq(min(datos3), max(datos3)+1, by=2)

hist(datos3, 
     main="Histograma datos simetricos sin outliers", 
     breaks=intervalo )

```

Pertinencia de la mediana sobre la media

```r
datos33 <- c(datos3, rnorm(100, mean=300, sd=1))

boxplot(datos33, horizontal = TRUE)
summary(datos3)
media33 <- mean(datos33)
mediana33 <- median(datos33)

print(paste("Media:", media33))
print(paste("Mediana:", mediana33))
print(paste("Diferencia media -mediana:", media33 - mediana33))

intervalo33 <- seq(min(datos33), max(datos33)+1, by= 1)

hist(datos33, breaks=intervalo33,
     main="Histograma datos simetricos con outliers")

hist(datos33, 
     main="Histograma datos simetricos sin outliers", 
     breaks=intervalo33,
     xlim = c(60, 150))

abline( v= media33, col="blue", lwd=3)
abline( v= mediana33 , col="red", lwd=3)
legend("topright", legend=c("Mediana", "Media"), 
       col=c("red", "blue"), lwd=3, cex = 0.85)

```

 Propiedades de la media
```r
# Crear un vector de datos original
datos <- c(10, 12, 14, 16, 18)

# Calcular la media original
media_original <- mean(datos)
print(paste("Media original:", media_original))

# Sumar una constante (por ejemplo, 5) a cada valor
datos_sumados <- datos + 10

par(mfcol = c(1, 2))
boxplot(datos, main= "Sin suma")
boxplot(datos_sumados, main = "Con suma")

# Calcular la nueva media
media_sumada <- mean(datos_sumados)
print(paste("Media después de sumar 10:", media_sumada))

# Comparar las medias mediante la diferencia
diferencia <- media_sumada - media_original
print(paste("Diferencia entre las medias:", diferencia))

```

Propiedades de la varianza

```r
# Crear un vector de datos original
datos <- c(10, 15, 20, 25, 30)

# Calcular la varianza original
varianza_original <- var(datos)
print(paste("Varianza original:", varianza_original))

# Sumar y verificar varianza
datos + 10
varianza_mas_10 <- var(datos + 10)
print(paste("Varianza X+10:", varianza_mas_10))


# Multiplicar cada valor por una constante (por ejemplo, 3)
datos_multiplicados <- 3*datos

# Calcular la nueva varianza
varianza_multiplicada <- var(datos_multiplicados)
print(paste("Varianza después de multiplicar por 3:", varianza_multiplicada))

# Calcular el factor de multiplicación de la varianza
factor_multiplicacion <- varianza_multiplicada / varianza_original
print(paste("Factor de multiplicación de la varianza:", factor_multiplicacion))


```

## Referencias

- Manual de R en linea. https://fhernanb.github.io/Manual-de-R/


 
