# Own data elaboration

familia.salario <- c(40000,60000,50000, 80000, 
                     60000, 70000, 60000)

familia.integrantes <- c(4,3,2,2,3,4,3)

familia.auto <- c("Lujo", "Compacto", "SUV", "Lujo", "Compacto", 
                  "Compacto", "Compacto")

familia <- data.frame(familia.salario, familia.integrantes, familia.auto)

duplicated(familia)
familia[duplicated(familia),]
unique(familia)
familias.unicas <- unique(familia)
View(familias.unicas)