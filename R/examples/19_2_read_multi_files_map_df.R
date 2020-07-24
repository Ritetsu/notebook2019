library(fs)
library(readxl)
library(tidyverse)

dir_ls()

filenames <- dir_ls()
filenames
filenames[9]

w2014 <- read.csv(filenames[9])
head(w2014)

dir_ls(regexp = "\\.xlsx$") %>% 
  map_df(read_excel) -> 
  w2014_new

head(w2014_new)
dim(w2014_new)

### 
subdir <- "./w2014"
xlsx_files <- dir_ls(subdir, regexp = "\\.xlsx$")
xlsx_files
xlsx_files %>% map_dfr(read_excel) -> xlsx_file_dat
head(xlsx_file_dat)
tail(xlsx_file_dat)


subdir %>%
  dir_ls(regexp = "\\.xlsx$") %>%
  map_dfr(read_excel) -> xlsx_file_dat

View(xlsx_file_dat)
