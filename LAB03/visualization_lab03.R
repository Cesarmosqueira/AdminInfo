setwd("C:\Users\cesar\Documents\2021-2\Admin\Repository\LAB03")

mt.iris <- iris

#hist(iris$Sepal.Width)

hist(iris$Sepal.Width, main = "Iris: Histograma de la anchura de los sépalos",
     xlab = "anchura del sépalo", ylab = "frecuencia",
     col = "steelblue")
barplot(table(iris$Species))

plot(iris$Petal.Length, iris$Petal.Width, main="Edgar Anderson's Iris Da
ta")

boxplot(iris$Sepal.Width ~ iris$Species, col = "gray", main = "Especies
de iris\nsegún la anchura del sépalo")