library(tidyverse)

trees <- read.csv("trees.csv")
ggplot(trees, aes(age, circ, linetype = num)) +
  geom_line()

ggplot(trees, aes(age, circ, linetype = factor(num))) +
  geom_line(size = 1.2)

trees %>% filter(num == 3) %>% ggplot(aes(age, circ)) +
  geom_line(linetype = 2, size = 1.2)

trees %>% filter(num == 3 | num == 4) %>% 
  ggplot(aes(age, circ, linetype = factor(num))) +
  geom_line(size = 1.2) +
  scale_linetype_manual(values = c(1, 5))
