library(dplyr)

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

#Here we are displaying only two columns Names, Gender
select(studentRecord, Names, Gender)



#It will retrieve only those rows having female students
filter(studentRecord, Gender=="F")

#It will retrieve only those rows having male students
filter(studentRecord, Gender=="M")



#For displaying specific piece of information
select(filter(studentRecord, Marks > 75), Names, Marks, Gender)

select(filter(studentRecord, GPA > 3.3), Names, Gender, Grade, Marks)



#It will add a new column with name percentage
new_record <- studentRecord %>%
  mutate(Percentage = (Marks/85)*100)
new_record



#It will modify the columns and change the GPA by incrementing 0.1
new_record %>%
  mutate(GPA = GPA+0.1)



#It will change the Odd Marks to NA
student_record_2 <- new_record %>%
  mutate(Marks = ifelse((Marks%%2!=0), NA, Marks))
student_record_2


#Here we are creating a new data frame for row_wise and Column_wise operations
df <- data.frame(
  no_of_stu = c(1:5),
  Names = c("Amir", "Hina", "Qasim", "Wahab", "Aliya"),
  Gender = c("M", "F", "M", "M", "F"),
  Marks = c(71:75),
  GPA = c(2.7, 3, 3, 3, 3),
  Grade = c("B-", "B ", "B ", "B ", "B ")
)
df

# rbind will add more rows 
row_wis <- rbind(studentRecord, df)
print(row_wis)

# cbind will add more columns
col_wis <- cbind(studentRecord, df)
print(col_wis)

glimpse(df)


new_record %>%
  group_by(Gender) %>%
  summarise(
    N = n(), Lowest_score = min(Marks), Highest_score = max(Marks), Avg = mean(Marks),
    Total = sum(Marks)
  )


# Male_record <- new_record %>% filter(Gender=="M")
Male_record2 <- new_record %>% filter(Gender=="M", Marks %in% 78:82)
Male_record2 %>% select(Names, Marks, GPA, Percentage, Gender)

d <- select(filter(studentRecord, Gender=="M" & Marks %in% 78:83), Names, Marks, GPA)

arrange(student_record_2, desc(Marks))

st2 <- student_record_2 %>%
  mutate(Gender = ifelse(Gender=="M", "Male", "Female"))

df3 <- merge(student_record_2, studentRecord, by='Marks')
df3

df4 <- inner_join(student_record_2, studentRecord, by='Marks')
df4

aa <- studentRecord %>% remove(Marks)




