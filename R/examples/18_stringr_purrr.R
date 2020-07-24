library(tidyverse)

data("airquality")
head(airquality)
aq1 <- airquality

aq1 <- aq1 %>% mutate(date = as.Date(paste("1973", Month, Day, sep = "-")))
head(aq1)

paste("1973", "09", "06", sep = "-")
paste("1973", "09", "06", sep = "/")
paste("1973", "09", "06", sep = "")
paste0("1973", "09", "06")

aq1 <- aq1 %>% mutate(date = as.Date(paste0("1973", Month, Day)))
library(anytime)
aq1 <- aq1 %>% mutate(date = anydate(paste0("1973", Month, Day)))
head(aq1)

###
data(npk)
head(npk)
dim(npk)
View(npk)

npk %>% mutate(treatment = paste0(N, P, K)) -> npk1
head(npk1)
npk1 %>% group_by(treatment) %>% summarise(n = n())

npk %>% mutate(treatment = paste0(N, P, K)) %>% 
  count(treatment)

npk %>% mutate(treatment = str_c(N, P, K)) %>% 
  count(treatment)

str_c("1973", "09", "06", sep = "-")

###
str_sub("19730906", 1, 4)
str_sub("19730906", 5, 6)
str_sub("19730906", 7, 8)

head(npk1)
npk2 <- npk1
head(npk2)

npk2$n <- str_sub(npk2$treatment, 1, 1)
npk2$p <- str_sub(npk2$treatment, 2, 2)
npk2$k <- str_sub(npk2$treatment, 3, 3)
head(npk2)

mystr <- "Hello world!"
str_to_lower(mystr)
str_to_upper(mystr)
str_to_title(mystr)

str_length(mystr)

str_replace(mystr, "world", "R class") 


###
myiris <- read.csv("myiris.csv")
myiris <- select(myiris, -species)
head(myiris)

my_df <- map_df(myiris, median)
my_df

summarise_all(myiris, median)
