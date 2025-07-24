# file     : r_data_science_advcanced_03_ggplot2.R
# title    : 3.圖形文法繪圖
# author   : Ming-Chang Lee
# date     : 2025.07.26
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----
# 3.圖形文法繪圖
# 3.1 認識ggplot2套件
# 3.2 熟悉開放資料集於ggplot2應用

# 套件總覽

# 🌸 3.圖形文法繪圖 -----

# 🌸 3.1 認識ggplot2套件 -----

# 載入套件
library(ggplot2)

# ?diamonds

# 資料結構
str(diamonds) # 53940*10

# 設定亂數種子，使用大於或等於1整數
set.seed(168)

# 使用 sample函數自所有列數隨機抽取500筆資料
dsmall <- diamonds[sample(nrow(diamonds), 500),]

# 顯示結果
dsmall # 500*10

# ggplot: 散佈圖
p <- ggplot(data=dsmall, mapping=aes(carat, price)) +
  geom_point()
p

# ggplot: 群組散佈圖
p <- ggplot(data=dsmall, mapping=aes(carat, price, color=color)) + # 等號左側color表示群組參數，右側color表示變數名稱
  geom_point(size=4)
p

# ggplot: 散點圖+線性迴歸+95%信賴區間
p <- ggplot(dsmall, aes(carat, price)) + 
  geom_point() +
  geom_smooth(method="lm")
p

# ggplot: 散點圖+線性迴歸+不顯示信賴區間
ggplot(dsmall, aes(carat, price)) + 
  geom_point() +
  geom_smooth(method="lm", se=FALSE)

# ggplot: 散點圖+群組lm
ggplot(dsmall, aes(carat, price, group=color)) + 
  geom_point(aes(color=color), size=2) + 
  geom_smooth(aes(color=color), method="lm", se=FALSE)

# ggplot: 散點圖+群組loess
ggplot(dsmall, aes(carat, price, group=color)) + 
  geom_point(aes(color=color), size=2) + 
  geom_smooth(aes(color=color), method="loess", se=FALSE)

# ggplot: 散點圖+span
ggplot(dsmall, aes(carat, price)) +
  geom_point() + 
  geom_smooth(span = 0.3)

# ggplot: 線圖
ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_line()

# ggplot: 線圖+群組+顏色
ggplot(iris, aes(Petal.Length, Petal.Width, group=Species, color=Species)) + # group: 群組
  geom_line()

# ggplot: 線圖+分面畫圖
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  geom_line(aes(color=Species), size=1) + 
  facet_wrap(~Species, ncol=1)

# ggplot: 線圖+分面
ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_line(aes(color=Species), size=1) + 
  facet_wrap(~Species, ncol=1) +
  theme_minimal()
# theme_ 設定繪圖風格，例：theme_gray、theme_bw、theme_minimal、theme_classic，參考`?theme_classic`

# ggplot2 雙軸(Y1,Y2)繪圖 -----
# http://rwepa.blogspot.com/2017/09/ggplot2-2y-packagelist.html

# ggplot2-新增數學式-以迴歸分析模型為例 -----
# http://rwepa.blogspot.com/2020/09/ggplot2-equation.html

# 弦圖 (Chord diagram) -----
# 參考: http://rwepa.blogspot.com/2019/10/chord-diagram.html

# 🌸 3.2 熟悉開放資料集於ggplot2應用 -----

# ChatGPT: 模擬10萬筆台積電公司製程不良率資料, 資料至少包括年月日時間, location, 批號, 生產量, 使用 dplyr, ggplot2 套件進行資料預處理分析, 視覺化分析.

# 載入套件
library(dplyr)
library(ggplot2)

# 設定資料集大小
datasize <- 100000

# 亂數種子
set.seed(123)

# 建立模擬製程資料
df <- data.frame(
  id = 1:datasize,
  year = sample(2019:2024, size = datasize, replace = TRUE),
  month = sample(1:12, size = datasize, replace = TRUE),
  day = sample(1:31, size = datasize, replace = TRUE),
  location = sample(c("台中", "高雄", "新竹"), size = datasize, replace = TRUE),
  batch_number = paste0("Batch", sample(1:10, size = datasize, replace = TRUE)),
  production_volume = runif(datasize, min = 0.001, max = 100),
  defect_rate = rnorm(datasize, mean = 0.05, sd = 0.01)
)

# 轉換為 tbl_df
df <- tibble::as_tibble(df)

# 類別
class(df) # "tbl_df" "tbl" "data.frame"

df

# 新增製程日期變數
df <- df %>%
  mutate(process_date = as.Date(paste0(year, "/", month, "/", day)))

df

# 計算每日平均不良率
df_summary <- df %>%
  group_by(process_date) %>%
  summarise(AvgDefectRate = mean(defect_rate))

# 刪除NA值
df_summary <- df_summary %>%
  na.omit()
  
df_summary

# 資料結構
str(df_summary) # 2191*2

# 資料摘要
summary(df_summary)

# 前6筆資料
head(df_summary)

# 後6筆資料
tail(df_summary)

# 顯示資料
df_summary

# 使用ggplot2 資料視覺化
ggplot(df_summary, aes(x = process_date, y = AvgDefectRate)) +
  geom_line()

# 發現什麼樣式 (patterns) --> NONE
# Try: 優化視覺化結果, 加入平均線

# geom_hline()   水平線
# geom_abline()  迴歸線
# geom_vline()   垂直線
# geom_segment() 線段

# 加上平均線     geom_hline
# X, Y座標軸標題 xlab, ylab
# 主標題         ggtitle
# 文字說明

ggplot(df_summary, aes(x = process_date, y = AvgDefectRate)) +
  geom_line() +
  geom_hline(yintercept=mean(df_summary$AvgDefectRate), 
             linetype="dotdash",
             color = "red",
             linewidth=0.8) +
  xlab("時間") + 
  ylab("不良率") +
  ggtitle("RWEPA公司產品不良率每日統計圖") +
  theme(plot.title = element_text(hjust = 0.5)) +  # 置中對齊
  annotate(geom="text", 
           x=as.Date("2021/01/01"), 
           y=0.0505, 
           label=paste0("平均值=", round(mean(df_summary$AvgDefectRate), 5)),
           color="red",
           size=10)

# Try: 分面_年群組分析 -----
# lubridate: 日期時間處理套件

library(lubridate)

df_summary <- df_summary %>%
  mutate(year=factor(year(process_date))) # facet_wrap函數使用factor物件會自動改為預設彩色

# 1.分面_年群組繪圖
ggplot(df_summary, aes(process_date, AvgDefectRate)) +
  geom_line(aes(color=year), size=0.6) +
  facet_wrap(~year)

# 2.分面_年群組繪圖1行-群組在上方
ggplot(df_summary, aes(process_date, AvgDefectRate)) +
  geom_line(aes(color=year), size=0.6) + 
  facet_wrap(~year, ncol=1)

# 3.分面_年群組繪圖1行-群組在右方
ggplot(df_summary, aes(process_date, AvgDefectRate)) +
  geom_line(aes(color=year), size=0.6) + 
  facet_grid(year ~ .)

# 4.分面_年群組繪圖1行-群組在上方-優化結果
ggplot(df_summary, aes(process_date, AvgDefectRate)) +
  geom_line(aes(color=year), size=0.6) + 
  facet_wrap(~year, ncol=1)

# Try: 分面_月群組分析 -----
df_month <- df %>%
  mutate(yearmonth=as_date(paste(year, month, "01", sep = "-"))) %>%
  group_by(yearmonth) %>%
  summarise(AvgDefectRate = mean(defect_rate))

# 產品不良率每月統計圖-多行多列
df_month %>%
  mutate(month=as.factor(month(yearmonth)), year=as.factor(year(yearmonth))) %>%
  ggplot(aes(x=month , y=AvgDefectRate , color=year)) +
  geom_line(aes(group = 1), size=2) +
  labs(x = "月份", y = "不良率") +
  facet_wrap(~year) +
  ggtitle("RWEPA公司2019年~2024年產品不良率每月統計圖") +
  theme(axis.text.x = element_text(angle = 45,
                                   vjust = 0.5,
                                   hjust = 1))

# 產品不良率每月統計圖-1行
df_month %>%
  mutate(month=as.factor(month(yearmonth)), year=as.factor(year(yearmonth))) %>%
  ggplot(aes(x=month , y=AvgDefectRate , color=year)) +
  geom_line(aes(group = 1), size=2) +
  labs(x = "月份", y = "不良率") +
  facet_wrap(~year, ncol=1) +
  ggtitle("RWEPA公司2019年~2024年產品不良率每月統計圖") +
  theme(axis.text.x = element_text(angle = 45,
                                   vjust = 0.5,
                                   hjust = 1))

# 產品不良率每月統計圖-1列
df_month %>%
  mutate(month=as.factor(month(yearmonth)), year=as.factor(year(yearmonth))) %>%
  ggplot(aes(x=month , y=AvgDefectRate , color=year)) +
  geom_line(aes(group = 1), size=2) +
  labs(x = "月份", y = "不良率") +
  facet_wrap(~year, ncol=6) +
  ggtitle("RWEPA公司2018年~2023年產品不良率每月統計圖") +
  theme(axis.text.x = element_text(angle = 45,
                                   vjust = 0.5,
                                   hjust = 1))

# Try: 分面_location群組分析 -----

# 資料集願望清單 -----
# 參考: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_02_dplyr.R#L165

# 🌸 參考資料 -----

# RWEPA
# http://rwepa.blogspot.com/

# iPAS-R-tutorial
# https://github.com/rwepa/ipas_bda/blob/main/ipas-r-program.R

# R入門資料分析與視覺化應用教學(付費)
# https://mastertalks.tw/products/r?ref=MCLEE

# R商業預測與應用(付費)
# https://mastertalks.tw/products/r-2?ref=MCLEE 
# end
# 謝謝您的聆聽 , Q & A