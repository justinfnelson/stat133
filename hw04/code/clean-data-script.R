# Load in data to be analyzed, clean it, and add appropriate columns
# so that grades can be assigned to students.

#Load in required librarys
library(dplyr)
# Load data
raw <- read.csv('../data/rawdata/rawscores.csv', header = TRUE)

# Source functions from functions r script
source('../code/functions.R')

sink('../output/summary-rawscores.txt')
str(raw)
summary_stats(raw$HW1)
print_stats(raw$HW1)

summary_stats(raw$HW2)
print_stats(raw$HW2)

summary_stats(raw$HW3)
print_stats(raw$HW3)

summary_stats(raw$HW4)
print_stats(raw$HW4)

summary_stats(raw$HW5)
print_stats(raw$HW5)

summary_stats(raw$HW6)
print_stats(raw$HW6)

summary_stats(raw$HW7)
print_stats(raw$HW7)

summary_stats(raw$HW8)
print_stats(raw$HW8)

summary_stats(raw$HW9)
print_stats(raw$HW9)

summary_stats(raw$ATT)
print_stats(raw$ATT)

summary_stats(raw$QZ1)
print_stats(raw$QZ1)

summary_stats(raw$QZ2)
print_stats(raw$QZ2)

summary_stats(raw$QZ3)
print_stats(raw$QZ3)

summary_stats(raw$QZ4)
print_stats(raw$QZ4)

summary_stats(raw$EX1)
print_stats(raw$EX1)

summary_stats(raw$EX2)
print_stats(raw$EX2)

sink()

# For loop to replace all NA with a zero.

for (row in 1:nrow(raw)) {
  for (col in 1:ncol(raw)) {
    if (is.na(raw[row, col])) {
      raw[row, col] <- 0
    }
  }
}

#Rescaling QZ1, QZ2, QZ3, and QZ4
raw <- transform(raw, QZ1 = rescale100(raw$QZ1, 0, 12))
raw <- transform(raw, QZ2 = rescale100(raw$QZ2, 0, 18))
raw <- transform(raw, QZ3 = rescale100(raw$QZ3, 0, 20))
raw <- transform(raw, QZ4 = rescale100(raw$QZ4, 0, 20))

# Adding new variables Test1 and Test2 that are rescaled exams.
raw <- mutate(raw, Test1 = rescale100(raw$EX1, 0, 80),
              Test2 = rescale100(raw$EX2, 0, 90))

# Adding Homework, Lab, and Quiz variables.
raw <- mutate(raw, Homework = apply(raw[1:9], 1, score_homework),
              Quiz = apply(raw[11:14], 1, score_quiz),
              Lab = apply(raw[10], 1, score_lab)
)

# Adding Overall variable.
raw <- mutate(raw, Overall = (.1 * unlist(raw$Lab)) + (.3 * raw$Homework) + (.15 * raw$Quiz) + (.2 * raw$Test1) +
                                            (.25 * raw$Test2)
)

# Adding Grade variable.
raw <- mutate(raw,
              Grade = apply(raw['Overall'], 1, give_grade)
)

wanted <- c('Lab', 'Homework', 'Quiz', 'Test1', 
            'Test2', 'Overall') 

# Save text files of summary statistics for Lab,
# Homework, Quiz, Test1, Test2, and Overall.
for (i in wanted) {
  sink(paste('../output/', i, '-stats.txt', sep = ''))
  summary_stats(raw[i])
  print_stats(raw[i])
  sink()
}

# Sink the structure of the dataframe that was created.
sink('../output/summary-cleanscores.txt')
str(raw)
sink()

# Save a CSV version of the file we created with all the data.
write.csv(raw, file = "cleanscores.csv")

dat <- read.csv('../data/cleandata/cleanscores.csv')
dat
