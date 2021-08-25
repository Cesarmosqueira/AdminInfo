en_blanco <- function(x) {
	sum = 0
	for (i in 1:ncol(x)) {
		cat ("En la columna ", colnames(x[i]), " total de valores en blanco: ",
			colSums(x[i] == ""), "\n")
	}
}


print("Train:")
en_blanco(titanic_train)
