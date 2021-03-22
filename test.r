x  <- read.csv('reservation_r_csv.csv')
head(x)


install.packages("readxl")
library(readxl)


y <- read_excel("reservation_r_excel.xlsx")
head(y)