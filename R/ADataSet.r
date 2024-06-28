library(tidyverse)
library(dplyr)
library(ggplot2)
require(mosaic)


weather <- read.csv("D:\\PROGRAMMING\\R\\DATASETS\\weatherAUS.csv")
view(weather)
glimpse(weather)
weather <- weather %>% 
  mutate(Temperature = (Temp9am+Temp3pm)/2) %>%
  mutate(Humidity = (Humidity9am + Humidity3pm)/2)%>%
  mutate(Wind = (WindSpeed9am + WindSpeed3pm)/2) %>%
  mutate(Pressure = (Pressure9am+Pressure3pm)/2)%>%
  mutate(Cloud = (Cloud9am + Cloud3pm)/2)

View(weather)


weatherA <- weather %>% select(Date, Temperature, Humidity, Wind, Pressure,
                   Cloud, Rainfall, RainTomorrow)

view(weatherA)
weatherA
##As we have to predict humidity which is a continuous
##so linear regression will be applied

HumidFormula = Humidity ~ Temperature + Pressure + Cloud

LinearMode = lm(HumidFormula, data = weatherA)
LinearMode
#Here the result suggests that Humidity is increasing
#with increase in clouds quantity but has inverse
#relation with Temperature and Pressure
summary(LinearMode)

LM1 = lm(Humidity ~ Temperature, data = weatherA)
LM2 = lm(Humidity ~ Pressure, data = weatherA)
LM3 = lm(Humidity ~ Cloud, data = weatherA)
(LM4 <- lm(Humidity~Temperature + Pressure + Cloud, data = weatherA))
(humidity_pred <- predict(LM4))

hM <- data.frame(humidity_pred)
head(hM, 30)

LM1
LM2
LM3

scatter.smooth(weatherA$Temperature, weatherA$Humidity,
               xlab = "Humidity", ylab = "Temperature",
               main = "Humidity ~ Temperature")

scatter.smooth(weatherA$Pressure, weatherA$Humidity,
               xlab = "Humidity", ylab = "Pressure",
               main = "Humidity ~ Pressure")

scatter.smooth(weatherA$Cloud, weatherA$Humidity, 
               xlab = "Humidity", ylab = "Cloud",
               main = "Humidity ~ Cloud")

ggplot(data = weatherA, aes(x = Temperature, y = Humidity))+
  geom_point()+
  geom_smooth()

ggplot(data = weatherA, aes(x = Pressure, y =Humidity ))+
  geom_point()+
  geom_smooth()+
  labs(title = "Humidity ~ Pressure")

ggplot(data = weatherA, aes(x = Cloud, y = Humidity))+
  geom_point()+
  geom_smooth()+
  labs(x = "Cloud", y = "Humidity",
       title = "Humidity ~ Cloud")

boxplot(weatherA$Humidity)        ##Contains Outliers
boxplot(weatherA$Temperature)     ##Contains Outliers
boxplot(weatherA$Pressure)        ##Contains Outliers
boxplot(weatherA$Cloud)           ##--No Outliers


CRT <- cor(weatherA$Humidity, weatherA$Temperature, use = "complete.obs")
CRP <- cor(weatherA$Humidity, weatherA$Pressure, use = "complete.obs")
CRC <- cor(weatherA$Humidity, weatherA$Cloud, use = "complete.obs")

CRT      ##Value in -ive(negative relation)
CRP      ##Value in +ive(but less than 0.2/0.5)(Negative relation)
CRC      ##Value in +ive(Greater than 0.2/0.5)(Positive Relation)


weather_split <- initial_split(weatherA, prop = 0.8)

train <- weather_split %>% training()
test <- weather_split %>% testing()

LinearModel = lm(HumidFormula, data = train)
HumidityPrediction = predict(LinearModel, test)
HumidityPrediction
  
summary(HumidityPrediction)

Temp <- weatherA %>% select(Temperature)
Pres <- weatherA %>% select(Pressure)
Clou <- weatherA %>% select(Cloud)
Final_result <- data.frame(
  Temp, Pres, Clou
)
Final_result
head(hM, 15)
