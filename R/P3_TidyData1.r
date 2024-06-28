library(dplyr)
library(ggplot2)
library(tidyverse)

mydata <- data.frame(
  country = c("Afghanistan", "Afghanistan", "Brazil", "Brazil", "China", "China"),
  year = c(1999, 2000, 1999, 2000, 1999, 2000),
  cases = c(745, 2666, 3773, 8048, 21222, 213455),
  populatioon = c(1419041, 194104, 142419, 141204, 142142, 1421009)
)
mydata

mydata %>%
  mutate(rate = cases/populatioon*100)

mydata %>%
  count(year, wt = cases)

mydata %>%
  ggplot(aes(year, cases)) +
  geom_line(aes(group = country), color = "grey50") +
  geom_point(aes(color = country))

'--------------------------------------------------------'

mydata1a <- data.frame(
  country = c("Afghanistan", "Brazil", "China"),
  "1999" = c(745, 37737, 212258),
  "2000" = c(266, 80488, 213766)
)
## Here we are changing the variable names
mydata2a <- mydata1a %>%
  rename("1999" = X1999, "2000" = X2000)

mydata1b <- data.frame(
  country = c("Afghanistan", "Brazil", "China"),
  "1999" = c(7494568, 3778990, 212258),
  "2000" = c(266656, 8048843, 2139000)
)
# Here we are changing the variable names
mydata2b <- mydata1b %>%
  rename("1999" = X1999, "2000" = X2000)
mydata2b


# Gathering a numeric variables
mydata3a <- mydata2a %>%
  gather('1999', '2000', key = "year", value = "cases")
mydata3a

# Gathering a numeric variables
mydata3b <- mydata2b %>%
  gather('1999', '2000', key = "year", value = "population")
mydata3b

mutual_result <- left_join(mydata3a, mydata3b)
mutual_result

mydata2a
mydata2b
mydata3a
mydata3b
mutual_result

mydata2a %>%
  gather(1999, 2000, key = "year", value = "cases")





