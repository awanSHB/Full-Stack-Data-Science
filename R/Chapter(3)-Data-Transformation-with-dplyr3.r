library(Lahman)
library(tidyverse)
library(dplyr)

view(LahmanData)
view(Lahman::Batting)

(batting_data <- as_tibble(Lahman::Batting))

###Calculate the batting average of a player
###we will do this by grouping with batter_id and
###no_of_opportunities i.e. no_of_hits / no_of_attempts

batters <- batting_data %>%
  group_by(playerID) %>%
  summarise(
    count = n(),
    ba = sum(H, na.rm = TRUE)/sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )
batters %>% arrange(desc(count))

batters %>% filter(ab > 100) %>%
  ggplot(aes(x = ab, y = ba)) +
  geom_point()+
  geom_smooth(se = FALSE)

boxplot(batters$ab)  

'-----------REMOVING OUTLIERS-----------'
#<====
Q1 <- quantile(batters$ab, 0.25)
Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

Q3 <- quantile(batters$ab, 0.75)
IQR = Q3-Q1

batters <- batters[!(
  batters$ab < Q1 - 1.5*IQR| batters$ab > Q3 + 1.5*IQR
),]

boxplot(batters$ab)

#====






















