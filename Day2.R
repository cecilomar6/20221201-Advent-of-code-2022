#Day 2: Rock Paper Scissors

## Question 1:

games <- read.table("Day2.txt")
games <- paste(games$V1, games$V2, sep = "")

score <- ifelse(games == "AX", 4, 
       ifelse(games == "AY", 8,
              ifelse(games == "AZ", 3,
                     ifelse(games == "BX", 1,
                            ifelse(games == "BY", 5,
                                   ifelse(games == "BZ", 9,
                                          ifelse(games == "CX", 7,
                                                 ifelse(games == "CY", 2,
                                                        ifelse(games == "CZ", 6, NA)))))))))

sum(score)

## Question 2:

score <- ifelse(games == "AX", 3, 
                ifelse(games == "AY", 4,
                       ifelse(games == "AZ", 8,
                              ifelse(games == "BX", 1,
                                     ifelse(games == "BY", 5,
                                            ifelse(games == "BZ", 9,
                                                   ifelse(games == "CX", 2,
                                                          ifelse(games == "CY", 6,
                                                                 ifelse(games == "CZ", 7, NA)))))))))

sum(score)

