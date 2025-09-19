# Preliminary plotting

# First run 02 - prep data.R



# Plot initial data: dinit ####

ggplot(data=dinit, aes(competition, damage)) +
  geom_jitter(width=0.04, height=1, alpha=0.8)

ggplot(dinit, aes(damage, height_cm, color=competition)) +
  geom_jitter(alpha=0.6)

ggplot(dinit, aes(damage, otherplant_cover, color=competition)) +
  geom_jitter(alpha=0.6)

ggplot(data=dp, aes(height_cm_init, fruit_max)) +
  geom_point(alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(leaf_count_init, fruit_max)) +
  geom_point(alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(flower_count_init, fruit_max)) +
  geom_point(alpha=0.6) + 
  geom_smooth(method='gam', formula = y ~ s(x, k=4)) +
  mytheme

ggplot(data=dp, aes(fruit_count_init, fruit_max)) +
  geom_point(alpha=0.6) + 
  geom_smooth(method='gam', formula = y ~ s(x, k=4)) +
  mytheme





# Plot through summarized data.frame, one row per plant

ggplot(data=dp, aes(damage, fruit_sum, group=competition, color=competition)) +
  geom_point(alpha=0.6) + 
  geom_smooth(method='gam', formula = y ~ s(x, k=4)) +
  mytheme

ggplot(data=dp, aes(damage, fruit_max, group=competition, color=competition)) +
  geom_jitter(width=1, height=0.1, alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(damage, flower_sum, group=competition, color=competition)) +
  geom_jitter(width=1, height=0.1, alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(damage, flower_max, group=competition, color=competition)) +
  geom_jitter(width=1, height=0.1, alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(damage, leaf_sum, group=competition, color=competition)) +
  geom_jitter(width=1, height=0.1, alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(damage, leaf_max, group=competition, color=competition)) +
  geom_jitter(width=1, height=0.1, alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(damage, height_cm_mean, group=competition, color=competition)) +
  geom_jitter(width=1, height=0.1, alpha=0.6) + 
  geom_smooth(method='gam') +
  mytheme

ggplot(data=dp, aes(damage, height_cm_max, group=competition, color=competition)) +
  geom_jitter(width=1, height=0.1, alpha=0.6) + 
  geom_smooth(method='gam', formula = y ~ s(x, k=4)) +
  mytheme


ggplot(data=subset(dp, damage < 40), aes(competition, fruit_max)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')

ggplot(data=subset(dp, damage < 40), aes(competition, fruit_sum)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')


ggplot(data=subset(dp, damage < 40), aes(competition, flower_max)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')

ggplot(data=subset(dp, damage < 40), aes(competition, flower_sum)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')

ggplot(data=subset(dp, damage < 40), aes(competition, height_cm_max)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')

ggplot(data=subset(dp, damage < 40), aes(competition, height_cm_mean)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')

ggplot(data=subset(dp, damage < 40), aes(competition, leaf_max)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')

ggplot(data=subset(dp, damage < 40), aes(competition, leaf_sum)) +
  geom_jitter(height=0, width=0.1, alpha=0.6) +
  stat_summary(color='blue')






ggplot(dp, aes(competition, first_dead_date)) +
  geom_jitter() 

ggplot(dp, aes(competition, last_alive_date)) +
  geom_jitter(height=0) 









