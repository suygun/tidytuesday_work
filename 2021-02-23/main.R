rm(list=ls(all=TRUE))

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

library(tidyverse)
library(readxl)
library(skimr)
source("C:/Users/s.uygun/Documents/Coding/Useful_codes/R/negate_%in%.R")
source("C:/Users/s.uygun/Documents/Coding/Useful_codes/R/make_names_dataframe_application.R")

earn <- read_csv("earn.csv")
employed <- read_csv("employed.csv")

glimpse(earn)

earn_filter <-
  earn %>% 
  filter(sex != "Both Sexes") %>% 
  group_by(year, sex) %>% 
  summarise(Med = median(median_weekly_earn)) %>% 
  identity()
