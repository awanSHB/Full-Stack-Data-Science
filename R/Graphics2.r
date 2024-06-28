library(NHANES)

ggplot(data = sample_n(NHANES, size = 1000),
       aes(x = Age, y = Height, color = Gender))+
  geom_point() + geom_smooth() + xlab("Age(years)") +
  ylab("Height(cm)")
