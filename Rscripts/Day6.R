# Day 6: Tuning Trouble

## Question 1
library(tidyverse)

day6 <- readLines("inputs/Day6.txt")

condition <- FALSE
i <- 1

while (condition == FALSE){
  
  marker <- str_sub(day6, i, i+3)
  marker <- unlist(strsplit(marker, split = ""))
  if (length(unique(marker)) != 4){
    i <- i+1
  } else {
    condition <-  TRUE
  }
}

# Solution 1
i+3

## Question 2

condition <- FALSE
i <- 1

while (condition == FALSE){
  
  marker <- str_sub(day6, i, i+13)
  marker <- unlist(strsplit(marker, split = ""))
  if (length(unique(marker)) != 14){
    i <- i+1
  } else {
    condition <-  TRUE
  }
}

# Solution 1
i+13
