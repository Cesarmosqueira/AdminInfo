setwd("C:\Users\cesar\Documents\2021-2\Admin\Repository\LAB03")

mt.iris <- iris

# View(head(my.iris))

ls()

my.iris <- iris
my.iris$Petal.Area <- my.iris$Petal.Length * my.iris$Petal.Width

my.iris$Petal.Area <- NULL

my.iris <- iris[order(iris$Petal.Length),]

x <- 1:10

y <- iris$Species

x <- x^2
x[-length(x)]

plot(x)

# counts
w <- table(iris$Species)
w["setosa"]
w[c("setosa", "virginica")]

# column name
my.iris <- iris
colnames(my.iris)[5] <- "Especie"
colnames(my.iris)
z <- table(iris$Species)
names(z)
names(z)[1]

# samples
sample(x, 50, replace = TRUE)


# sum of squares
x <- 1:10
suma_cuadrados <- function(x) sum(x*x)
suma_cuadrados(x)
