library(tidyverse)
library(dplyr)
library(ggplot2)          #for visualization
library(datasets)
head(iris)
head(presidential)
plot(presidential)

iris $Species

'
Continuous   --- bar graph
categorical  --- scatter plot
'
#species is a categorical variable so "bar graph"
plot(iris $Species)

#Petal.Length a continuous variable so "scatter plot"
plot(iris $Petal.Length)

#combination of continuous and categorical variable
#Categorization based on petal length
plot(iris$Species, iris$Petal.Length)

plot(iris$Petal.Width, iris$Petal.Length)

plot(iris)

plot(iris$Petal.Length, iris$Petal.Width, 
     col="#cc0000", main = "Petal.Length vs Petal.Width",
     xlab = "Petal Length", ylab = "Petal Width")


plot(iris$Species, iris$Petal.Length,
     col = "#F2972F", main = "Species vs Petal Length",
     xlab= "Species", ylab = "Petal Length")



ggplot(iris, aes(x = Petal.Width, y = Petal.Length, color = "red"))+
  geom_point(color = "blue")+
  ggtitle(label = "Petal Width Vs Petal Length")+
  geom_text(label = "HEL")+
  geom_label(label = "A")

ggplot(iris , aes(x = Species, y = Petal.Length), color = "red")+
  geom_boxplot(color = "blue")

ggplot(iris, aes(x = Species), color = "red")+
  geom_bar(color = "blue")
  
ggplot(iris, aes(x = Species, fill = "red"))+
  geom_bar(color = "black")

iris %>%
  ggplot(aes(Species))+
  geom_bar(aes(fill = Species))+
  ggtitle(label = "Data Visualization")  

iris %>%
  ggplot(aes(Species))+
  geom_bar(aes(color = Species, fill = Species))+
  ggtitle(label = "Data Visualization")



