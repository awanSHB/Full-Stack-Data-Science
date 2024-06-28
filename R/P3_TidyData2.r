library(dplyr)
library(tidyverse)
library(ggplot2)

a1<- data.frame(
  country = c("Afghanistan", "Afghanistan", "Afghanistan", "Afghanistan", "Brazil", "Brazil", "Brazil", "Brazil", "China", "China", "China", "China"),
  year = c(1999, 1999, 2000, 2000, 1999, 1999, 2000, 2000, 1999, 1999, 2000, 2000),
  type = c("cases", "population", "cases", "population", "cases", "population", "cases", "population", "cases", "population", "cases", "population"),
  value = c(747, 124513, 654, 326245, 466, 1356543, 968, 9509104, 614, 564245, 564, 414562)
)

a2 <- a1 %>%
  spread(key = type, value = value)
a2

a3 <- a2 %>%
  gather(cases, population, key = "R", value = "V")

a1
a2
a3


'3---Exercise'

stocks <- tibble(
  year = c(2015, 2015, 2016, 2016),
  half = c( 1, 2, 1, 2),
  return = c(1.88, 0.59, 0.92, 0.17)
)

stocks <- stocks %>%
  spread(year, return)

stocks

stocks %>%
  gather("year", "return", '2015':'2016')

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes", NA, 10,
  "no", 20, 12
)

preg %>%
  gather(gender, values, -pregnant)

people <- tribble(
  ~name, ~key, ~value,
  #-----------------|--------|------
  "Phillip Woods", "age", 45,
  "Phillip Woods", "height", 186,
  "Phillip Woods", "age", 50,
  "Jessica Cordero", "age", 37,
  "Jessica Cordero", "height", 156
)

people2 <- people %>%
  mutate(id_no = c(1, 1, 2, 1, 1))

people
people2
people2 %>%
  spread(key = "key", value = "value")

ps <- people %>%
  separate(name, into = c("First_Name", "Last_Name"), convert = TRUE)

ps %>%
  unite(Name, First_Name, Last_Name, sep = " ")

xx <- tibble(x = c("a,b,c", "d,e,f", "h,i,j")) %>%
  separate(x, c("one", "two", "three"))
xx


''
'4--Missing Values'
''

##Here are two missing values
##One is implicit and other is explicit

stocks <- tibble(
  year = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr = c( 1, 2, 3, 4, 2, 3, 4),
  return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)
stocks

stocks1 <- stocks%>%
  spread(year, return)
stocks1

##For turning the explicit missing values implicit
stocks2 <- stocks1 %>%
  gather(year, return, '2015':'2016', na.rm = TRUE)
stocks2

##Here the fill function is filling the empty value
stocks %>%
  fill(return)



head(cars)


boxplot(cars$speed, main = "speed", boxplot.stats(cars$speed)$out)
boxplot(cars$speed)
