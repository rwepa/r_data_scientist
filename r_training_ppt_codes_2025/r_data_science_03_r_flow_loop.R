# file     : r_data_science_03_r_flow_loop.R
# title    : 流程控制與迴圈
# author   : Ming-Chang Lee
# date     : 2025.06.21
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----

# 3.1 if 流程控制
# 3.2 if else
# 3.3 ifelse
# 3.4 for 迴圈
# 3.5 while 迴圈
# 3.6 複習篇: Excel檔案匯入與匯出
# 3.7 大量檔案資料處理案例 - 空氣品質監測資料(3個資料夾, 231個CSV檔案)
# 3.8 R軟體使用者論壇

# 🍎 3.1 if 流程控制 -----

?if # ERROR, 出現+

# unexpected token '?', expected 'LPAREN', LPAREN: Left PARENthesis 左括號

?"if" # OK

?`if` # OK

# if 用法1

# if (條件式) {
#   表示式
# }

# if 範例
x <- 6

if (x > 0) {
  print("正數")
}

# 🍎 3.2 if else -----

# if (條件式) {
#   表示式1 
# } else {
#   表示式2
# }

# 範例 if ... else 用法
x <- -1

if (x >= 0) {
  print("非負數")
} else {
  print("負數")
}

# 🍎 3.3 ifelse -----
x <- c(1, 3, NA, 5, NA)
ifelse(is.na(x), 999, x)

# 普通用法1 - 回傳 TRUE, FALSE
iris$Sepal.Length > mean(iris$Sepal.Length)

# 普通用法2 - 使用 for loop
checkValue <- c()
for (i in 1:nrow(iris)) {
  if (iris$Sepal.Length[i] > mean(iris$Sepal.Length)) {
    checkValue[i] <- TRUE
  } else {
    checkValue[i] <- FALSE
  }
}

# 高級用法 - 使用 ifelse -----
ifelse(iris$Sepal.Length > mean(iris$Sepal.Length), 999, 0)

# 錯誤用法 -----
if (iris$Sepal.Length > mean(iris$Sepal.Length)) {
  print("TRUE")
} else {
  print("FALSE")
}

# switch 函數 -----
centre <- function(x, type) {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = 0.1))
}

(x <- rt(n=10, df=1)) # 隨機抽樣10個樣本,其自由度為1的t分配

# 🍎 3.4 for 迴圈 -----

(mydata <- c("R", "ggplot2", "shiny", "zoo", "leaflet"))

for (i in mydata) {
  print(nchar(i))
}

# Error! 省略 ( ), 會有錯誤.
for i in mydata {
  print(nchar(i))
}

# 如果{ } 只有1行指令, 則 { } 可以省略.
for (i in mydata) print(nchar(i))

# 🍎 3.5 while 迴圈 -----

i <- 1
while (i <= length(mydata)) {
  print(paste0("字串 ", mydata[i], " 的長度為: ", nchar(mydata[i])))
  i <- i + 1
}

# next: 執行下一步迴圈
# break: 直接離開迴圈

# 🍎 3.6 複習篇: Excel檔案匯入與匯出 -----
# 匯入 Excel 檔案   : readxl, XLConnect, openxlsx 套件
# 匯出為 Excel 檔案 : writexl 套件

# readxl 套件-1個工作表匯入 -----

# readxl 套件採用C與C++函式庫, 目前僅提供Excel匯入.

# 安裝與載入readxl套件
# 檔名：gfc.xlsx
# 下載：https://github.com/rwepa/r_firststep/blob/main/data/gfc.xlsx

library(readxl)

# 方法1.預設載入第1個工作表
myfilename <- "gfc.xlsx"
mydata1 <- read_excel(myfilename)
head(mydata1, n=3)
# # A tibble: 3 x 3
#   orderdate           supplier amount
#   <dttm>              <chr>     <dbl>
# 1 2009-01-03 00:00:00 日亞        266
# 2 2009-01-04 00:00:00 廣達        123
# 3 2009-01-05 00:00:00 廣達         66

str(mydata1) # mydata1 是tibble資料物件
# tibble [293 × 3] (S3: tbl_df/tbl/data.frame)
#  $ orderdate: POSIXct[1:293], format: "2009-01-03" "2009-01-04" ...
#  $ supplier : chr [1:293] "日亞" "廣達" "廣達" "日亞" ...
#  $ amount   : num [1:293] 266 123 66 241 77 50 75 50 48 52 ...

# R的資料物件排列方式: 子階層2 --> 子階層1 --> 父階層
class(mydata1)
# "tbl_df" "tbl" "data.frame"

# 方法2.設定工作表編號
mydata2 <- read_excel(myfilename, sheet=1)
head(mydata2, n=3)

# 方法3.設定工作表名稱
mydata3 <- read_excel(myfilename, sheet="gfc")
head(mydata3, n=3)

# 比較物件是否完全相同
identical(mydata1, mydata2)
# [1] TRUE

identical(mydata2, mydata3)
# [1] TRUE

# 結論: mydata1 = mydata2 = mydata3

# readxl 套件-多個工作表匯入 -----

filepath <- paste0(find.package('readxl'), "/extdata/datasets.xlsx")
filepath

# 列出所有工作表名稱
mysheet <- excel_sheets(filepath)
mysheet # "iris" "mtcars" "chickwts" "quakes"

# 方法1 使用 for 迴圈

# 使用 in 逐一讀取工作表名稱
for (tmp in mysheet) {
  print(tmp)
}
# "iris"
# "mtcars"
# "chickwts"
# "quakes"

# 測試 iris 工作表之匯入
tmp <- "iris"
read_excel(filepath, sheet=tmp)

# 建立空 list 物件
mylist <- list()

# 設定指標初使值為1
myindex <- 1

for (tmp in mysheet) {
  mylist[[myindex]] <- read_excel(filepath, sheet=tmp)
  myindex <- myindex + 1
}

length(mylist) # 物件的長度為4

mylist

# 元素沒有名稱: NULL
names(mylist)

# 設定名稱
names(mylist) <- mysheet

str(mylist)

# 方法2 使用 lapply 匯入多個工作表
mydatalist <- lapply(excel_sheets(filepath), read_excel, path=filepath)

# 匯入結果為串列(list),有4個元素.
str(mydatalist) # List of 4

# 篩選第1個元素
mydata <- mydatalist[[1]]

# 類別為tbl_df,其父類別為tbl,其父類別為data.frame(資料框)
# "tbl_df" "tbl" "data.frame"
class(mydata)

# 顯示前3筆資料
head(mydata, n=3)

# readxl 套件-多個 Excel 檔案匯入 -----

library(writexl)

# 模擬臺北市12個行政區, 即12個Excel檔案, 每個檔案有1個工作表
# 工作表行數為12個, 行名稱為1月,2月,...12月, 列數為5個.

nworkbooks <- 12
ncolumns <- 12
nrows <- 5
getwd() # "C:/rdata"

# 檔案名稱: df_1.xlsx, df_2.xlsx, ..., df_12.xlsx
for (i in 1:nworkbooks) {
  
  # 建立工作表之資料
  df <- data.frame(matrix(sample(100, ncolumns*nrows, replace = TRUE), ncol = ncolumns))
  
  # 行名稱為1月,2月,...12月
  names(df) <- paste0(1:12, "月")
  
  # 匯出 Excel 檔案
  write_xlsx(x = df, path = paste0("df_", i, ".xlsx"))
  
  # 匯出 CSV 檔案
  write.table(x = df, file =  paste0("df_", i, ".csv"), sep = ",", row.names = FALSE)
}

# 顯示所有檔案
dir()

# 取得所有Excel檔案的完整路徑名稱
files <- dir(getwd(), pattern="df.*\\.xlsx$", recursive=TRUE, full.names=TRUE)
files

# 取得所有Excel檔案名稱
filenames <- dir(getwd(), pattern="df.*\\.xlsx$", recursive=TRUE, full.names=FALSE)
filenames

# 匯入所有Excel資料並儲存為list資料物件
df_list <- lapply(files, read_excel)

length(df_list)

names(df_list) <- c("北投區", "士林區", "中山區", "內湖區", "大同區", "松山區", "萬華區", "中正區", "大安區", "信義區", "南港區", "文山區")

df_list

# list 轉換為 data.frame -----
df_dataframe <- as.data.frame(df_list)
names(df_dataframe)
str(df_dataframe) # 5*144

df_dataframe <- do.call(data.frame, df_list)
names(df_dataframe)
head(df_dataframe)

# 🍎 3.7 大量檔案資料處理案例 - 空氣品質監測資料(3個資料夾, 231個CSV檔案) -----

# 資料來源: 環境部空氣品質監測網 https://airtw.moenv.gov.tw/CHT/Query/His_Data.aspx
# 年份: 2022, 2023, 2024
# 資料型態: 全年逐時資料

# 檔案下載3個檔案, 解壓縮後合計231個檔案
# 全部_2022.zip, 14.7MB 滑鼠右鍵 \ 7-ZIP \ 解壓縮至"全部_2022\" --> 解壓縮後有77個檔案
# 全部_2023.zip, 14.8MB 滑鼠右鍵 \ 7-ZIP \ 解壓縮至"全部_2023\" --> 解壓縮後有77個檔案
# 全部_2024.7z,  11.3MB 滑鼠右鍵 \ 7-ZIP \ 解壓縮至"全部_2022\" --> 解壓縮後"全部"資料夾有77個檔案
# 開啟檔案 \ 全部_2024 \ 全部 \ 二林_2024.csv
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_ppt_codes_2025/images/%E4%BA%8C%E6%9E%97_2024.csv.png

# Q1. 大量檔案匯入
# 參考:
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_ppt_codes_2025/r_data_science_02_r_object.R

# Q2. 長資料轉換為寬資料
# 參考:
# https://github.com/rwepa/teaching-programming/blob/main/17_water_ctsi.R
# https://github.com/rwepa/teaching-programming/blob/main/17_water_ctsi2.R

# Q3. 找出中壢測站, 2022~2024年, 早上8:00 每月平均 PM2.5 測量值為何?
# 思考題!
# Analysis:

# 使用以下3個套件練習

# 載入套件
library(readr) # read_csv
library(dplyr) # filter, select, mutate, mutate_at, group_by, summarise
library(tidyr) # pivot_wider

# 🍎 3.8 R軟體使用者論壇 -----
# https://groups.google.com/g/taiwanruser

# 主題: 時間格式跑出1899-12-30
# 日期: 2020年6月6日 上午11:45:47
# 網址: https://groups.google.com/g/taiwanruser/c/gUxJRJxj3MA

# 主題: RWEPA | R Markdown 解決轉換中文字型PDF
# 日期: 2024年9月18日 晚上11:08:50
# 網址: https://groups.google.com/g/taiwanruser/c/MEpDt7q94QI

# 主題: 中文分詞包Rwordseg無法安裝
# 日期: 2023年11月22日 下午3:51:43
# 網址: https://groups.google.com/g/taiwanruser/c/VxaEbD-tLYE

# 主題: 使用單迴圈做資料處理之問題
# 日期: 2023年9月8日 凌晨2:51:57
# 網址: https://groups.google.com/g/taiwanruser/c/T7dGo5PUurQ

# 主題: 讀取大量xlsx檔與迴圈運行建議
# 日期: 2022年12月10日 晚上7:03:26
# 網址: https://groups.google.com/g/taiwanruser/c/RKH9DooVV4k

# 主題: R讀取檔案
# 日期: 2022年12月8日 上午11:57:10
# 網址: https://groups.google.com/g/taiwanruser/c/OXtyK5C0hOI

# 主題: 政治學w-nominate語法問題請教
# 日期: 2022年9月30日 上午11:40:06
# 網址: https://groups.google.com/g/taiwanruser/c/VnTDh0e0fUo

# 主題: 想請問data.frame新增欄位失敗的問題
# 日期: 2022年11月17日 凌晨1:17:15
# 網址: https://groups.google.com/g/taiwanruser/c/pFKunzSx8GA
# end
