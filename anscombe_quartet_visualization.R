# Title: Anscombe's Quartet Visualization
# Date: 2026.3.12

# 方法1 ggplot2 -----

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

# 方法2 plot{graphics} -----

data(anscombe)
summary(anscombe)

# 建立迴歸模型
ff <- y ~ x

mods <- setNames(as.list(1:4), paste0("lm", 1:4))

for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  mods[[i]] <- lmi <- lm(ff, data = anscombe)
  print(anova(lmi))
}

## See how close they are (numerically!)
mods[1]            # 取出key+value
mods[1]$coef       # 回傳 NA
mods[[1]]$coef     # 正確回傳迴歸模型的係數

sapply(mods, coef) # 回傳4迴個歸模型的係數
lapply(mods, function(fm) coef((fm))) # 回傳4迴個歸模型的係數, 資料物件為list

# 繪圖
# mfrow = (列, 行)
# mar: the number of lines of margin to be specified on the four sides 圖的內邊界
# oma: outer margins in lines of text 圖的外邊界距離

op <- par(mfrow = c(2, 2), mar = 0.1 + c(4,4,1,1), oma =  c(0, 0, 2, 0))

for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  plot(ff, data = anscombe, col = "red", pch = 21, bg = "orange", cex = 1.2,
       xlim = c(3, 19), ylim = c(3, 13))
  abline(mods[[i]], col = "blue")
}

# 圖的標題
mtext("Anscombe's 4 Regression data sets", outer = TRUE, cex = 1.5)

# 復原設定值
par(op)

# end
