# Day 4: Camp Cleanup

## Question 1

pairs <- readLines("inputs/Day4.txt")
pairs <- str_extract_all(pairs, pattern = "[0-9]+")

common <- lapply(pairs, function(x) grepl(paste(c("", x[1]:x[2], ""), collapse = "-"), 
                                         paste(c("", x[3]:x[4], ""), collapse = "-")) | 
                  grepl(paste(c("", x[3]:x[4], ""), collapse = " , "), 
                        paste(c("", x[1]:x[2], ""), collapse = " , ")))

sum(unlist(common))

    
## Question 2

overlapping <- lapply(pairs, function(x) (x[3] <= x[2] & x[2] <= x[4])|
                                    (x[1] >= x[3] & x[2] <= x[4])|
                                    (x[3] <= x[1] & x[1] <= x[4])|
                                    (x[1] <= x[3] & x[2] >= x[4]))

sum(unlist(overlapping))

# This isn't working, time to learn from Gus Lipkin
################################################################################

library(tidyverse)
library(data.table)

dt <- fread("inputs/Day4.txt", header = FALSE)

mapply(\(x, y) {
  x <- as.numeric(unlist(strsplit(x, "-")))
  y <- as.numeric(unlist(strsplit(y, "-")))
  
  all(x[1]:x[2] %in% y[1]:y[2]) | all(y[1]:y[2] %in% x[1]:x[2])
}, dt$V1, dt$V2) |>
  unlist() |>
  table() %>%
  .["TRUE"]

#For part 2 just switch all for any

mapply(\(x, y) {
  x <- as.numeric(unlist(strsplit(x, "-")))
  y <- as.numeric(unlist(strsplit(y, "-")))
  
  any(x[1]:x[2] %in% y[1]:y[2]) | any(y[1]:y[2] %in% x[1]:x[2])
}, dt$V1, dt$V2) |>
  unlist() |>
  table() %>%
  .["TRUE"]

# Brilliant, I'll never get to this level