library(dplyr)
library(tidyverse)

flights <- read.csv("D:\\PROGRAMMING\\R\\DATASETS\\flight_data.csv")

filter(flights, month == 1, day == 1)

(dec25 <- filter(flights, month == 12, day == 25))

filter(flights , month == 11 | month == 12)

dec <- filter(flights, month %in% c(11, 12))

##Those flights whose delayed time was not more
##than two hours

filter(flights, !(arr_delay > 120 | dep_delay >120))

filter(flights, arr_delay <= 120 & dep_delay <= 120)


##flights with arrival delay of two or more hours
filter(flights , arr_delay >= 120 | dep_delay >= 120)

filter(flights, dest == "IAH" | dest == "HOU")

filter(flights, carrier %in% c("UA", "AA", "DL"))

filter(flights, month>=7, month <=9)
filter(flights, month %in% 7:9)
filter(flights, month == 7 | month == 8 | month == 9)

##flights arrived at more than two hours late but didn't leave late
filter(flights, arr_delay >= 120 & dep_delay <=0)

##flights that were delayed at least for 60 minutes but made up
##over 30 minutes in a flights
filter(flights, dep_delay>=60 , dep_delay - arr_delay > 30)


##flights that are departed at midnight and 6:00 AM inclusive
filter(flights, dep_time == 2400 | dep_time <= 600)
filter(flights, dep_time %% 2400<=600)


filter(flights, between(month, 7, 9))

filter(flights, is.na(dep_time))

summary(flights)


##sorting the missing values in start
arrange(flights, dep_time) %>%
  tail()
filter(flights, is.na(dep_time)) %>%
  tail()
arrange(flights, desc(is.na(dep_time)), dep_time)

arrange(flights, desc(dep_time))            ##Most delayed flights
arrange(flights, dep_time)                  ##Flights that left earlier


##Most fastest flights
head(arrange(flights, desc(distance/air_time)))

##Flights that covered shortest distance
head(arrange(flights, distance))
head(arrange(flights, air_time))

##Flights that covered longest distance
head(arrange(flights, desc(distance)))
head(arrange(flights, desc(air_time)))

select(flights, year:dep_time)

##select all columns except those from year to arr_time
head(select(flights, -(year:arr_time)))

head(select(flights, starts_with("arr_"), starts_with("dep_")))
head(select(flights, all_of(c("arr_time", "arr_delay", "dep_time", "dep_delay"))))

select(flights, arr_time)

##It will select those variables that match the pattern
select(flights, contains("TIME"))

##It will add three more columns at the end of dataset and will show only those
transmute(flights, 
       gain = arr_delay - dep_delay,
       hours = air_time/60,
       gain_per_hour = gain/hours)


##Here we are dividing by 100 to get the hours since the midnight 
##midnight is represented by 2400, which corresponds to 1440min(24 hours) since midnight
set1 <- mutate(flights, 
               dep_time_min1 = ((dep_time %/% 100 * 60) %% 1440)%/%100,
               dep_time_min2 = (dep_time %% 100) %%1440,
               sched_dep_min1 = ((sched_dep_time %/% 100 * 60)%%1440)%/%100,
               sched_dep_min2 = (sched_dep_time %% 100)%%1440,
               )

set1 <- set1 %>% unite(dep_time_min, dep_time_min1, dep_time_min2, sep = ":")
set1 <- set1 %>% unite(sched_dep_min, sched_dep_min1, sched_dep_min2, sep = ":")
set1

##we can create a function to avoid copy paste

time2mins <- function(x){
  (x %/% 100 * 60)+(x %% 100) %% 1440
}

set2 <- 
  mutate(flights, 
    dp_T = time2mins(dep_time),
    s_dp_T = time2mins(sched_dep_time)
    )

set3 <- flights %>%
  mutate(time_stayed = arr_time - dep_time)

set3 <- set3 %>% select(air_time, time_stayed)
head(set3)






















