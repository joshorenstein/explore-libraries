
#i added a comment
#' Which libraries does R search for packages?
.Library
# try .libPaths(), .Library
.libPaths()
library(tidyverse)
#' Installed packages

## use installed.packages() to get all installed packages
## if you like working with data frame or tibble, make it so right away!
## remember to use View() or similar to inspect

View(installed.packages())
## how many packages?
data <- as.tibble(installed.packages())
dim(data)
nrow(data)
#' Exploring the packages

## count some things! inspiration
##   * tabulate by LibPath, Priority, or both
##   * what proportion need compilation?
##   * how break down re: version of R they were built on

data %>% count(Built,LibPath)
data %>% group_by(Priority) %>% summarise(n=n())
data %>% filter(NeedsCompilation=='no') %>% count()
data %>% count(Built)
## for tidyverts, here are some useful patterns
# data %>% count(var)
# data %>% count(var1, var2)
# data %>% count(var) %>% mutate(prop = n / sum(n))

#' Reflections

## reflect on ^^ and make a few notes to yourself; inspiration
##   * does the number of base + recommended packages make sense to you?
##   * how does the result of .libPaths() relate to the result of .Library?


#' Going further

## if you have time to do more ...

## is every package in .Library either base or recommended?
## study package naming style (all lower case, contains '.', etc
## use `fields` argument to installed.packages() to get more info and use it!
?installed.packages()



sessionInfo()
