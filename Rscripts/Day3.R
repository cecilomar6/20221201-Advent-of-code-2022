# Day 3: Rucksack Reorganization

## Question 1

library(tidyverse)

lines <- as.list(readLines("inputs/Day3.txt"))
lines <- lapply(lines, FUN = function(x) c(substr(x, 1, str_length(x)/2), substr(x, str_length(x)/2+1, str_length(x))))
common <- unlist(lapply(lines, FUN = function(x) Reduce(intersect, strsplit(x, ""))))

# Same as: intersect(unlist(strsplit(x, "")[1]), unlist(strsplit(x, "")[2]))
# Not sure about how Reduce works

priorities <- 1:52
names(priorities) <- c(letters, LETTERS)

sum(priorities[common])

## Question 2

lines <- readLines("inputs/Day3.txt")
lines <- as.list(split(lines, ceiling(seq_along(lines)/3)))
common <- unlist(lapply(lines, FUN = function(x) Reduce(intersect, strsplit(x, ""))))

sum(priorities[common])
