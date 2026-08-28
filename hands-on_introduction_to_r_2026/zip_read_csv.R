# File     : zip_read_csv.R
# Date     : 2026.08.28
# Author   : Ming-Chang Lee
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 主題: 114年傷亡道路交通事故資料分析
# 網址: https://data.gov.tw/dataset/177136
# 說明: ZIP 檔案大量CSV檔案處理

# 載入套件
library(tidyverse)

# 連結網址並下載 ZIP 檔案
# ZIP 檔案名稱
zip_file <- "114年傷亡道路交通事故資料.zip"

# 取得工作目錄
getwd()

# 顯示檔案清單
dir()

# 設定解壓縮後目錄
extract_dir <- "csv_data"

# 1.建立解壓縮目錄 -----

# 如果 extract_dir 目錄不存在，則建立目錄。
if (!dir.exists(extract_dir)) {
  dir.create(extract_dir)
}

# 2.解壓縮檔案至 extract_dir 目錄 -----

# Error：中文檔名解壓縮錯誤
# unzip(
#   zip_file,
#   exdir = extract_dir
# )

# Windows — 使用內建 tar 解壓縮
# system2(command, args) 用途是從 R 程式中呼叫作業系統的外部命令。
# -x: extract，執行解壓縮
# -f: 解壓縮的 zip 檔案
# 注意: macOS亦可執行, 但會解壓縮至 \csv_data\114年傷亡道路交通事故資料 資料夾.

system2(
  "tar",
  c(
    "-xf",
    shQuote(zip_file),
    "-C",
    shQuote(extract_dir)
  )
)

# macOS — 使用內建 unzip 解壓縮, 亦可以使用上述 tar 程式.
# system2(
#   "unzip",
#   c(
#     "-o",
#     zip_file,
#     "-d",
#     extract_dir
#   )
# )

# Ubuntu — 使用 archive 套件解壓縮

# 步驟1 安裝 libarchive-dev 模組
# sudo apt install libarchive-dev -y

# 步驟2 安裝 archive 套件
# install.packages("archive")
# library(archive)

# 步驟3 進行解壓縮
# archive_extract(archive = zip_file, dir = extract_dir)

# 3.搜尋符合條件所有 CSV -----

csv_files <- list.files(
  extract_dir,
  pattern = "^114.*\\.csv$",
  full.names = TRUE,
  recursive = TRUE
)

cat("符合資料的 CSV 檔案數量：", length(csv_files), "\n")

# 4.批次匯入 -----

# 舊版 purrr 套件之 map_dfr 函數建議不再使用
# library(purrr)

# 舊版會直接回傳合併後的資料框
# map_dfr 線上說明提及建議本函數為"已取代"(superseded)不再使用
# df <- map_dfr(csv_files, readr::read_csv)

# 建議方法：先合併為 list，再透過 list_rbind 效能更高且語意更明確。
df <- csv_files %>%
  map(readr::read_csv) %>%
  list_rbind()

df # A tibble: 910,283 × 52

# CSV檔案最後會有2列備註，須進行資料處理。
# 先刪除"發生年度"欄位包括 "資料提供日期|事故類別" 資料列
# 注意: 符號 "|" 表示"或", 左右不可以有空白字元
# 本例使用 !grepl() 表示找出不符合2種情形的邏輯值資料列
df <- df %>%
  filter(!grepl("資料提供日期|事故類別", 發生年度))

df # A tibble: 910,257 × 52

# 5.資料基本檢視 -----

cat("資料筆數：", nrow(df), "\n")
cat("變數數量：", ncol(df), "\n")

# 顯示資料結構
glimpse(df)

# 當事者事故發生時年齡
# 年齡資料最小值為-1, 最大值為210, 須再進行確認.
summary(df$當事者事故發生時年齡)

# 計算所有欄位的 NA 個數
df_na <- df %>%
  summarise(
    across(everything(), ~ sum(is.na(.)))
  ) %>%
  pivot_longer(
    cols = everything(),
    names_to = "欄位",
    values_to = "NA個數"
  )

# 顯示所有資料列(n = Inf), 顯示所有資料行(width = Inf)
print(df_na, n = Inf, width = Inf)

# 6.dplyr 資料型態處理 -----

# A1類：造成人員當場或24小時內死亡之交通事故。
# A2類：造成人員受傷或超過24時死亡之交通事故。

# 1.資料提供日期：115年07月01日
# 2.事故類別：A2類

df <- df %>%
  mutate(發生年度 = as.integer(發生年度)) %>% # 資料轉換為整數
  mutate(發生月份 = as.integer(發生月份)) %>% # 資料轉換為整數
  mutate(發生日期 = as.Date(as.character(發生日期), format = "%Y%m%d")) %>% # 數值轉換為字元, 再轉換為日期.
  mutate(
    across(
      where(is.character) & !c(發生時間), # 除了發生時間欄位之外, 將所有 chr 欄位轉換為 factor.
      as.factor
    )
  )

# 7.查看結果 -----

# 查看整體結果
print(df)

# 8.處理單位名稱警局層 -----

# 處理單位名稱警局層之群組名稱, 合計有29個
levels(df$處理單位名稱警局層)

# 處理單位名稱警局層之群組個數總計
df_unit <- df %>%
  count(處理單位名稱警局層) %>% # 計算群組個數總計
  arrange(desc(n)) # 由大至小排序

# 查看群組個數總計
print(df_unit, n=Inf)

# 9.天候名稱 -----

# 天候名稱之群組個數總計
df_weather <- df %>%
  count(天候名稱) %>%
  arrange(desc(n))

# 查看群組個數總計
print(df_weather, n=Inf)

# 10.發生日期資料視覺化 -----

# 發生日期之群組個數總計
df_date <- df %>%
  count(發生日期, name = "total")

# 查看群組個數總計
print(df_date, n=Inf)

# ggplot2 114年每日發生件數趨勢圖
avg_total <- mean(df_date$total)

ggplot(df_date, aes(x = 發生日期, y = total)) +
  geom_line(linewidth = 0.5) +
  geom_point(size = 1) +
  geom_hline(
    yintercept = mean(df_date$total),
    linetype = "dashed"
  ) +
  annotate(
    "text",
    x = min(df_date$發生日期),
    y = avg_total+500,
    label = paste0("平均值 = ", round(avg_total, 0)),
    hjust = 0,
    vjust = -0.5,
    color = "darkorange", # 橘色
    size = 6,
    fontface = "bold"
  ) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%Y-%m"
  ) +
  labs(
    title = "114年每日發生件數趨勢圖",
    x = "日期",
    y = "發生件數"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5)
    # plot.title = element_text(hjust = 0.5, family = "PingFang TC") # for macOS 中文字型
  )
#end
