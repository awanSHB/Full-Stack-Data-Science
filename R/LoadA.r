library(dplyr)
library(tidyverse)

demographics <- read.csv("D:\\PROGRAMMING\\R\\DATASETS\\Korean_demographics_2000-2022.csv")

spread(demographics, key = Date, value = Birth)

