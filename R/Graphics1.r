library(tidyverse)
library(gapminder)

g <- ggplot(data = gapminder, aes(y = lifeExp, x = gdpPercap))
g + geom_point(size = 1)

g+geom_point(aes(color = continent), size = 3)

g+geom_text(aes(label = country, color = continent), size = 3)

g+geom_point(aes(color = continent)) + scale_x_log10()+
  geom_smooth(method = "lm")