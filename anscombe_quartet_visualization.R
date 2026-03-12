# Title: Anscombe's Quartet Visualization
# Date: 2026.3.12

library(ggplot2)
library(dplyr)
library(tidyr)

df <- anscombe

anscombe_long <- df %>%
  mutate(id = 1:n()) %>%
  pivot_longer(
    cols = everything(),
    names_to = c(".value", "set"),
    names_pattern = "(.)(.)"
  ) %>%
  filter(set != "d") %>%
  select(-i)

ggplot(anscombe_long, aes(x = x, y = y)) +
  geom_point(size = 3, color = "orange") +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~set, nrow = 2, ncol = 2) +
  ggtitle("Anscombe's Quartet") +
  theme(plot.title = element_text(hjust = 0.5))
# end
