install.packages("readxl")

library(readxl)

y <- read_excel("researvation_r_excel.xlsx")

head(y)
tail(y)
dim(y)
ncol(y)
nrow(y)
length(y)

object.size(y)

tail(sleep)
summary(sleep)

dim(sleep)

x  <- c(1,2,3,4,5,6,7,8,NA,10)
is.na(x)
is.numeric(x)
is.logical(x)
is.data.frame(x)


x <- c(1,2,3,4,5)
y <- c(6,7,8,9,10)

y

z <- rbind(x,y)
z

cbind(x,y)

df  <- data.frame(name=c("a", "b"), score=c(80,60))

df


cbind(df, rank=c(1,2))

subset(iris, Sepal.Length > 7)

substr(iris$Species,1,3)

x <- data.frame(name=c("a","b","c"), height=c(170,180,160))

x <- c(20,10,30,50,40)
sort(x, decreasing=FALSE)
sort(x)

x

order(x, decreasing =FALSE)

unique(x)

aggregate(Petal.Length ~ Species, iris, mean)