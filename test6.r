plot(iris$Petal.Length, iris$Petal.Width)

plot(iris$Petal.Width, iris$Petal.Width, main ="iris data", xlab ="Petal Length", ylab="Petal Width", col = iris$Species)


pairs(~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length, data = iris, col = iris$Species)

hist(iris$Sepal.Width, freq = FALSE)

x <- aggregate(Petal.Length ~ Species, iris, mean)

barplot(x$Petal.Length, names = x$Species)

X  <- aggregate(Petal.Length ~ Species, iris, sum)
pie(x$Petal.Length, labels = x$Species)

dim(women)

data()

plot(swiss$Examination)

head(swiss)
plot(swiss$Fertility, swiss$Agriculture)
plot(swiss$Fertility, swiss$Agriculture, main="swiss data", xlab="Fetality", ylab="agriculture", col =swiss$Catholic)
head(iris)