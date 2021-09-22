setwd("C:\\Users\\cesar\\Documents\\2021-2\\Admin\\Repository\\LAB06")

data <- read.csv("missing-data.csv", na.strings="")
data.limpia <- na.omit(data)
View(data.limpia)

# test data
is.na(data[4,2])
is.na(data[4,1])
is.na(data$Income)

# Clean NA from df
data.income.limpio <- data[!is.na(data$Income),]
complete.cases(data)
data.limpia2 <- data[complete.cases(data),]

# Clean zeros
data$Income[data$Income == 0]
data$Income[data$Income == 0] <- NA
data$Income[data$Income == 0]

# Income mean
mean(data$Income)
mean(data$Income, na.rm=TRUE)

# Income standard deviation
sd(data$Income)
sd(data$Income, na.rm=TRUE)

# Income simple sum
sum(data$Income)
sum(data$Income, na.rm=TRUE)