setwd("C:\\Users\\cesar\\Documents\\2021-2\\Admin\\Repository\\LAB06")

data <- read.csv("missing-data.csv", na.strings="")
data$Income[data$Income == 0] <- NA

# Create income mean column and replace NA incomes with income mean
data$Income.mean <- ifelse(is.na(data$Income), mean(data$Income, na.rm =
                                                      TRUE), data$Income)
View(data)