# Prelim models for NSF proposal


library(brms)
library(bayestestR)
library(ggnewscale)



m = brm(height_cm_max ~ s(damage_prop, by=competition, bs='tp', k=4) +
          height_cm_init,
          data=dp,
          family=lognormal(),
          chains = 8, cores = 8, iter = 1200, backend = "cmdstanr",
          control=list(adapt_delta=0.995))

m

plot(conditional_effects(m, 'damage_prop:competition', prob=0.8), points=FALSE)


m.r2 = sprintf("%.1f", round(bayes_R2(m)[1] * 100, 1))
pp_check(m, ndraws=99)






# Extract conditional effects ####
m.effects = conditional_effects(m,  effects = 'damage_prop:competition', 
                                prob=0.8)[[1]]




# Conditional effects plot ####
m.effects_plot1 = ggplot(data=m.effects, aes(x=damage_prop, y=estimate__, color=effect2__)) +
  geom_line(linewidth=1.25, show.legend=TRUE) +
  geom_ribbon(aes(ymin=lower__, ymax=upper__, fill=effect2__), alpha=0.25,
              color=NA, show.legend=TRUE) +
  scale_color_viridis_d(direction=-1, name='Competition', option='C',
                        end=0.9) +
  scale_fill_viridis_d(direction=-1, name='Competition', option='C', end=0.85) +
  labs(x='Leaf area removed (prop.)',
       y='Plant height (cm)') +
  mytheme +
  annotate("text",
           label=bquote(italic(R)^2 == .(m.r2) * "%"),
           x=1, y=5.8,
           hjust = 1, vjust = 1) +
  theme(legend.position = 'inside',
        legend.position.inside = c(0.2,0.01),
        legend.justification = c("left", "bottom"))

# Export plot as a pdf ####
ggsave('CompXDamPrelimFig.pdf',
       m.effects_plot1,
       width = 2.5,
       height = 3.25,
       units='in',
       dpi=600)
