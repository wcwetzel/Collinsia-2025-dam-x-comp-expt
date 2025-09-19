# Prep data for analysis


# Load packages ####
library(here)
library(ggplot2)



# Define project root
i_am('02 - prep data.R')



# Load data first ####
source(here('01 - load data.R'))



# Check for duplicate tag numbers ####
duptab = table(d1$id)
dups = names(duptab[duptab > 1])

# remove duplicates for now
d1 = d1 %>%
  filter(!id %in% dups)
d2 = d2 %>%
  filter(!id %in% dups)
d3 = d3 %>%
  filter(!id %in% dups)
# can try to sleuth them out later to see if we can save their data



# Dataframe for treatments data only ####
dtrt = d1 %>%
  select('id', 'trt') %>%
  mutate(
    competition = substr(trt, 1, 1),
    damage = substr(trt, 2, 4)
  )
class(dtrt$damage) = 'numeric'



# Dataframe for initial data only ####
dinit = dtrt %>%
  left_join(d1)
