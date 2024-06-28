category <- 'A'
price <- 10
if(category=='A'){
  cat('A VAT rate of 8% is applied .', 'The total price is ',price*1.08)
}else if(category=='B'){
  cat('A VAT rate of 10% is applied.',' The total price is ', price*1.10)
}else{
  cat('A cat rate of 12% is applied.',' The total price is ',price*1.12)
}

##------------------FOR LOOP--------------------

fruits <- c("Apple", "Orange", "Mango", "Banana")
for(i in fruits)
  print(i)


list <- c()
for(i in seq(1, 4, by = 1)){
  list[[i]] <- i*i
}
print(list)


fruits <- list(basket = c("Apple", "orange", "Mango", "banana"),
            money = c(10, 20, 30, 40), purchase = FALSE)
for(k in fruits)
  print(k)


mat <- matrix(data = seq(10, 20, by = 1), nrow = 6, ncol = 2)
for(r in 1:nrow(mat)){
  for(c in 1:ncol(mat)){
    print(paste("Row : ", r, " Col : ", c, " have values of ", mat[r, c]))
  }
}


##---------------While LOOP------------------

begin <- 1
while(begin < 10){
  cat("\nThis is LOOP :- ", begin)
  begin <- begin+1
}
cat("\n\n\n")



set.seed(123)
price <- 50
stock <- 50
count <- 1

while(price > 45){
  #create a random price between 40 and 60
  price <- stock + sample(-10:10, 1)
  count<-count+1
  print(count)
}
cat("It took ", count, " Counts before we short the price. The lowest price is ", price)
cat("\n\n")

















