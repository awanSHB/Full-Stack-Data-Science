library(Lahman)
library(dplyr)
dim(Teams)

mets <- Teams %>% filter(teamID == "NYN")
myMets <- mets %>% filter(yearID %in% 2004:2012)
myMets %>% select(yearID, teamID, W, L)

select(filter(mets, teamID == "NYN" & yearID %in% 2004:2012), yearID,
       teamID, W, L)

Teams %>%
  select(yearID, teamID, W, L) %>%
  filter(teamID == "NYN" & yearID %in% 2004:2012)

#Modifying the select method by and storing it in metsBen
metsBen <- Teams %>%
  select(yearID, teamID, W, L, R, RA) %>%
  filter(teamID=="NYN" & yearID %in% 2004:2012)
metsBen

#Here we are renaming the column with name R
metsBen <- metsBen %>% rename(RS = R)
metsBen

#Adding the new column
metsBen <- metsBen %>% mutate(WPct = W/(W+L))
metsBen


