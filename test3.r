x  <- read.csv('reservation_r_csv.csv')
head(x)


install.packages("readxl")
library(readxl)


y <- read_excel("reservation_r_excel.xlsx")
head(y)

write.csv(x, "csv_output.csv")
install.packages("writexl")
library(writexl)

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

x  <-  Orange$Sepal.Length
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
tail(Orange)
summary(Orange)

summary(Orange$Sepal.Length)

str(Orange)

dim(Orange)
nrow(Orange)
ncol(Orange)


length(Orange)
ls()
rm(list=ls())
ls()


x <- c(1,2,3,4,5)
object.size(x)

is.na(Orange)
is.factor(Orange)

is.data.frame(Orange)
head(AirPassengers)

head(Orange)