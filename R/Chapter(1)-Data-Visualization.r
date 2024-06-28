library(tidyverse)
library(dplyr)
library(ggplot2)

ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, shape = class))
##SUV's shape is not showing because ggplot can only
##show 6 shapes at a time

ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy), color = "blue")

##This function will show the number of rows columns
dim(mtcars)

nrow(mtcars)
ncol(mtcars)


ggplot(data = mpg) +
  geom_point(aes(x = year, y = displ))

ggplot(data = mpg) +
  geom_point(aes(x = year, y = displ, color = class))

ggplot(data = mpg) +
  geom_point(aes(x = year, y = displ, alpha = class))

ggplot(data = mpg) +
  geom_point(aes(x = year, y = displ, shape = class))
##Using the same variable for multiple aesthetics
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = displ))

ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, 
                 color = displ < 5))


##using the Facets
##Facets display plot that is split into subplots
##Provide only discrete variables
ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))+
  facet_wrap(~class, nrow = 2)

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))+
  facet_grid(drv~cyl)

##If we facet a continuous variable than there is a 
##one facet for each value
ggplot(data = mpg)+
  geom_point(aes(x = cyl, y = hwy))+
  facet_wrap(~displ)

ggplot(data = mpg) +
  geom_point(aes(x = cyl, y = hwy))+
  facet_wrap(drv~.)
ggplot(data = mpg) +
  geom_point(aes(x = cyl, y = hwy))+
  facet_grid(drv~.)
ggplot(data = mpg) +
  geom_point(aes(x = cyl, y = hwy))+
  facet_grid(.~drv)


'
-----> Geoms(Geometric Objects)
'

ggplot(data = mpg)+
  geom_smooth(aes(x = displ, y = hwy, 
                  linetype = drv))
ggplot(data = mpg)+
  geom_smooth(aes(x = displ, y = hwy,color = drv,
                  linetype = drv))


ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = class))+
  geom_smooth()

ggplot(data = mpg, aes(x = displ, y = hwy, 
                       color = drv))+
  geom_point()+
  geom_smooth(se = FALSE)

##Both are same
ggplot(data = mpg, mapping = aes(x = displ, 
                                 y = hwy)) +
  geom_point() +
  geom_smooth()
ggplot()+
  geom_point(data = mpg, aes(x = displ, y = hwy))+
  geom_smooth(data = mpg, aes(x = displ, y = hwy))



ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy, size = class))+
  geom_smooth(aes(x = displ, y = hwy), se = FALSE)


ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy, size = class))+
  geom_smooth(aes(x = displ, y = hwy, color = drv),
              se = FALSE)

ggplot(data = mpg, aes(color = drv))+
  geom_point(aes(x = displ, y = hwy, size = class),
             show.legend = FALSE)+
  geom_smooth(aes(x = displ, y = hwy, color = drv),
              se = FALSE)

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy, 
                 size = class, color = drv),
             show.legend = FALSE)+
  geom_smooth(aes(x = displ, y = hwy), se = FALSE)




'
---------STATISTICAL_TRANSFORMATION
'



ggplot(data = diamonds) +
  geom_bar(aes(x = cut))

ggplot(data = diamonds) +
  stat_summary(
    aes(x = cut, y = depth),
    fun.ymax = max,
    fun.ymin = min,
    fun.y = median
  )

ggplot(data = diamonds) +
  geom_pointrange(
    aes(x = cut, y = depth),
    stat = "summary",
    fun.min = min,
    fun.max = max,
    fun = median
  )

ggplot(data = diamonds)+
  geom_pointrange(
    aes(x = cut, y = depth),
    stat = "summary"
  )


'
----------POSITION_ADJUSTMENT
'

ggplot(data = diamonds) +
  geom_bar(aes(x = cut, color = cut))
ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = cut))
ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = clarity))

ggplot(data = diamonds, aes(x = cut,color=clarity))+
  geom_bar(fill = NA, position = "identity")
ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = clarity),
           position = "dodge")

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy),
             position = "jitter")

'
--------------COORDINATE_SYSTEM
'

ggplot(data = mpg, aes(x = class, y = hwy))+
  geom_boxplot()
ggplot(data = mpg, aes(x = class, y = hwy))+
  geom_boxplot()+
  coord_flip()

ggplot(data = diamonds)+
  geom_bar(aes(x = cut, fill = cut),
           show.legend = FALSE,width = 1)+
  theme(aspect.ratio = 1)+
  labs(x = NULL, y = NULL)+
  coord_fixed()+
  coord_polar()



'
-----------------------------------------------------
'

(df1 = data.frame(
  team=c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'),
  points=c(18, 22, 19, 14, 14, 11, 20, 28)))

(df2 = data.frame(
  team=c('A', 'B', 'C', 'D', 'G', 'H'),
  assists=c(4, 9, 14, 13, 10, 8)))

(df3 <- merge(df1, df2, by = "team"))

(df3 <- inner_join(df1, df2, by = 'team'))



(policies <- data.frame(
  Policy = c(1:9), 
  State=c(rep("GA",3), rep("FL", 3), rep("AL", 3)), 
  Limit=c(rep(50000,3), rep(75000, 3),rep(85000, 3))))

(losses <- data.frame(
  Policy=c(1,4,5), 
  loss=c(500,25000,85000)))

(results <-merge(x = policies, y = losses,by="Policy",
                 all.x = FALSE, all.y = FALSE))


(emp_df=data.frame(
  emp_id=c(1,2,3,4,5,6),
  name=c("Smith","Rose","Williams","Jones","Brown",
         "Brown"),
  superior_emp_id=c(-1,1,1,2,2,2),
  dept_id=c(10,20,10,10,40,50),
  dept_branch_id= c(101,102,101,101,104,105)
))
(dept_df=data.frame(
  dept_id=c(10,20,30,40),
  dept_name=c("Finance","Marketing","Sales","IT"),
  dept_branch_id= c(101,102,103,104)
))

##Here it performs merge with dep_id and dep_branch_id

dfl <- merge(emp_df, dept_df, 
      by = c("dept_id", "dept_branch_id"))

dfl <- merge(x=emp_df,y=dept_df, 
      by.x=c("dept_id","dept_branch_id"), 
      by.y=c("dept_id","dept_branch_id"))

dfl <- emp_df %>% 
  inner_join(
    dept_df, 
    by=c("emp_dept_id" = "dept_id", 
         "emp_dept_branch_id" = "dept_branch_id"))
dfl









