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
d1 = d1 |>
  filter(!id %in% dups)
d2 = d2 |>
  filter(!id %in% dups)
d3 = d3 |>
  filter(!id %in% dups)
# can try to sleuth them out later to see if we can save their data

# On 6.25.25, there were two 942 and two 950 plants
# I think we must have measured twice by accident
# Numbers look very similar
table(d3$id, d3$date)
# Remove first 942 and second 950
d3 = d3 |>
  filter(!(id == 942 & date == '6.25.25' & height_cm == 4)) |>
  filter(!(id == 950 & date == '6.25.25' & diameter_cm == 2))


# Dataframe for treatments data only ####
dtrt = d1 |>
  select('id', 'trt') |>
  mutate(
    competition = substr(trt, 1, 1),
    damage = substr(trt, 2, 4)
  )
class(dtrt$damage) = 'numeric'



# Dataframe for initial data only ####
dinit = dtrt |>
  left_join(d1)



# Combine all dataframes across all sampling times ####
d = dinit |>
  bind_rows(d2, d3) 

# deal with dates ####
d$Date = as.Date(d$date, format='%m.%d.%Y')


# Summarize to one row per plant ####
dp = d |>
  group_by(id) |>
  summarize(
    trt = first(trt),
    competition = first(competition),
    damage = first(damage),
    Collinsia_count_init = first(Collinsia_count),
    Collinsia_percentcover = first(Collinsia_percentcover),
    otherplant_cover = first(otherplant_cover),
    rock_cover = first(rock_cover),
    soilbareground_cover = first(soilbareground_cover),
    first_dead_date = {
      dead_dates <- date[alive == 0]
      if(length(dead_dates) == 0) NA else min(dead_dates)
    },
    height_cm_init = first(height_cm),
    height_cm_mean = mean(height_cm, na.rm=TRUE),
    height_cm_max = max(height_cm, na.rm=TRUE),
    # diameter_cm_init = first(diameter_cm),
    diameter_cm_mean = mean(diameter_cm, na.rm=TRUE),
    diameter_cm_max = if(all(is.na(diameter_cm))) NA_real_ else 
      max(diameter_cm, na.rm = TRUE),
    fruit_sum = sum(fruit_count, na.rm=TRUE),
    fruit_max = max(fruit_count, na.rm=TRUE),
    flower_sum = sum(flower_count, na.rm=TRUE),
    flower_max = max(flower_count, na.rm=TRUE),
    leaf_sum = sum(leaf_count, na.rm=TRUE),
    leaf_max = max(leaf_count, na.rm=TRUE),
    EFN_score = if(all(is.na(EFN_score))) NA_real_ else 
      max(EFN_score, na.rm = TRUE)
  )












