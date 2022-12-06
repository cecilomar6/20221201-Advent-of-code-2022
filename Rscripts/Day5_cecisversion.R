# Trying to do day 5 by myself

## Question 1
library(tidyverse)

day5 <- readLines("inputs/Day5.txt")

instructions <- as.list(day5[11:512])
instructions <- lapply(instructions, function(x) strsplit(x, split = " "))
instructions <- lapply(instructions, function(x) unlist(x)[-c(1,3,5)])
instructions <- do.call(rbind, instructions)
colnames(instructions) <-  c( "move", "from", "to")
instructions <- as.data.frame(instructions)


stacks <- as.list(day5[1:8])
stacks <- lapply(stacks, function(x) strsplit(x, split = ""))
stacks <- do.call(rbind, unlist(stacks, recursive = FALSE))
stacks <- as.data.frame(stacks[,c(2,6,10,14,18,22,26,30,34)])
stacks <- as.list(stacks)
stacks <- lapply(stacks, rev)
stacks <- lapply(stacks, function(x) x[x != " "])

stacks_after <- stacks


move_blocks <- function(x = instructions, y = stacks){
  n_moves <- nrow(x)
  
  for (i in 1:n_moves){
    move <- as.numeric(x[i,1])
    from <- as.numeric(x[i,2])
    to <- as.numeric(x[i,3])
    
    for (j in 1:move){
      y[[to]] <- c(y[[to]],last(y[[from]]))
      y[[from]] <- y[[from]][1:length(y[[from]])-1]
    }
  }
  return(do.call(paste, c(lapply(stacks_after, last), sep = "")))
}


move_blocks(x = instructions, y =stacks_after)

## I have the first part but not the second one
## Question 2

stacks_after <- stacks

move_blocks2 <- function(x = instructions, y = stacks){
  n_moves <- nrow(x)
  
  for (i in 1:n_moves){
    move <- as.numeric(x[i,1])
    from <- as.numeric(x[i,2])
    to <- as.numeric(x[i,3])
    
    print(i)
    if (move > length(y[[from]])){
      y[[to]] <- c(y[[to]], y[[from]])
      y[[from]] <- c()
    } else{
    y[[to]] <- c(y[[to]], y[[from]][(length(y[[from]])-move):length(y[[from]])])
    y[[from]] <- y[[from]][-((length(y[[from]])-move):length(y[[from]]))]
    }

  }
  return(do.call(paste, c(lapply(stacks_after, last), sep = "")))
}


move_blocks2(x = instructions, y =stacks_after)
