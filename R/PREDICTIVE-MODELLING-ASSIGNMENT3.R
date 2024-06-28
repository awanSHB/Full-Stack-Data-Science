library(tidyverse)
library(dplyr)
library(ggplot2)
library(tidymodels)

mydt <- data.frame(
  year = c(2017,2017,2017,2017,2017,2017,2017,2017,2017,2017, 2017,2017,201,2016,2016,2016,2016,
           2016,2016,2016,2016,2016,2016,2016),
  month = c(12,11,10,9,8,7,6,5,4,3,2,1,12,11,10,9,8,7,6,5,4,3,2,1),
  interest_rate = c(2.75,2.5,12.5,2.5,2.5,2.5,2.5,2.25,2.25,2.25,2,2,2,1.75,1.75,1.75,1.75,1.75,
                    1.75,1.75,1.75,1.75,1.75,1.75),
  unemployement_rate = c(5.3,5.3,5.3,5.3,5.4,5.6,5.5,5.5,5.5,5.6,5.7,5.9,6,5.9,5.8,6.1,6.2,6.1,
                         6.1,6.1,5.9,6.2,6.2,6.1),
  index_price = c(1464,1394,1357,1293,1256,1254,1234,1195,1159,1167,1130,1075,1047,965,943,958,
                  971,949,884,866,876,822,704,719)
)
mydt

##
## 1. Identifying the correlation
##


(relation1 <- cor(mydt$interest_rate, mydt$unemployement_rate))
(relation2 <- cor(mydt$unemployement_rate, mydt$index_price))
(relation3 <- cor(mydt$interest_rate, mydt$index_price))

'
--> (interest_rate) and (unemployement_rate) has strong [negatice] relation
--> (unemployement_rate) and (index_price)   has strong [negative] relation
--> (interest_rate) and (index_price)        has string [positive] relation   
'

## b/w interest_rate & unemployment_rate
mydt %>% ggplot(aes(x = interest_rate, y = unemployement_rate))+
  geom_point()+
  geom_smooth(se = FALSE)
            'OR'
with(mydt, scatter.smooth(interest_rate, unemployement_rate))

## b/w unemployment_rate & index_price
mydt %>% ggplot(aes(x = index_price, y = unemployement_rate))+
  geom_point()+
  geom_smooth(se = FALSE)
            'OR'
with(mydt, scatter.smooth(index_price, unemployement_rate))

## b/w interest_rate & index_price
mydt %>% ggplot(aes(x = index_price, y = interest_rate))+
  geom_point()+
  geom_smooth(se = FALSE)
            'OR'
with(mydt, scatter.smooth(index_price, interest_rate))

## Using the boxPlot for detecting outliers
boxplot(mydt$interest_rate,ylab = "interest_rate")
boxplot(mydt$unemployement_rate,ylab = "unemployement_rate")
boxplot(mydt$index_price,ylab = "index_price")

##
## 2. Generating a Linear Model Formulate
##


## SLR(Simple_Linear_Regression)   MLR(Multiple_Linear_Regression)

formula_1_SLR = index_price ~ interest_rate
formula_2_SLR = index_price ~ unemployement_rate
formula_MLR   = index_price ~ interest_rate + unemployement_rate

mydt
(linearmodel_1   = lm(formula_1_SLR,  data = mydt))            #Simple Linear Regression
(linearmodel_2   = lm(formula_2_SLR,  data  = mydt))           #Simple Linear Regression
(linearmodel_MLR = lm(formula_MLR,  data = mydt))              #Multiple_Linear_Regression

summary(linearmodel_1)
summary(linearmodel_2)
summary(linearmodel_MLR)


##
## 3. Testing and training data using proportion of 10% and 90%
##


data_split <- initial_split(mydt, prop = 0.9)
# Out of 24 Rows/Observations
#           -> 21 Observations for training dataset
#           -> 3  Observations for test dataset

train = data_split %>% training()
test = data_split %>% testing()

data_split
train
test


data_list <- list(train, test)
data_list

Linear_Model_Final_1 = lm(formula_MLR, data = train)
Linear_Model_Final_1

Final_Prediction = predict(Linear_Model_Final_1, test)
Final_Prediction


summary(Final_Prediction)















