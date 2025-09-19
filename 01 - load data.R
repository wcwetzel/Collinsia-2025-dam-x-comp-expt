# Load data

# Moser creek data.xlsx
# That's where all the data are. They were orginally entered as a Google Sheet.
# I exported them to xlsx and uploaded to github.

# Load packages ####
library(here)
library(tidyverse)
library(readxl)



# Define project root ###
i_am('01 - load data.R')



# Load data ####

d1 = read_excel(here('data', 'Moser creek data.xlsx'),
               sheet = 'Primary data')
d2 = read_excel(here('data', 'Moser creek data.xlsx'),
                sheet = 're-damaging data')
d3 = read_excel(here('data', 'Moser creek data.xlsx'),
                sheet = 'Follow up Data')

