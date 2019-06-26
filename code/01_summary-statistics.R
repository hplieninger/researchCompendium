data(jackson)
ggplot(jackson, aes(x = N, y = E)) +
    geom_jitter(alpha = .2) +
    geom_smooth(method = "lm")

ggsave(here::here("figures/scatterplot-N-E.pdf"))
