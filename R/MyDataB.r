library(dplyr)
library(ggplot2)
library(tidyverse)

studentRecord <- data.frame(
  no_of_stu = c(1:15),
  Names = c("Amir", "Hina", "Qasim", "Wahab", "Aliya", "Talha", "Hassan", 
            "Bilal", "Hashim", "Ayeza", "Yasir", "Adil", "Arbab", "Hira",
            "Hania"),
  Gender = c("M", "F", "M", "M", "F", "M", "M", "M", "M", "F", "M", "M", "M", 
             "F", "F"),
  Marks = c(70:84),
  GPA = c(2.7, 3, 3, 3, 3, 3.3, 3.3, 3.3, 3.3, 3.3, 3.6, 3.6, 3.6, 
          3.6, 3.6),
  Grade = c("B-", "B ", "B ", "B ", "B ", "B+", "B+", "B+", "B+", "B+", 
            "A-", "A-", "A-", "A-", "A-")
)

new_record <- studentRecord %>%
  mutate(Percentage = (Marks/85)*100)
new_record

studentRecord $Names
plot(new_record $Marks)
plot(new_record $GPA)

plot(new_record $Marks, new_record $GPA)

plot(new_record $GPA, new_record $Marks, col = "#cc0000", main = "Marks vs GPA",
     xlab = "GPA", ylab = "Marks")

ggplot(new_record, aes(x = GPA, y = Marks, col = "blue"))+
  geom_point(col = "red")+
  ggtitle(label = "Marks vs GPA")+
  geom_label(label = "M")


ggplot(new_record, aes(x = GPA, y = Marks, fill = "orange"), color = "red")+
  geom_boxplot(color = "blue")


new_record %>%
  ggplot(aes(Marks)) +
  geom_bar(color = "red", fill = "white")+
  ggtitle(label = "Data Visualization")+
  theme_classic()

new_record %>%
  ggplot(aes(Marks,GPA, fill = Marks)) +
  geom_bar(stat = "identity", width = 0.8)+
  ggtitle(label = "Data Visualization")

ggplot(studentRecord, aes(x = Marks, y = GPA))+
  geom_line(aes(group = 1), colour = "red")+
  geom_point(size = 3, colour = "blue")



ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, color = class, size = class))


ggplot(data = new_record)+
  geom_point(mapping = aes(x = Marks, y = GPA, color = net_user, size = Marks))




