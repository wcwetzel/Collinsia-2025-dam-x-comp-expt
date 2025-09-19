# Preliminary plotting

# First run 02 - prep data.R



# Plot initial data: dinit ####

ggplot(data=dinit, aes(competition, damage)) +
  geom_jitter(width=0.04, height=1, alpha=0.8)

ggplot(dinit, aes(damage, height_cm, color=competition)) +
  geom_jitter(alpha=0.6)

ggplot(dinit, aes(damage, otherplant_cover, color=competition)) +
  geom_jitter(alpha=0.6)





