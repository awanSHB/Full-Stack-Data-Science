library(tidyverse)
library(tidyr)
library(dplyr)
require(mosaic)     ### <====
require(tigerstats)
library(ggplot2)

(x <- c(1, 2, 3, 4, 5, NA, 6, 7, 8))
summary(x)
##_______________Flights-Dataset
#<====
flights <-read.csv("D:\\PROGRAMMING\\R\\DATASETS\\flight_data.csv")
#====

##Selecting those flights whose destination is
##San Francisco (SFO) with no missing values missing
SF <- flights %>%
  filter(dest == "SFO", !is.na(arr_delay))
head(SF)
view(SF)

##<====Here we are getting only the sample of 25
set.seed(101)
sample25 <- SF %>%
  sample_n(size = 25)
sample25

#For sample
favstats(~arr_delay, data = sample25)
##Here the maximum delay is 103 minutes

#For population
favstats(~arr_delay, data = SF)
##Here the maximum delay is 1007 minutes
'-->'
'Notice that the result of Population is different
 From the result of sample'

##It will show [percentile] AND [Quantile]
qdata(~arr_delay, p = 0.98, data = sample25)
qdata(~arr_delay, p = 0.98, data = SF)

##----------> tally() Function
#<====
x <- c("apple", "banana", "apple", "orange", "banana", "orange")
tally(x)
table(x)
#====

tally(~arr_delay<90,data = SF , format = "proportion")
tally(~arr_delay<90,data = SF)
##---> Sample_Size is the number of cases in the sample

##Here the result will be different for both means
##As first one is taking random sample of 25 from SF
##so does the second one
n <- 25
mean(~arr_delay, data =  sample_n(SF, size = n, replace= FALSE))
mean(~arr_delay, data = sample_n(SF, size = n, replace = FALSE))

##calculating the mean arrival delay of a random sample 
##of size n from the SF data frame 500 times
Trials <- do(500) *
  mean(~arr_delay, data = sample_n(SF, size = n, replace=FALSE))
head(Trials)
#-- Calculate the mean arrival delay of flights by taking
#-- a random sample of 25, with 500 times

favstats(~mean, data = Trials)

Trials_100 <- do(500)*
  mean(~arr_delay, data = SF%>%sample_n(size=100, replace = FALSE))
head(Trials_100)


rbind(Trials %>% mutate(n = 25), Trials_100 %>% mutate(n = 100))%>%
  ggplot(aes(x = mean)) + geom_histogram(bins = 30)+
  facet_grid(~n)+xlab("Sample_mean")


##Resampling(making a sample from a sample)
(Small <- sample_n(SF, size = 3, replace = FALSE))

##Replace = TRUE allow you to allow duplication
(Small %>% sample_n(size = 3, replace = TRUE))

(Small %>% sample_n(size = 3, replace = TRUE))

n<- 200
(Orig_sample <- SF %>% sample_n(size = n, replace = FALSE))

mean(~arr_delay, 
     data = sample_n(Orig_sample, size = n, replace = TRUE))

#######========Bootstrap
## It is a statistical method, Re-assure reliability
## Resampling(Sample from the sample)
## Allows u 2 approximate the sampling distribution without
##     Access of population
## To make the current sample a population for next sample
## In resampling we allow duplication(i.e., replace=TRUE)


##Here we are calculating the mean of arr_delay with
##sample size of 200 with 500 times of random sample
##selection and storing it in a bootstrap
Bootstrap <- do(500) * 
  mean(~arr_delay, data = sample_n(Orig_sample, size = n, replace = TRUE))
head(Bootstrap)

favstats(~mean, data = Bootstrap)


Trials_200 <- do(500)*
  mean(~arr_delay, data = sample_n(SF, size = 200, replace = FALSE))

#Here you can see quartile
favstats(~mean, data = Trials_200)
qdata(~mean, data = Trials_200)


qdata(~arr_delay,data = Orig_sample)

T1<-sample_n(Orig_sample, size = 200, replace = TRUE)
Bootstrap_trial <- do(500) *
  qdata(~arr_delay, p = 0.98, data = T1)

favstats(~mean, data = Bootstrap_trial)



##Print those flights whose whose delay is more or less
##than 60minutes in 12 months

SF %>%
  mutate(long_delay = arr_delay < 60) %>%
  tally(~long_delay | month, data = .)

SF %>%
  mutate(long_delay = arr_delay > 60) %>%
  tally(~long_delay | month, data = .)
  

tally(~hour, data = SF)


SF %>%
  ggplot(aes(x = hour, y = arr_delay)) +
  geom_boxplot(alpha = 0.1, aes(group = hour)) +
  geom_smooth(method = "lm") +
  xlab("Schedule departure hour") + 
  ylab("Arrival delay in (minutes)") +
  coord_cartesian(ylim = c(-30, 120))


(mod1 <- lm(arr_delay ~ hour, data = SF))
msummary(mod1)
summary(mod1)

(mode2 <- lm(arr_delay ~ hour + origin + carrier, data = SF))
msummary(mode2)





  
  
  
  
  




