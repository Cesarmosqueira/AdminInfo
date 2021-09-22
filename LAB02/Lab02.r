titanic <- read.csv("dataset/titanic.csv")
View(head(titanic))

head(titanic_data,10) 
tail(titanic_data,10)
names(titanic_data) 

str(titanic_data) 
summary(titanic)

sin_valor <- function(x){ 
  sum = 0 
  for(i in 1:ncol(x)) 
  { 
    cat("En la columna",colnames(x[i]),"total de valores NA:",colSums(is.na(x[i])),"\n") 
  } 
  print()
} 
sin_valor(titanic)

en_blanco <- function(x){ 
  sum = 0 
  for(i in 1:ncol(x)) 
  { 
    cat("En la columna",colnames(x[i]),"total de valores en blanco:",colSums(x[i]==""),"\n") 
  } 
} 
en_blanco(titanic)

library(ggplot2) 
library(scales) 
ggplot(data = titanic, aes(x = Survived, y = Fare, fill = factor(Pclass))) +  
  geom_boxplot() +  
  geom_hline(aes(yintercept = 80),  
             colour = "red", linetype = "dashed", lwd = 2) + 
  scale_y_continuous(labels = dollar_format()) +  
  theme_bw() 

titanic$Survived[c(62, 830)] <- "C"

barplot(table(titanic$Pclass), main="Pasajeros de Titanic por Cl
ase", names= c("Primera", "Segunda", "Tercera")) 

table(titanic$Sex) 
barplot(table(titanic$Sex), main="Pasajeros del Titanic por Gen
ero", names= c("Mujer", "Hombre"))

counts = table(titanic$Survived, titanic$Sex) 
barplot(counts, col=c("green","yellow"), legend = c("Murieron", "Sobr
evivieron"), main = "Sobreviviencia de Pasajeros por Genero")

counts1 = table(titanic$Survived, titanic$Pclass)  
barplot(counts1, col=c("green","yellow"), legend = c("Murieron","Sobr
evivieron"), main = "Sobreviviencia de Pasajeros por Clase", names= c("
Primera", "Segunda", "Tercera")) 
