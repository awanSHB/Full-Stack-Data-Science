m1 <- matrix(c<-(1:10), nrow = 5, ncol = 6)
m1
m2 <- apply(m1, 2, sum)
m2


#----------lapply() FUNCTION---------

movies <- c("SPY", "BATMAN", "VERTIGO")
movies_lower <- lapply(movies, tolower)
str(movies_lower)

movies_lower <- unlist(lapply(movies, tolower))
str(movies_lower)


#--------sapply() FUNCTION-------
