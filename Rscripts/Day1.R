# Day 1: calorie counting

calories <- readLines("inputs/Day1.txt")

# Create a logical vector identifying blank elements
empty <- !nzchar(calories)

# Split the vector (without the empty values) into a list
# using the cumulative sum of the logical vector
elf_list <- unname(split(calories[!empty], cumsum(empty)[!empty]))

#Add each elf's calories and turn back into a vector
elf_list <- lapply(elf_list, as.numeric)
total_cal <- unlist(lapply(elf_list, sum))

#Question 1
max(total_cal)

#Question 2
sum(total_cal[order(total_cal, decreasing = T)][1:3])

################################################################################
# Other solutions I've seen and liked

library(tidyverse)

dat <- read_file("inputs/Day1.txt")

sums <- strsplit(dat, "\r\n\r")[[1]] %>% 
  map(~ sum(as.numeric(strsplit(.x, "\r\n")[[1]])), na.rm = TRUE) %>% 
  unlist()

max(sums)

sum(tail(sort(sums), 3))
