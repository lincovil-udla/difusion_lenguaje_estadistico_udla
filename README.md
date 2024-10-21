<img src="https://github.com/lincovil-udla/imagenes/blob/main/RStudio_logo.svg" alt="Rstudio" width="100" height="50">

# Estadística y R
Este repositorio contiene información 
## Plataformas en donde corre R

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
# Taller 3

## Actividad 2

### Pertinencia de la mediana y media en datos con observaciones extremas

En el contexto de la Fórmula 1, una velocidad promedio de 100 kilómetros por hora sería extremadamente baja, 
dado que los autos suelen promediar entre 200 y 250 km/h en una carrera normal. No obstante, podemos imaginar 
un escenario muy atípico, como una carrera con condiciones climáticas adversas, múltiples incidentes en la pista, 
o un circuito extremadamente técnico con muchas curvas cerradas, que podrían forzar a los autos a reducir significativamente 
su velocidad promedio.

En esta hipotética carrera de Fórmula 1, podrías tener autos que alcanzan velocidades pico de 150 km/h en las rectas, 
pero debido a las frenadas intensas y las maniobras cuidadosas en curvas difíciles, la velocidad promedio caería a unos 100 km/h.

Es como ver un guepardo que puede correr a 120 km/h, pero tiene que cazar en un terreno lleno de obstáculos, lo que reduce su 
velocidad promedio a algo mucho más manejable. ¿Te imaginas una carrera así? 

```r
set.seed(110)
datos1 <- rnorm(n, mean=100, sd=10 )
intervalo <- seq(min(datos1), max(datos1)+1, by=2)

hist(datos1, 
     main="Histograma datos simetricos sin datos extremos ", 
     breaks=intervalo )
```

<img src="https://raw.githubusercontent.com/lincovil-udla/difusion_lenguaje_estadistico_udla/refs/heads/main/Imagenes/histograma%201.png" alt="Rstudio" width="400" height="300">

Pertinencia de la mediana sobre la media

```r
datos2 <- c(datos1, rnorm(100, mean=300, sd=1))

boxplot(datos2, horizontal = TRUE)
summary(datos2)
media <- mean(datos2)
mediana <- median(datos2)

print(paste("Media:", media))
print(paste("Mediana:", mediana))
print(paste("Diferencia media -mediana:", media - mediana))

intervalo <- seq(min(datos2), max(datos2)+1, by= 1)

hist(datos2, breaks=intervalo33,
     main="Histograma datos simetricos con outliers")

hist(datos2, 
     main="Histograma datos simetricos transladados", 
     breaks=intervalo33,
     xlim = c(60, 150))

abline( v= media33, col="blue", lwd=3)
abline( v= mediana33 , col="red", lwd=3)
legend("topright", legend=c("Mediana", "Media"), 
       col=c("red", "blue"), lwd=3, cex = 1)

```

<img src="https://raw.githubusercontent.com/lincovil-udla/difusion_lenguaje_estadistico_udla/refs/heads/main/Imagenes/boxplot%20extremos.png" alt="Rstudio" width="400" height="300">

<img src="https://raw.githubusercontent.com/lincovil-udla/difusion_lenguaje_estadistico_udla/refs/heads/main/Imagenes/histograma%20con%20extremos.png" alt="Rstudio" width="400" height="300">

<img src="https://raw.githubusercontent.com/lincovil-udla/difusion_lenguaje_estadistico_udla/refs/heads/main/Imagenes/histograma%20sin%20extremos.png" alt="Rstudio" width="400" height="300">

## Propiedades del promedio

```r
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

```
<img src="https://raw.githubusercontent.com/lincovil-udla/difusion_lenguaje_estadistico_udla/refs/heads/main/Imagenes/boxplot%20promedio.png" alt="Rstudio" width="400" height="300">

## Propiedades de la varianza

$$ \ (1) \  Var(X+c) = Var(X).$$
$$ \ (2) \  Var(cX) = c^2 Var(X). $$

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

```

<img src="https://raw.githubusercontent.com/lincovil-udla/difusion_lenguaje_estadistico_udla/refs/heads/main/Imagenes/boxplot%20varianza.png" alt="Rstudio" width="500" height="400">

## Referencias

- Manual de R en linea. https://fhernanb.github.io/Manual-de-R/


 
