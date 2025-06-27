# file     : r_data_science_air_quality_analysis.R
# title    : 空氣品質監測資料分析(大量檔案資料分析)
# author   : Ming-Chang Lee
# date     : 2025.06.27
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 🌸 實作練習 - 方法1 使用 base, stats 等基本套件 -----

# Q1. 大量檔案匯入 -----
# 參考: 2.10 補充篇: 大量檔案的匯入
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_ppt_codes_2025/r_data_science_02_r_object.R

# getwd取得目前工作目錄 and setwd
getwd()

# 顯示資料夾,檔案清單
dir() # 包括三個資料夾: "全部_2022", "全部_2023", "全部_2024"

myfolders <- c("全部_2022", "全部_2023", "全部_2024")

# 測試第1個資料夾: "全部_2022"
files <- dir(myfolders[1], pattern="*\\.csv$", recursive=TRUE, full.names=TRUE)
files # 結果有77個 csv 檔案

# 測試3個資料夾
files <- dir(myfolders, pattern="*\\.csv$", recursive=TRUE, full.names=TRUE)
files # 結果有231個 csv 檔案

# 使用 lapply 與 read.csv 讀取231個檔案, 回傳為list
?read.csv

# csv 檔案的每列最後位置有多一個逗號, 結果為讀取前面27行資料.
# 使用 read.csv 匯入所有資料, 參數 colClasses 表示設定每個欄位資料型態.
# 前面 27個欄位為字元, 第28個欄位設定為 NULL 表示省略該行.
tables <- lapply(files, read.csv, colClasses=c(rep("character", 27), "NULL"))

# 第1個檔案 key+value
# 測量值原為00, 01,..,23 數值資料, 在R語言中, 不可以使用數值名稱開頭.
# R已經自動加上 X 表示欄位名稱為合法字元開頭.
tables[1]

# 第1個檔案 value, 
tables[[1]]

class(tables[[1]]) # "data.frame"

# 資料框的欄位名稱
names(tables[[1]])

# 合併為1個資料框
df <- do.call(rbind, tables) # data.frame

df # 1,428,466 × 27, 約142萬筆資料, 結果與方法2相同.

class(df) # data.frame"

str(df)

# 將 測站 轉換為 factor, 有77個測站
df$測站 <- factor(df$測站)

str(df$測站)

# 將 日期 欄位改為 as.POSIXct 格式
df$日期 <- as.POSIXct(df$日期)

str(df$日期)

# 部分欄位名稱更名, 將 X 取代為 hr
names(df)[4:27]

names(df)[4:27] <- gsub(pattern="X", replacement="hr", names(df)[4:27])

names(df)

# 將hr00 ~ hr23 轉換為 numeric 資料型態
# There were 24 warnings (use warnings() to see them)
# 轉換結果會產生NA
df[, c(4:27)] <- as.data.frame(lapply(df[, c(4:27)], as.numeric))

# Q2. 長資料轉換為寬資料 -----
# 參考: reshape 函數
# https://github.com/rwepa/teaching-programming/blob/main/17_water_ctsi.R

# 長寬資料轉換
# 使用 reshape {stats} --> long data to wide data
df_wide <- reshape(data = df,
                   timevar = "測項",
                   idvar = c("測站", "日期"),
                   direction="wide",
                   sep="_")
head(df_wide)

names(df_wide)

# df 資料已經轉換為寬資料
str(df) # 84392 * 434, 每個觀測站有18個測量值, 每日有24小時, 18*24=432, 432+2=434

# Q3. 找出中壢測站, 2022~2024年, 早上8:00 每月平均 PM2.5 測量值為何? -----

filter_測站 <- "中壢"

# 篩選 "中壢" 與 "hr05_PM2.5"
df_filter <- df_wide[df_wide$測站  == filter_測站, c("測站", "日期", "hr08_PM2.5")] # 1096*3

# 新增 "月"
df_filter$月 <- format(df_filter$日期,"%m")

# 找出中壢測站, 2022~2024年, 早上8:00 每月平均 PM2.5 測量值
aggregate(x=hr08_PM2.5 ~ 月, data = df_filter, mean)
#    月 hr08_PM2.5
# 1  01   17.78495
# 2  02   15.56471
# 3  03   22.01075
# 4  04   21.75281
# 5  05   15.52174
# 6  06   10.72222
# 7  07   10.30108
# 8  08   12.70968
# 9  09   13.44444
# 10 10   11.67391
# 11 11   13.40000
# 12 12   14.72043

# 🌸 實作練習 - 方法2 使用 dplyr 等套件 -----

# Q1. 大量檔案匯入
# 參考:
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_ppt_codes_2025/r_data_science_02_r_object.R

# Q2. 長資料轉換為寬資料
# 參考:
# https://github.com/rwepa/teaching-programming/blob/main/17_water_ctsi.R
# https://github.com/rwepa/teaching-programming/blob/main/17_water_ctsi2.R

# Q3. 找出中壢測站, 2022~2024年, 早上8:00 每月平均 PM2.5 測量值為何?

# 載入套件
library(readr) # read_csv
library(dplyr) # filter, select, mutate, mutate_at, group_by, summarise
library(tidyr) # pivot_wider

# https://github.com/rwepa/ipas_bda/blob/main/ipas-r-program.R#L1516

# filter                 : 條件式篩選資料
# slice                  : 列的指標篩選資料
# arrange                : 排序
# select                 : 選取行/更改欄位名稱
# rename                 : 選取所有行/更改欄位名稱
# distinct               : 選取不重覆資料
# mutate                 : 新增欄位,保留原資料
# transmute              : 新增欄位,不保留原資料
# summarise              : 群組計算

# Q1. 大量檔案匯入 -----

# getwd取得目前工作目錄 and setwd
getwd()

# 顯示資料夾,檔案清單
dir() # 包括三個資料夾: "全部_2022", "全部_2023", "全部_2024"

myfolders <- c("全部_2022", "全部_2023", "全部_2024")

# 測試第1個資料夾: "全部_2022"
files <- dir(myfolders[1], pattern="*\\.csv$", recursive=TRUE, full.names=TRUE)
files # 結果有77個 csv 檔案

# 測試3個資料夾
files <- dir(myfolders, pattern="*\\.csv$", recursive=TRUE, full.names=TRUE)
files # 結果有231個 csv 檔案

# 使用 lapply 與 read_csv 讀取231個檔案, 回傳為list
# csv 檔案的每列最後位置有多一個逗號, 結果為讀取第28行為空白資料, 因此僅須讀取第1~27行資料.
tables <- lapply(files, read_csv, col_select = c(1:27))

# 第1個檔案 key+value
tables[1]

# 第1個檔案 value, 
tables[[1]]

# 資料框的欄位名稱
names(tables[[1]])

# 合併為1個資料框
df <- do.call(rbind, tables) # data.frame

df # 1,428,466 × 27, 約142萬筆資料

class(df) # "tbl_df" "tbl" "data.frame"

str(df)

# 將 測站 轉換為 factor, 有77個測站
df <- df %>%
  mutate(測站 = as.factor(測站))

str(df)

# 將 日期 欄位改為 as.POSIXct 格式
df <- df %>%
  mutate(日期 = as.POSIXct(日期))

str(df)

# 部分欄位名稱使用數值, 更名並加上字元 hr
names(df)[4:27]

names(df)[4:27] <- paste0('hr', names(df)[4:27])

names(df)

# Q2. 長資料轉換為寬資料 -----

# 本例使用: https://github.com/rwepa/teaching-programming/blob/main/17_water_ctsi2.R

df <- df %>%
  pivot_wider(names_from = 測項, names_sep = "_", values_from = c(hr00:hr23))

# df 資料已經轉換為寬資料
str(df) # 84,392 × 434, 每個觀測站有18個測量值, 每日有24小時, 18*24=432, 432+2=434

# 測量值(第3行~第434行)須轉換為 numeric 資料型態
# 轉換為 numeric, 如有遺漏值會轉換為 NA
df <- df %>% 
  mutate_at(c(3:434), as.numeric)

str(df)

summary(df)

# 計算每行 NA 個數 - colSums {base}
colSums(is.na(df))

# 計算每行 NA 個數 - summarise {dplyr}
df %>%
  summarise(across(everything(), ~ sum(is.na(.))))

# Q3. 找出中壢測站, 2022~2024年, 早上8:00 每月平均 PM2.5 測量值為何? -----

filter_測站 <- "中壢"

df_filter <- df %>% 
  filter(測站  == filter_測站) %>%
  select(測站, 日期, hr08_PM2.5) %>%
  mutate(月 = factor(format(df_filter$日期,"%m")))


df_filter # 1096*4

str(df_filter) # 測站: Factor, 日期: POSIXct, hr08_PM2.5: num, 月: factor

# 找出中壢測站, 2022~2024年, 早上8:00 每月平均 PM2.5 測量值, 結果與方法1相同.
df_filter %>%
  group_by(月) %>%
  summarise(mean(hr08_PM2.5, na.rm = TRUE))
# end
