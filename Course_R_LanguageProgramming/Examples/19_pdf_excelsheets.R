library(pdftools)
# extract some pages
mypdf <- "Wu Qian-Annals of Botany-Root-2018.pdf"
pdf_subset(mypdf,pages = 1, output = "aob1.pdf")
pdf_subset(mypdf,pages = 5, output = "aob2.pdf")
pdf_subset(mypdf,pages = 10:11, output = "aob3.pdf")

# Should say 2
pdf_length("aob3.pdf")

# Combine them with the other one
pdf_combine(c("aob1.pdf","R code.pdf", "aob3.pdf"), 
            output = "aob.pdf")
# Should say 5
pdf_length("aob.pdf")


###
library(tidyverse)

text <- pdf_text("aob2.pdf") %>% read_lines()
head(text)
            
stats <- text[52:58]
head(stats)

stats[2]
stats[3]                  


### 
library(readxl)

file <- "weather_sheets.xlsx"

file %>%
  excel_sheets() %>% 
# [1] "jan" "feb" "mar" "apr" "may" "jun"
  set_names() %>% 
#   jan   feb   mar   apr   may   jun 
# "jan" "feb" "mar" "apr" "may" "jun" 
  map_df(read_excel,path = file) -> weather

head(weather)
dim(weather)
str(weather)
summary(weather)     

weather %>% select(l_temp:ave_temp) %>% map_df(mean)

