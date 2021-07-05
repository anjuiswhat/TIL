




split(iris, iris$Species)

lapply(split(iris, iris$Species), mean)


# iris의 종별 Sepal.Length의 평균




head(iris)

split(iris$Sepal.Length, iris$Species)


lapply(
    split(iris$Sepal.Length, iris$Species),
    mean
)

tapply(
    iris$Sepal.Length,
    iris$Species,
    mean
)

subset(iris,
       select = -c(Sepal.Length,Species)
       )





?subset()

names(iris)

iris[ , names(iris) %in% c('Sepal.Length', 'Species')]


x <- data.frame(name=c("a", "b", "c"), math=c(1, 2, 3))
y <- data.frame(name=c("c", "b", "a"), english=c(4, 5, 6))

x
y


merge(
    x, y, 'name'
)



?merge()


####################################################
head(iris)

iris[1,1] = NA

head(iris)
########################################################

a <- split(iris$Sepal.Length, iris$Species)



b <- sapply(a, mean, na.rm=TRUE)







within( iris,
        { ifelse(
            is.na(Sepal.Length), b
        )}
)











tapply(
    iris$Sepal.Length,
    iris$Species,
    median, na.rm=T
)















Sepal.Width


search()




attach(iris)

search()

Sepal.Width



detach(iris)

search()

Sepal.Width





















