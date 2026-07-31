# file     : global_2m_temperature.R
# title    : 全球2公尺年平均氣溫 (2m Temperature)
# author   : Ming-Chang Lee
# date     : 2026.07.28
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 說明：
# 1. 自動安裝並載入必要套件
# 2. 自動下載 WorldClim 全球 2 公尺平均氣溫柵格數據 (SpatRaster)
# 3. 使用 ggplot2 + tidyterra + rnaturalearth 進行畫圖與美化

# 1. 自動檢查並安裝缺少套件
required_pkgs <- c("terra", "geodata", "ggplot2", "tidyterra", "rnaturalearth", "rnaturalearthdata")

new_pkgs <- required_pkgs[!(required_pkgs %in% installed.packages()[, "Package"])]

if (length(new_pkgs) > 0) {
  install.packages(new_pkgs)
}

# 2. 載入套件
library(terra)
library(geodata)
library(ggplot2)
library(tidyterra)
library(rnaturalearth)

# 3. 下載全球氣溫數據 (WorldClim v2.1 10角分解析度，變數為 tavg：平均氣溫，單位：°C)
cat("正在下載全球 2 公尺氣溫資料...\n")
temp_stack <- worldclim_global(var = "tavg", res = 10, path = tempdir())

# 計算全年 12 個月的平均 2 公尺氣溫
global_2m_temp <- mean(temp_stack)
names(global_2m_temp) <- "temp2m"

# 4. 取得全球海岸線向量數據 (用於地圖輪廓繪製)
world_coast <- ne_coastline(scale = "medium", returnclass = "sf")

# 5. 使用 ggplot2 繪製全球 2 公尺氣溫分佈圖
p <- ggplot() +
  # 繪製氣溫柵格 (Raster Layer)
  geom_spatraster(data = global_2m_temp) +
  
  # 疊加全球海岸線外框
  geom_sf(data = world_coast, color = "black", linewidth = 0.2, fill = NA) +
  
  # 設定專業的氣溫發散色調漸層 (深藍 -> 淺藍 -> 黃 -> 深紅)
  scale_fill_gradientn(
    colors = c("#053061", "#2166ac", "#4393c3", "#92c5de", "#d1e5f0", 
               "#fef0d9", "#fdd49e", "#fdbb84", "#fc8d59", "#e34a33", "#b30000"),
    na.value = "transparent",
    name = "氣溫 (°C)"
  ) +
  
  # 使用全球羅賓森投影 (Robinson Projection)，呈現自然不失真的全球視角
  coord_sf(crs = "+proj=robin", expand = FALSE) +
  
  # 地圖圖例與標題設定
  labs(
    title = "RWEPA | Global 2m Mean Temperature",
    subtitle = "數據來源：WorldClim v2.1 氣候觀測資料 - 2026.07.28",
    caption = "繪製工具：R (terra + ggplot2 + tidyterra)"
  ) +
  
  # 視覺主題細節優化
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5, color = "gray30"),
    plot.caption = element_text(size = 8, color = "gray50"),
    legend.position = "bottom",
    legend.key.width = unit(2.2, "cm"),
    legend.key.height = unit(0.4, "cm"),
    panel.background = element_rect(fill = "#e0f2fe", color = NA), # 海洋填色為淡藍色
    panel.grid.major = element_line(color = "white", linetype = "dashed", linewidth = 0.3)
  )

# 6. 輸出圖片至 R 畫布
print(p)

# 7. 儲存圖片為 PNG 檔
ggsave("global_2m_temperature.png", plot = p, width = 12, height = 7, dpi = 300)

