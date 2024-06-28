library(dplyr)
library(Lahman)
dim(Teams)

Teams %>%
  select(teamID, yearID, franchID, W, L, R, RA) %>%
  filter(yearID %in% 2004:2012) %>%
  rename(RS = R) %>%
  mutate(
    WPct = W/(W+L), WPctHat = 1/(1+(RA/RS)^2), WHat = WPctHat * (W+L))%>%
  group_by(franchID) %>%
  summarise(
    numYears = n(), totalW = sum(W), totalL = sum(L),
    totalWPct = sum(W)/sum(W+L), sumReside = sum(W-WHat)) %>%
  arrange(sumReside) %>%
  print(n=6)

