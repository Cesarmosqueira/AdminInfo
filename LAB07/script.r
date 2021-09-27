setwd('/home/g/Documents/AdminInfo/LAB07')
library(scales)

estudiantes <- read.csv('data-conversion.csv')
View(estudiantes)

estudiantes$Income.rescaled <- rescale(estudiantes$Income)
View(estudiantes) 

(estudiantes$Income - min(estudiantes$Income))/ (max(estudiantes$Income)- min(estudiantes$Income)) 

rescale(estudiantes$Income, to = c(0,100))

rescalar.cols <- function(df, cols){ 
  nombres <- names(df) 
  for (col in cols){ 
    nombre <- paste(nombres[col], 'rescaled', sep = '.') 
    df[nombre] <- rescale(df[,col]) 
  } 
  cat(paste("Hemos reescalado ", length(cols), " variable(s)")) 
  df 
}

estudiantes <- rescalar.cols(estudiantes, c(1,4))
View(estudiantes)

casas <- read.csv("BostonHousing.csv") 

View(casas)

casas.z <- scale(casas) 
View(casas.z)

casas.mean <- scale(casas, center = TRUE, scale = FALSE) 

View(casas.mean)

casas.sd <- scale(casas, center = FALSE, scale = TRUE)

View(casas.sd)

normalizar.cols <- function(df, cols){
  nombres <- names(df) 
  for (col in cols){ 
    nombre <- paste(nombres[col], "z", sep = ".") 
    df[nombre]<- scale(df[,col]) 
  } 
  cat(paste("Hemos normalizado ", length(cols), " variable(s)")) 
  df 
}

casas <- normalizar.cols(casas, c(1,3,5:8))
View(casas) 
