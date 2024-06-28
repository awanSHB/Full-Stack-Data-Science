library(tidyverse)
library(ggplot2)

demograph <- read.csv(
  "D:\\PROGRAMMING\\R\\DATASETS\\
  Korean_demographics_2000-2022.csv")

demograph %>% ggplot()+
  geom_point(aes(x = Divorce, y = Marriage))

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))

dim(mtcars)
nrow(mtcars)
ncol(mtcars)

dim(demograph)
nrow(demograph)
ncol(demograph)

head(demograph)

ggplot(data = mpg) +
  geom_point(aes(x = class, y = drv))

##Here if you set color to blue then it will not be
##displayed blue because it is treated as an
##Aesthetic(which is mapping b/w variable and value)
ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy), color = "blue")

ggplot(data = demograph)+
  geom_point(aes(x = Divorce, y = Marriage, 
                 color = Region))

ggplot(data = demograph)+
  geom_point(aes(x = Divorce, y = Marriage,
                 color = Region, alpha = Region))

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy,
                 size = 1,stroke = 3),shape = 21)
ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy, color = displ<5))
ggplot(data = demograph)+
  geom_point(aes(x = Marriage, y = Divorce, color = Marriage < 25000))

'
-----------Facets
'

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))+
  facet_wrap(~class, nrow = 3)

ggplot(data = demograph)+
  geom_point(aes(x = Birth, y = Death))+
  facet_wrap(~Region, nrow = 3)

ggplot(data = demograph)+
  geom_point(aes(x = Birth, y = Death))+
  facet_wrap(.~Region)

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))+
  facet_grid(.~cty)

##The . ignores the dimension when faceting
ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))+
  facet_grid(cyl~.)


ggplot(data = mpg)+
  geom_smooth(aes(x = displ, y = hwy, linetype = drv))

ggplot(data = demograph)+
  geom_smooth(aes(x = Birth, y = Death),
              se = FALSE)

ggplot(data = demograph, aes(x = Birth, y = Death))+
  geom_point(aes(color = Region))+
  geom_smooth(se = FALSE)


ggplot(data = mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point()+
  geom_smooth(se = FALSE)


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  ) +
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  )



ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point()+
  geom_smooth(se = FALSE)

ggplot(data = mpg, aes(x = displ, y = hwy,line = drv))+
  geom_point()+
  geom_smooth(se = FALSE)

ggplot(data = mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point()+
  geom_smooth(se = FALSE)

ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = drv))+
  geom_smooth(se = FALSE)

ggplot(data = mpg, aes(x = displ, y = hwy, linetype = drv))+
  geom_point(aes(color = drv))+
  geom_smooth(se = FALSE)

'
----------Bar Charts
'

ggplot(data = diamonds)+
  stat_count(aes(x = cut))

ggplot(data = diamonds)+
  stat_summary(
    aes(x = cut, y = depth),
    fun.max = max,
    fun.min = min,
    fun.y = median
  )

ggplot(data = demograph)+
  stat_summary(
    aes(x = Region, y = Birth),
    fun.ymax = max,
    fun.ymin = min,
    fun.y = median
  )

'
----------Position Adjustment
'

ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = cut))
ggplot(data = demograph)+
  geom_bar(aes(x = Region, fill = clarity))



ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = clarity))
ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = clarity),
           position = 'fill')
ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = clarity),
           position = "dodge")

ggplot(data = mpg, aes(x = cty, y = hwy, color = class))+
  geom_point(position = "jitter")

ggplot(data = mpg, aes(x = cty, y = hwy, color = class))+
  geom_point(position = "jitter")+
  geom_count()+
  geom_jitter()

ggplot(data = mpg, aes(x = cty, y = hwy))+
  geom_boxplot()+
  coord_flip()
ggplot(data=mpg, aes(x = cty, y = hwy, color = class))+
  geom_boxplot()+
  coord_flip()##+
  ##coord_polar()

ggplot(data = diamonds, aes(x = cut, fill = cut))+
  geom_bar()+
  coord_polar()+
  labs(x = "cut",
       y = "count",
       title = "Cut VS Count",
       subtitle = "--subtitle--",
       caption = "http://abc.gov")


ggplot(data = mpg, aes(x = cty, y = hwy))+
  geom_point()+
  geom_abline()+
  coord_fixed()

filter(diamonds, carat > 3 )









