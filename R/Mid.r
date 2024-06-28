library(dplyr)

d <- data.frame(row = (1:6), word = c(
  "2-faces", "annormal", "abolish", "abominably", "abominable",
  "abominate"), sentiments = c(
    "negative","negative","negative","negative","negative",
    "negative"))

d %>% filter(sentiments =="negative")
d %>% filter(sentiments=="positive")

df <- data.frame(
  id = c(1, 2, 3, NA),
  address = c('Orange st', 'Anton Blvd', 'Jefferson Plwy', ''),
  work_address = c('Main st', NA, 'Apple Blvd', 'Portola Pkwy')
)
df $ address [df $ address =='Orange st'] <- "Lahore"
df $ work_address [df $ work_address =='Main st'] <- "Karachi"

df %>% rename(Office_destination = work_address)


df1 <- data.frame(
  col1 = c(1, 2, 3, 4, 5, 7, 6, 8, 9, 7),
  col2 = c(2, 3, 4, 5, 6, 5, 5, 4, 6, 3),
  col3 = c(5, 7, 8, 9, 9, 3, 5, 3, 8, 9),
  col4 = c(43, 54, 6, 3, 8, 5, 6, 4, 4, 3)
)

df1 %>% mutate(Mean = mean(col1), Std = sd(col2), Median = median(col3))

