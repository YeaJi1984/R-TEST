x  <- read.csv('reservation_r_csv.csv')
head(x)


install.packages("readxl")
library(readxl)


y <- read_excel("reservation_r_excel.xlsx")
head(y)

write.csv(x, "csv_output.csv")
install.packages("writexl")

write_xlsx(y, "excel_output.xlsx")

sink("ouput.txt")


x  <- c(1,2,3)
y  <- c(4,5,6)


save(x,y, file="save.Rdata")




rm(list = ls())
x

load("save.Rdata")

x <- c(1,2,3)
y <- c(4,5,6)
z <- c(8,9,10)

save(list=ls(), file="save2.rda")

connect  <-  file("result.txt", 'w')

x  <-  iris$Sepal.Length
cat(summary(x),file = connect)
close(connect)




x  <-  read.csv("reservation_r_csv.csv")
head(x)
tail(x)
str(x)
summary(x)
View(x)
dim(x)

library(help=datasets)
head(Orange,10)
tail(iris)
summary(iris)

summary(iris$Sepal.Length)

str(iris)

dim(iris)
nrow(iris)
ncol(iris)


length(iris)
ls()
rm(list=ls())
ls()


x <- c(1,2,3,4,5)
object.size(x)

is.na(iris)
is.factor(iris)

is.data.frame(iris)
head(AirPassengers)

head(Orange)