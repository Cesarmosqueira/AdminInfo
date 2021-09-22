rand.valor <- function(x){
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return (valorado)
}

random.df <- function(df, cols){
  nombres <- names(df)
  for (col in cols) {
    nombre <- paste(nombres[col], "valorado", sep = ".")
    df[nombre] <- rand.valor(df[,col])
  }
  df
}

setwd("C:\\Users\\cesar\\Documents\\2021-2\\Admin\\Repository\\LAB06")

data <- read.csv("missing-data.csv", na.strings="")

data.limpio <- random.df(data, c(1,2))
View(data.limpio)