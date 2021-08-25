titanic <- read.csv("/home/g/Downloads/Dataset/titanic.csv")
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
