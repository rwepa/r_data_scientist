# file     : r_data_science_03_summary_pivot.R
# title    : 3.資料摘要分析
# author   : Ming-Chang Lee
# date     : 2024.09.21
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 前次上課重點 -----
# 2.1 資料物件簡介: vector, matrix, array, data.frame, list, ts
# 2.2 流程控制與for迴圈: if, irelse, for, while
# table(次數統計), aggregate(樞紐分析), order(排序用) 函數
# 補充篇: Excel檔案匯入與匯出: 
#   readxl(匯入)
#   XLConnect (須先安裝 Java JDK)
#   openxlsx(匯入,匯出)
#   writexl(匯出)
# 補充篇: 大型檔案的匯入: data.table 套件
# 補充篇: 大量檔案的匯入: lapply
# RStudio 支援專案資料夾功能: "XXX.Rproj" 檔案

# 本週上課大綱 -----
# 3.1 apply,lapply與樞紐分析
# 3.2 長寬資料轉換
# 補充篇: dplyr 資料操作套件
# 補充篇: 互動式資料表格
# 練習篇: 期末報告Rmd,PDF事宜

# 3.1 apply、lapply與樞紐分析 -----

# 資料摘要分析包括 summary, 集中趨勢, 分散趨勢

# summary: 摘要分析主要是六力分析
# 集中趨勢: mean 平均值, median 中位數, 百分位數 quantile
# 分散趨勢: sd 標準差, var 變四數, range 全距

?quantile

# apply, 可用於列,行的資料計算

# lapply 可用於行的資料計算

m <- matrix(c(1:8), ncol=2)
m

apply(m, 1, function(x) mean(x))

as.matrix(apply(m, 1, function(x) mean(x)))

apply(m, 2, function(x) mean(x))

# which, any, all 函數 -----
(x <- matrix(rnorm(10)*10, ncol=2))

x > 5

# !(x>5)

which(x>5) # return index

which(x>5, arr.ind=TRUE) # return (row,column)

any(x>5)

all(x>5)

# iris鳶尾花資料集 -----

iris

head(iris)

tail(iris)

str(iris)

summary(iris)

apply(iris[-5], 1, mean) # 參數 1 表示以列為基礎

apply(iris[-5], 2, mean) # 參數 2 表示以行為基礎

# lapply 回傳 list
lapply(iris[-5], mean)

# 資料處理 -----
?rbind
?cbind

# 3.2 長寬資料轉換 -----

# 長寬資料轉換 long and wide data -----
olddata_wide <- read.table(header=TRUE, text="
                           subject sex control cond1 cond2
                           1   M     7.9  12.3  10.7
                           2   F     6.3  10.6  11.1
                           3   F     9.5  13.1  13.8
                           4   M    11.5  13.4  12.9
                           ")
# subject 欄位轉換為 factor
olddata_wide$subject <- factor(olddata_wide$subject)
str(olddata_wide)
olddata_wide

olddata_long <- read.table(header=TRUE, text='
                           subject sex condition measurement
                           1   M   control         7.9
                           1   M     cond1        12.3
                           1   M     cond2        10.7
                           2   F   control         6.3
                           2   F     cond1        10.6
                           2   F     cond2        11.1
                           3   F   control         9.5
                           3   F     cond1        13.1
                           3   F     cond2        13.8
                           4   M   control        11.5
                           4   M     cond1        13.4
                           4   M     cond2        12.9
                           ')
# subject 欄位轉換為 factor
olddata_long$subject <- factor(olddata_long$subject)
str(olddata_long)
olddata_long

# tidyr 套件
library(tidyr)

# gather: From wide to long
data_long <- gather(olddata_wide, condition, measurement, control:cond2)
data_long

# spread: From long to wide
data_wide <- spread(olddata_long, condition, measurement)
data_wide

# reshape2 套件
library(reshape2)

# melt: From wide to long

# Specify id.vars: the variables to keep but not split apart on
# method 1
melt(olddata_wide, id.vars=c("subject", "sex"))

# method 2
data_long <- melt(olddata_wide,
                  # ID variables - all the variables to keep but not split apart on
                  id.vars=c("subject", "sex"),
                  # The source columns
                  measure.vars=c("control", "cond1", "cond2" ),
                  # Name of the destination column that will identify the original
                  # column that the measurement came from
                  variable.name="condition",
                  value.name="measurement")
data_long

# dcast: From long to wide
data_wide <- dcast(olddata_long, subject + sex ~ condition, value.var="measurement")
data_wide

# 補充篇: dplyr 資料操作套件 -----

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

# 補充篇: 互動式資料表格 -----

# 互動式表格視覺化 -----

# kableExtra 套件 -----
# r cran kableExtra
# http://haozhu233.github.io/kableExtra/awesome_table_in_html.html

library(kableExtra)

# kableExtra 範例
data(Cars93, package = "MASS")
mydf <- Cars93[1:20, 1:10]
kbl(mydf)

mydf %>%
  kbl() %>%
  kable_styling()

mydf %>%
  kbl(caption = "2021年4月X日空氣指標統計表") %>%
  kable_classic(full_width = FALSE, html_font = "Cambria")

mydf %>%
  kbl() %>%
  kable_material(c("striped", "hover"))

# reactable 套件 -----
library(reactable)   # 表格格式設定

# 基礎表格 usage
reactable(iris)

# 群組與匯總
reactable(iris, groupBy = "Species", columns = list(
  Sepal.Length = colDef(aggregate = "count"),
  Sepal.Width = colDef(aggregate = "mean"),
  Petal.Length = colDef(aggregate = "sum"),
  Petal.Width = colDef(aggregate = "max")
))

# 列明細
reactable(iris, details = function(index) {
  htmltools::div(
    "Details for row: ", index,
    htmltools::tags$pre(paste(capture.output(iris[index, ]), collapse = "\n"))
  )
})

# 練習篇: 期末報告Rmd,PDF事宜 ------

# 學員練習期末報告事宜, 包括以下四個項目(1.目標,2.檔名,3.來源,4.Rmd)

# 範例1
# 1.目標: 理解日空氣品質指標(AQI)並進行板橋與汐止站T檢定
# 2.檔名: aqx_p_434.csv
# 3.來源: https://data.gov.tw/dataset/40507
# 4.Rmd :  00_李明昌_aqi.Rmd

# 範例2
# 1.目標: 理解銷售資料分析並進行迴歸預測
# 2.檔名: marketing.csv
# 3.來源: 企業內部資料
# 4.Rmd : 00_李明昌_marketing.Rmd

# 參考資料 -----

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
