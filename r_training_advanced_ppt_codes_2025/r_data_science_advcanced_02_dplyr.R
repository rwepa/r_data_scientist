# file     : r_data_science_advcanced_02_dplyr.R
# title    : 2.資料管線操作
# author   : Ming-Chang Lee
# date     : 2025.07.19
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----
# 2.資料管線操作
# 2.1 認識dplyr套件
# 2.2 熟悉開放資料集於dplyr應用

# 🌸 2.資料管線操作
# magrittr 套件中主要的功能是 %>% 管線運算子, 它的作用在於將左側的運算結果傳遞至右側函數的第一個參數.
# https://cran.r-project.org/web/packages/magrittr/index.html

# magrittr 套件簡介
# https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html

# 1加侖 = 3.785公升
# 1公里 = 0.621371192 英里
# 原資料: miles per gallon
# 新資料: kilometers per liter
# 新資料 = miles per gallon*((1/0.621371192)/3.785)=0.42519

library(magrittr)

car_data <- 
  mtcars %>%
  subset(hp > 100) %>%
  aggregate(. ~ cyl, data = ., FUN = . %>% mean %>% round(2)) %>%
  transform(kpl = mpg %>% multiply_by(0.4251)) %>%
  print

car_data

# 🌸 2.1 認識dplyr套件 -----

# r cran dplyr
# https://cran.r-project.org/web/packages/dplyr/index.html
# dplyr: A Grammar of Data Manipulation 資料操作文法
# dplyr = data frame + plyr

# plyr 發音 plier (鉗子), plyr 是 dplyr 的前個套件版本, 作者推薦使用 dplyr 套件
# plyr: https://www.slideshare.net/hadley/plyr-one-data-analytic-strategy

# filter                 : 條件式篩選資料
# slice                  : 列的指標篩選資料
# arrange                : 排序
# select                 : 選取行/更改欄位名稱
# rename                 : 選取所有行/更改欄位名稱
# distinct               : 選取不重覆資料
# mutate                 : 新增欄位,保留原資料
# transmute              : 新增欄位,不保留原資料
# summarise              : 群組計算

library(dplyr)

library(nycflights13) # 2013年NYC機場航班資料, 33萬筆資料 -----

flights # 336776*19

class(flights) # "tbl_df" "tbl" "data.frame"

# 如何轉換為 tbl_df, 使用 as.tbl -----
mytbl <- as.tbl(iris) # deprecated in dplyr 1.0.0.
mytbl <- tibble::as_tibble(iris)
class(mytbl)

# 資料結構與摘要 -----
str(flights)

summary(flights) # 有NA

head(flights)

tail(flights) # 注意:資料不是依照月,日排序

# filter 條件式篩選資料 -----
filter(flights, month == 1, day == 1)

flights[flights$month == 1 & flights$day == 1, ] # 基本指令, same as filter

filter(flights, month == 1 | month == 2) # AND 條件篩選, 同理 OR 使用 | 

# slice 列的指標篩選資料 -----
slice(flights, 1)           # 第1筆

slice(flights, n())         # 最後一筆

slice(flights, 123456:n())  # 第123456筆至最後一筆

# arrange 排序 -----
arrange(flights, year, month, day) # 依照年,月,日遞增排序

arrange(flights, desc(arr_delay)) # 依照延誤時間遞減排序

# select 選取行  -----
select(flights, year, month, day)

# Select 選取行, 使用 : -----
select(flights, year:dep_delay)

# select 選取行, 使用 負號, 表示刪除 -----
select(flights, -(year:day))

# select 選取行並且更改欄位名稱 -----
select(flights, tail_num = tailnum) # select 只選取 tailnum 1行資料

# select 選取行, 使用 starts_with 等參數
iris %>% select(starts_with("Sepal"))

# starts_with(): Starts with a prefix.

# ends_with(): Ends with a suffix.

# contains(): Contains a literal string.

# matches(): Matches a regular expression.

# num_range(): Matches a numerical range like 1:100.

# rename 選取所有行/更改欄位名稱 -----
rename(flights, ActualDepatureTime = dep_time) # rename 選取所有資料行

# distinct 選取不重覆資料 -----
set.seed(168)

df <- data.frame(
  x = sample(10, 100, replace = TRUE), # rep = replace
  y = sample(10, 100, rep = TRUE)
) # 100*2

head(df)

distinct(df)

nrow(distinct(df))

nrow(distinct(df, x, y))

distinct(df, x) # 與下列結果相同 unique(df$x)

distinct(df, y) # 與下列結果相同 unique(df$y)

# mutate 新增欄位,保留原資料 -----
mutate(mtcars, displ_l = disp / 61.0237)

# dplyr in R Cheat Sheet
# https://nyu-cdsc.github.io/learningr/assets/data-transformation.pdf


# 🌸 2.2 熟悉開放資料集於dplyr應用 -----

# 2025.07.12_DATASETS_WISHLIST
# https://github.com/rwepa/r_data_scientist/tree/main/r_training_advanced_ppt_codes_2025#20250712_datasets_wishlist

setwd("datasets")
getwd()
dir()

# 🌸 1.White: -----
# 近十年國防預算結構分析
# https://data.gov.tw/dataset/139911
# 近十年國防預算結構分析_290973.csv

# 載入套件
library(readr)
library(dplyr)

# 匯入CSV
defense <- read_csv("近十年國防預算結構分析_290973.csv")

# 顯示資料集
defense # 46*8

# 資料結構
str(defense) # 4個數值(num), 4個字元(chr)

# 資料摘要
summary(defense) # 資料沒有NA, 101年~113年

# 前6筆
head(defense)

# 後6筆
tail(defense)

defense

# Q: 長資料轉換為寬資料

library(tidyr)
library(dplyr)

# 方法1
defense_long <- select(defense, Annual:Percentage)

defense_long <- select(defense_long, -c(ItemName))

defense_wide <- spread(defense_long, key=Category, value=Percentage)

defense_wide

# 方法2
defense_wide <- defense %>%
  select(Annual:Percentage) %>%
  select(-c(ItemName)) %>%
  spread(key=Category, value=Percentage)

defense_wide

# Q: 取得最後一筆記錄之URL, 匯入PDF至R.

library(tabulapdf)

url <- defense$URL[46]

extract_tables(url) # 預設使用 method = "lattice", 結果不佳

df <- extract_tables(url, method = "stream")

df <- df[[1]]

df # 16*16

# 第1列~第6列刪除
df <- slice(df, -(1:6)) # 10*16

# 刪除皆為NA變數
df <- select(df, where(function(x) !all(is.na(x)))) # 10*10

oldcol <- names(df)

newcol <- c("年度", "預算額",
            "軍事_金額", "軍事_百分比",
            "作業_金額", "作業_百分比",
            "人員_金額", "人員_百分比",
            "其他_金額", "其他_百分比")

# 重新命名變數名稱
df <- df %>% 
  rename_with(~ newcol, all_of(oldcol))

# "," 取代為空白
df <- df %>%
  mutate(across(everything(), gsub, pattern = ",", replacement = ""))

# "%" 取代為空白
df <- df %>%
  mutate(across(everything(), gsub, pattern = "%", replacement = ""))

# "年度" 取代為空白
df <- df %>%
  mutate(across(everything(), gsub, pattern = "年度", replacement = ""))

# "-" 取代為 NA
df <- df %>%
  mutate(across(everything(), gsub, pattern = "-", replacement = NA))

df <- df %>% 
  mutate_at(c(1:10), as.numeric)

df <- df %>%
  mutate(Date = as.Date(paste0(年度+1911, "/01/01")))

df

summary(df)

# 國防預算結構統計圖
plot(df$軍事_金額, type="l", ylim=c(0, 200000), 
     xlab="年度", 
     ylab="預算金額", 
     main="105~114年國防預算結構統計圖",
     axes=FALSE,
     cex=0.5)
lines(df$作業_金額, col="red", lty=2)
lines(df$人員_金額, col="blue", lty=3)
lines(df$其他_金額, col="grey", lty=4)

ind <- round(seq(1, nrow(df), length.out=5))
axis(1, at=ind, labels=df$年度[ind])
axis(2)
box()

# legend(x設定值= "xxx")
# topleft    top    topright
# left       center right
# bottomleft bottom bottomright

legend(x="bottomright", 
       legend = c("軍事", "作業", "人員", "其他"), 
       lty=1:4, 
       col=c(1,2,4,8), 
       cex=0.8)
abline(h=mean(df$軍事_金額))
abline(h=mean(df$作業_金額), col="red")
abline(h=mean(df$人員_金額), col="blue")

# 🌸 2.Joel: -----
# 上櫃公司企業ESG資訊揭露彙總資料-溫室氣體排放
# https://data.gov.tw/dataset/156375
# t187ap46_O_1.csv

# 🌸 3.Tom: -----
# 臺北市新車、機動車輛及駕照監理統計資料(按使用燃料別分類)
# https://data.gov.tw/dataset/157969
# 臺北市新車領牌數－按使用燃料別分類.csv

# 🌸 4.Uni: -----
# 桃園市機車排放空氣污染物檢驗站
# https://data.gov.tw/dataset/101243
# 定檢站資料.csv
# 
# 🌸 5.Mark: -----
# 桃園市公益彩券盈餘分配辦理社會福利事業執行情形-每年統計
# https://data.gov.tw/dataset/148529
# 108年桃園市公益彩券盈餘分配辦理社會福利事業情形季報表.csv
# ...
# 113年桃園市公益彩券盈餘分配辦理社會福利事業情形季報表.csv

# 🌸 6.Log: -----
# 農產品交易行情
# https://data.gov.tw/dataset/8066
# COA_OpenData.csv

# 🌸 7.Mei: -----
# 桃園市歷年住宅補貼受理情形統計表
# https://data.gov.tw/dataset/28078
# 桃園市歷年住宅補貼受理情形統計表-0612修正.csv

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
