library(tidyverse)
library(dplyr)
library(ggplot2)
require(mosaic)
#--------------For logistic regression
library(ranger)
library(caret)
library(data.table)
library(caTools)
library(pROC)


weather <- read.csv("D:\\PROGRAMMING\\R\\DATASETS\\weatherAUS.csv")

weather <- weather %>% 
  mutate(Temperature = (Temp9am+Temp3pm)/2) %>%
  mutate(Humidity = (Humidity9am + Humidity3pm)/2)%>%
  mutate(Wind = (WindSpeed9am + WindSpeed3pm)/2) %>%
  mutate(Pressure = (Pressure9am+Pressure3pm)/2)%>%
  mutate(Cloud = (Cloud9am + Cloud3pm)/2)

View(weather)

weatherA <- weather %>% select(Date, Temperature, Humidity, Wind, Pressure,
                               Cloud, Rainfall, RainTomorrow)

#weatherA <- na.omit(weatherA)
#weatherA
view(weatherA)

RainFormula = RainTomorrow ~ Cloud + Humidity + Rainfall

dim(weatherA)
table(weatherA$RainTomorrow)
summary(weatherA$Cloud)
names(weatherA)


scatter.smooth(weatherA$Humidity, weatherA$Cloud)

boxplot(weatherA$Humidity)
weatherA$Cloud = scale(weatherA$Cloud)
weatherA$Humidity <- scale(weatherA$Humidity)
weatherA$Rainfall <- scale(weatherA$Rainfall)

weatherB = weatherA[, -c(1)]
head(weatherB)

weatherA$RainTomorrow <- as.factor(weatherA$RainTomorrow)
levels(weatherA$RainTomorrow) <- c(0, 1)

view(weatherA)

set.seed(123)
data_sample = sample.split(weatherB$RainTomorrow, SplitRatio = 0.8)
train_data = subset(weatherB, data_sample==TRUE)
test_data = subset(weatherB, data_sample==FALSE)
dim(train_data)
dim(test_data)

test_data$RainTomorrow <- as.factor(test_data$RainTomorrow)
levels(test_data$RainTomorrow) <- c(0, 1)
  

logreg <- glm(RainTomorrow ~ Cloud + Humidity + Rainfall, data = test_data, family = binomial() )
summary(logreg)
plot(logreg)
predict(logreg)

##AUC_GBM(Area under curve gradient boosting machine)


lgr.predict <- predict(logreg, test_data, type = "response")
lgr.predict

auc.gbm <- roc(test_data$RainTomorrow, lgr.predict, 
               plot = TRUE, col = "blue")
auc.gbm

lgr.predict2 <- predict(logreg, train_data, probability = TRUE)
lgr.predict2

auc.gbm2 <- roc(train_data$RainTomorrow, lgr.predict2, 
                plot = TRUE, col = "blue")
auc.gbm2

