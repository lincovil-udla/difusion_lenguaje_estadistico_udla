<img src="https://github.com/lincovil-udla/imagenes/blob/main/RStudio_logo.svg" alt="Rstudio" width="400" height="300">

# Estadística y R
Este repositorio contiene información 
## Plataformas enndonde corre R

https://rdrr.io/snippets/

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

```r

```


```r

```


## Referencias




 
