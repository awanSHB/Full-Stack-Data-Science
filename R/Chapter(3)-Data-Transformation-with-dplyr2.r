library(tidyverse)
library(dplyr)
library(ggplot2)
library(Lahman)

flights <- read.csv("D:\\PROGRAMMING\\R\\DATASETS\\
                    flight_data.csv")
view(flights)

#EXAMPLE
#<====
mydt <- data.frame(
  year = c(2017,2017,2017,2017,2017,2017,2017,2017,2017,2017, 2017,2017,2016,2016,2016,2016,2016,
           2016,2016,2016,2016,2016,2016,2016),
  month = c(12,11,10,9,8,7,6,5,4,3,2,1,12,11,10,9,8,7,6,5,4,3,2,1),
  interest_rate = c(2.75,2.5,2.5,2.5,2.5,2.5,2.5,2.25,2.25,2.25,2,2,2,1.75,1.75,1.75,1.75,1.75,
                    1.75,1.75,1.75,1.75,1.75,1.75),
  unemployement_rate = c(5.3,5.3,5.3,5.3,5.4,5.6,5.5,5.5,5.5,5.6,5.7,5.9,6,5.9,5.8,6.1,6.2,6.1,
                         6.1,6.1,5.9,6.2,6.2,6.1),
  index_price = c(1464,1394,1357,1293,1256,1254,1234,1195,1159,1167,1130,1075,1047,965,943,958,
                  971,949,884,866,876,822,704,719)
)
view(mydt)

mydt %>%
  group_by(year) %>%
  summarise(
    count = n(),
    int_rate = mean(interest_rate, na.rm = TRUE),
    unemp_rate = mean(unemployement_rate, na.rm = TRUE),
    ind_pri = mean(index_price, na.rm = TRUE)
    
  )

#====

summarise(flights, mean(dep_delay, na.rm = TRUE))

summarise(flights, delay = mean(dep_delay, na.rm=TRUE))

A <- group_by(flights, month, year, day)
summarise(A, delay = mean(dep_delay, na.rm = TRUE))


(by_dest <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ))

(by_dest<- by_dest %>% filter(count > 20, dest!="HNL"))


(by_dest_plot <- by_dest %>% 
  ggplot(aes(x = dist, y = delay))+
  geom_point(aes(size = count, col = count))+
  geom_smooth(se = FALSE, col = "black"))
  

boxplot(by_dest$delay)

by_dest$delay <- scale(by_dest$delay)

boxplot(by_dest$delay)


'-----------REMOVING OUTLIER----------'
#<====
Q1 <- quantile(by_dest$delay, 0.25)
Q3 <- quantile(by_dest$delay, 0.75)
IQR = Q3-Q1

by_dest_delay <- by_dest[
  !(by_dest$delay < Q1 - 1.5*IQR | 
      by_dest$delay > Q3 +1.5*IQR),]


Q <- quantile(by_dest_delay$delay, 0.75)
IQR = Q-IQR

by_dest_delay <- by_dest_delay[
  !(by_dest_delay$delay < Q1 - 1.5*IQR | 
      by_dest_delay$delay > Q +1.5*IQR),]

boxplot(by_dest_delay$delay)


##Here we removed the outliers
(by_dest_delay_plot <-by_dest_delay %>% 
  ggplot(aes(x = dist, y = delay))+
  geom_point(aes(size = count), alpha = 1/3)+
  geom_smooth(se = FALSE))

#====

##With Outliers
by_dest_plot
boxplot(by_dest$delay)

##Without Outliers
boxplot(by_dest_delay$delay)
by_dest_delay_plot


#Here selecting those flights that are not cancelled

not_cancelled_flights <- flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled_flights %>%
  group_by(year, month, day) %>%
  summarise( mean = mean(dep_delay))

##Selecting planes that have highest average delays

delays <- not_cancelled_flights %>%
  group_by(tailnum) %>%
  summarise(delay = mean(arr_delay))

#Frequency plot
delays %>% ggplot(aes(x = delay)) +
  geom_freqpoly(binwidth = 10)

delays <- not_cancelled_flights %>%
  group_by(tailnum) %>%
  summarise(
    count = n(),
    delay = mean(arr_delay, na.rm = TRUE)
  )
#Using scatter plot
delays %>% ggplot(aes(x = count, y = delay))+
  geom_point(alpha = 1/7)

delays %>% filter(count > 400) %>%
  ggplot(aes(x = count, y = delay))+
  geom_point()

delays %>% filter(count > 400) %>%
  ggplot(aes(x = count, y = delay))+
  geom_point()+
  geom_smooth()



view(Lahman::Batting)

























