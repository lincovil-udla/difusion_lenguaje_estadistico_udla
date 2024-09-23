<img src="https://github.com/lincovil-udla/imagenes/blob/main/RStudio_logo.svg" alt="Rstudio" width="400" height="300">

# Estadística y R
Este repositorio contiene información 
## Plataformas enndonde corre R

https://rdrr.io/snippets/

## Taller 2

### Actividad 1
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

### Actividad 2

## Referencias




 
