# file     : hands_on_r_01_introduction.R
# title    : R入門實作班
# subtitle : 1.R環境建置與語法基礎
# author   : Ming-Chang Lee
# date     : 2026.08.02
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----
# LINK: https://github.com/rwepa/business_analytics/

# 1.R環境建置與語法基礎
# 1.1 R/RStudio（或Posit Cloud）環境與專案管理
# 1.2 物件、向量、矩陣、清單、data.frame/tibble
# 1.3 套件安裝與使用（install.packages / library）
# 1.4 資料匯入（CSV/Excel）與基本檢視
# 1.5 練習：讀入資料並完成基本摘要與簡單圖表

# 🌸 1.1 R/RStudio（或Posit Cloud）環境與專案管理 -----

# RWEPA 暨資料分析密技 -----
# http://rwepa.blogspot.com/

# 掌握資料樣式密技 -----
# 資料分析架構/APC方法
# 1.群組
# 2.時間
# 3.建立評估變數

# 如何學習 R -----
尋找答案 <- list(
  方法1 = "同事、同學、朋友等",
  方法2 = "Google", "AI",
  方法3 = "alan9956@gmail.com"
)
print(尋找答案)

# 資料分析暨視覺化應用 -----
# R + Shiny, Python + Streamlit 互動式平台

# RWEPA | Excel 下拉式選單與條件式格式設定教學
# YouTube (包括中文字幕)：https://youtu.be/OVA4dvkrsBM
# LINK: https://rwepa.blogspot.com/2023/10/excel-drop-down-list-and-conditional-formatting.html

# 中央氣象局 1,600萬筆資料
# refer to materials

# 保險預測模型
# refer to materials

# 空間圓餅圖離群值分析
# refer to materials

# 2020新型冠狀病毒視覺化
# http://rwepa.blogspot.com/2020/02/2019nCoV.html 

# shiny顧客連接分析
# https://rwepa.shinyapps.io/shinyCustomerConnect/

# 品質管制圖(quality control chart)應用
# 說明: http://rwepa.blogspot.com/2021/10/r-shiny-quality-control-chart.html
# 資料1: https://github.com/rwepa/shiny_spc/blob/main/data/spc_wafer_with_header.csv 
# 資料2: https://github.com/rwepa/shiny_spc/blob/main/data/spc_pistonrings_without_header.csv 
# 線上示範: https://rwepa.shinyapps.io/shiny_spc/

# Taiwan Stock App
# https://rwepa.shinyapps.io/shinyStockVis/

# 離子資料分析與視覺化應用
# refer to materials

# RWEPA | shiny企業實務應用 第4集-shiny銷售儀表板
# Shiny: https://rwepa.shinyapps.io/shinySalesDashboard/
# YouTube【中文字幕】:https://youtu.be/4GgZlf8heQk
# 線上版投影片(使用Quarto): https://rwepa.quarto.pub/r-shiny-04-sales-project/ 
# Code: https://github.com/rwepa/business_analytics/tree/main/r-shiny-04-sales-project

# RWEPA | shiny企業實務應用 第6集-小明算命師(下) - 第1季完結篇
# YouTube【中文字幕】: https://youtu.be/rrD6KV3eV-w
# 線上版投影片(使用Quarto): https://rwepa.quarto.pub/r-shiny-06-hr-teller/
# Code: https://github.com/rwepa/business_analytics/tree/main/r-shiny-06-hr-teller

# Power BI - RFM顧客價值分析
# YouTube：https://youtu.be/Lkr9HmzLTtg
# LINK: http://rwepa.blogspot.com/2023/07/rwepa-rfm-analysis-using-power-bi.html

# Tableau - 智慧製造應用
# https://github.com/rwepa/teaching_tableau
# https://public.tableau.com/app/profile/ming.chang.lee/vizzes

# 登山路線視覺化分析平台 (Python + Streamlit)
# YouTube【中文字幕】: https://youtu.be/-_zghs2qrIg
# 系統展示: https://rwepa-climb.streamlit.app/

# 銷售儀表板2025 (Python + Streamlit)
# YouTube【中文字幕】: https://youtu.be/QmvlYHspvns 
# 系統展示： https://rwepa-sales-dashboard.streamlit.app/ 

# PDFtoMP3 (Python + Streamlit)
# 🌸系統展示: https://rwepa-pdf2mp3.streamlit.app/
# 🌸上傳 PDF: https://github.com/rwepa/streamlit-pdf2mp3/blob/main/biography-ming-chang-lee.pdf
# 🌸GitHub(包括佈署至Streamlit教學): https://github.com/rwepa/streamlit-pdf2mp3/

# R 入門資料分析與視覺化應用(7小時28分鐘)
# https://mastertalks.tw/products/r?ref=MCLEE

# R 商業預測應用(8小時53分鐘)
# https://mastertalks.tw/products/r-2?ref=MCLEE

# R 簡介 -----
# R 是一種基於 S 語言所發展出具備統計分析、繪圖與資料視覺化的程式語言。

# R安裝 -----
# R官方網頁
# http://www.r-project.org/

# Taiwan CRAN
# https://cran.csie.ntu.edu.tw/

# 安裝參考說明, 2006
# https://github.com/rwepa/DataDemo/blob/master/windows_intall_R.pdf

# Rtools 下載與安裝 -----
# https://cran.csie.ntu.edu.tw/bin/windows/Rtools/

# R Manuals (使用手冊)
# https://cran.csie.ntu.edu.tw/manuals.html

# 好書 --> Using R for Data Analysis and Graphics: Introduction, Code and Commentary
# https://cran.r-project.org/doc/contrib/usingR.pdf

# R參考文獻 -----
citation()

# 🦞實作練習 -----
# R執行畫面
plot(runif(100), type="l", main= "R大數據分析")
demo(graphics)
demo(persp)

# TRY: 
plot(runif(10000))

# R for Mac -----
# YouTube: https://youtu.be/72MYRBNo5Bk
# Xcode, Fortran compiler: https://cran.r-project.org/bin/macosx/tools/

# mac 中文字型 plot
# https://rwepa.blogspot.com/2013/11/mac-plot.html 

# R for Ubuntu -----
# LINK: http://rwepa.blogspot.tw/2013/05/ubuntu-r.html

# 🦞實作練習 -----
# 新增R檔案練習
# 使用R原生環境,輸入以下程式碼, 另儲存成 MyFirstProject.R

set.seed(2026) # 設定亂數種子
plot(runif(10), type="b", main= "R大數據分析")
x <- rnorm(10)
x
pairs(iris[-5], pch=16, col=iris$Species, main="RWEPA-iris資料集散佈圖矩陣")

# RStudio 簡介與安裝 -----

# 整合式開發環境 - RStudio -----
# https://github.com/rwepa/r_data_scientist/blob/main/README.md#global-2m-mean-temperature

# RStudio下載 -----
# https://posit.co/

# 🦞實作練習 -----
# RStudio 儲存檔案
# 新增 C:\rdata\helloworld.R
# 參考講義輸入程式碼

# RStudio Addins (外掛功能) -----
# 參考: https://docs.posit.co/ide/user/ide/guide/productivity/add-ins.html
install.packages("addinslist")

# R + Editor -----

# Eclipse + StatET 4.13.0 -----
# https://projects.eclipse.org/projects/science.statet

# Visual Studio Code + R
# https://vscode.dev.org.tw/docs/languages/r

# Anaconda + Jupyter Notebook + R -----

# 使用R原生環境
# 支援最新版 R-4.6.1
# https://www.datacamp.com/blog/jupyter-and-r-markdown-notebooks-with-r

# 安裝 IRkernel 三步驟

# 步驟1 開啟R終端機視窗
# 開啟命令提示字元
# 步驟1 開啟R終端機視窗
# cd C:\Program Files\R\R-4.6.1\bin
# R

# 步驟2 安裝套件
# install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))

# devtools::install_github('IRkernel/IRkernel')

# IRkernel::installspec()

# 步驟3 關閉R環境
# q()

# Jupyter Notebook – R demo (1/3)
# New \ R

# Jupyter Notebook – R demo (2/3)
sessionInfo()

# Jupyter Notebook – R demo (3/3)
head(iris, n=3)
pairs(iris[-5], col=iris$Species, pch=16)

# Positron (整合R, Python, Jupyter), Since 2024.6 -----
# 首頁: https://github.com/posit-dev/positron 
# 下載: https://github.com/posit-dev/positron/releases

# 專案管理 -----
# File \ New Project \ New Directory \ New Project ...
# RStudio 支援專案資料夾功能, File \ New Project \ New Directory ...
# 專案資料夾會建立 "XXX.Rproj" 檔案
# 開啟專案方法: 直接開啟 "XXX.Rproj", 畫面右上角會顯示"專案名稱"

# R 基礎操作 -----

# R運作方式
# 資料物件 -> 函數與運算式 -> 結果物件

# 控制台的特定符號 -----
iris$Sepal.Length

# 取出第145個值
iris$Sepal.Length[145]

# R: 指標從 1 開始
# Python: 指標從 0 開始

# 物件命名原則 -----
2024bigdata <- "R" # Error

bigdata2024 <- "R" # OK

.big <- 123 # 不要使用 . 開頭
big. <- 123 # 少用句點
big_ <- 123

# Google's R Style Guide -----
# https://google.github.io/styleguide/Rguide.html
# 函數使用 BigCamelCase:
# 大駝峰式大小寫（BigCamelCase），是一種每個單字首字母皆大寫且不使用空格或分隔符號的命名方式。

# 輔助說明 -----

help.start()

?plot

help(plot)

help.search("regression")

??regression

# 🌸 1.2 物件、向量、矩陣、清單、data.frame/tibble -----

# 資料型別 -----

# 整數
x1 <- c(1L, 2L, 3L)
class(x1)
mean(x1) # mean 平均值

# 數值
x2 <- c(1.234, 2, 3)
class(x2)

x2 <- seq(1, 10, by=0.5) # 包括右側範圍10
print(x2)

x3 <- c('台北市', "台北市", "新北市", 123, 3.14 ) # 混合輸入自動資料型別轉換為較高階
class(x3)

x4 <- c(TRUE, FALSE, TRUE)
x5 <- x4 + 1
print(x5)

x6 <- c(1, 2, 3, NA, 4)
print(x6)
mean(x6) # NA ???

# 字串
x7 <- c(1, 2, 3, "台北市", "新北市")

# 邏輯值
x8 <- x1 > 1.5
print(x8)

# 數學運算 -----

# R即是計算機
# log, exp

# e, 作為數學常數, 是自然對數函數的底數, 亦稱自然常數, 自然底數, 或是尤拉數（Euler's number）, 以瑞士數學家尤拉命名, 它是一個無限不循環小數.
# 自然指數（Exponential）y=e^x
# 自然對數（Natural Logarithm）y=ln(x)
exp(1) # 2.718282
log(exp(1))
log(exp(2))
log10(1000)

# 算數操作 (arithmetic operator)

# +, -, *, /, ^, %%, %/%, %*%(矩陣相乘)
2^3 # 次方
7 %% 2  # 餘數
7 %/% 2 # 商數

# 關係比較操作 (relation/comparison operator) 
# ==, !=, <, <=, >, >=

# 邏輯操作(logical operator)
# ! NOT
# & AND
# | OR

x <- c(5, 8, 10, 20)

print(x > 6 & x < 15)

print(x > 15 | x < 10)

# &：逐元素比較（Vectorized）
# &&：只比較第一個元素

c(TRUE, FALSE, TRUE) & c(TRUE, TRUE, FALSE)

c(TRUE, FALSE, TRUE) && c(TRUE, TRUE, FALSE) # Error

# && 的設計用途是只接受單一邏輯值（logical(1)），例如
TRUE && FALSE
FALSE && TRUE
TRUE && TRUE

# 特殊數值 -----
x <- Inf

x # Inf

x*-1

exp(x)

exp(-x)

x - x

0/0 # NaN

is.finite(1/3)
is.infinite(1/3)

is.finite(Inf)
is.infinite(Inf)

# NA
xNA <- c(1, 2, 3)

xNA

length(xNA) <- 4

xNA

is.nan(xNA)

is.na(xNA)

pi

letters

LETTERS

month.abb

month.name

# 資料物件 -----

# https://github.com/rwepa/r_data_scientist/blob/main/imgs/2024.07.18-dtata-object.png

# 資料物件包括向量,因子,矩陣,陣列,資料框,串列與時間序列.
# 資料物件名稱命名方式採用中, 英文皆可以, 建議使用英文.
# 如果使用R的保留字, 則在字尾處可加上 s 即可避免與保留字相同. 例: cms
# 函數輸入的參數大部分是資料框(data.frame).
# 統計與機器學習演算法回傳值以串列(list)為主.

# 🍎資料框 (data.frame) -----

# cars 資料集 -----
# 不用輸入載入資料函數data,亦可直接存取cars
data(cars, package = "datasets")

?cars
help(cars)
head(cars, n=3)

class(cars)  # "data.frame",表示資料框

cars[2]      # 篩選第2 行,class結果為"data.frame",表示資料框

cars["dist"] # 篩選dist行,class結果為"data.frame",表示資料框

cars[,2]     # 篩選第2 行,class結果為"numeric",表示向量

iris

# 最前面6筆資料 head
head(iris)

# 最後面6筆資料 tail
tail(iris)

# 資料結構 str
str(iris)

# 資料摘要 summary
summary(iris)

# 🦞實作練習 -----
# iris {datasets}
# 找出 Sepal.Length變數大於中位數的資料集
# 學員思考並練習^_^

# 🦞實作練習 -----
# Cars93 {MASS}
# 練習 Cars93 資料集的操作
data(Cars93, package = "MASS") # 載入資料集
?Cars93
??Cars93
Cars93
str(Cars93)
summary(Cars93)

# 列資料篩選
Cars93[1:3,]
Cars93[c(2,4,6,90),]

# 行資料篩選
Cars93[1]
Cars93[,1]
Cars93["Manufacturer"]

Cars93[2:4]
Cars93[,2:4]

head(Cars93[c(1,3,5,7)])
head(Cars93[c("Manufacturer", "Type", "Price", "MPG.city")])

# 條件式資料篩選
Cars93[Cars93$Price > 30,]
Cars93[Cars93$Price > 30 & Cars93$Type == "Large",]

# 將 Luggage.room 的遺漏值以平均值填補
mean(Cars93$Luggage.room) # NA

Luggage.room_Mean <- mean(Cars93$Luggage.room, na.rm = TRUE)
sum(is.na(Cars93$Luggage.room)) # 11
Cars93$Luggage.room[is.na(Cars93$Luggage.room)] <- Luggage.room_Mean
sum(is.na(Cars93$Luggage.room)) # 0

# 彙總計算 table, aggregate -----

# table     --> 次數統計表
# aggregate --> 類似 Excel 樞紐分析

data(Cars93, package = "MASS")

head(Cars93)

str(Cars93)

summary(Cars93) # 有NA值

table(Cars93$Type)

aggregate(Price ~ Type, data = Cars93, FUN = mean)

aggregate(Price ~ Type + Origin, data = Cars93, FUN = mean)

aggregate(Luggage.room ~ Type, data = Cars93, FUN = mean) # 預設NA為na.omit

# 資料框排序 -----
df <- head(iris, n = 5)

# 遞增排序
df[order(df$Sepal.Length),]

# 遞減排序
df[order(df$Sepal.Length, decreasing = TRUE),]

# 群組 table (交叉表格) -----

# 群組個數 table
table(Cars93$AirBags)

# 群組個數 table-2個維度 table(列變數, 行變數)
table(Cars93$AirBags, Cars93$Origin)

# addmargins 新增邊界值 -----

# 群組邊界計算 addmargins-預設值為總和
addmargins(table(Cars93$AirBags, Cars93$Origin))

# 群組邊界計算 addmargins-mean
addmargins(table(Cars93$AirBags, Cars93$Origin), FUN = mean)

# 群組百分比計算 prop.table
prop.table(table(Cars93$AirBags, Cars93$Origin))

# table 多維度
# 安全氣囊, 進口別, 傳動系統
table(Cars93$AirBags, Cars93$Origin, Cars93$DriveTrain)

# aggregate (Excel樞紐分析)
# 類別平均值計算
aggregate(x = Price ~ AirBags, data = Cars93, FUN = mean)

aggregate(x = Price ~ AirBags + Origin, data = Cars93, FUN = mean)

# 🌸 1.3 套件安裝與使用（install.packages / library）-----

# 套件 -----

# 套件（Package）是一組已經開發完成的函數（Functions）、資料集（Datasets）、文件（Documentation）以及其他程式碼集合，可讓使用者快速擴充 R 的功能，而不需要自行撰寫所有程式。

# e1071 package
install.packages("e1071")

library(e1071)

example(svm, package="e1071")

# 已載入的套件
search()

# R套件 - 49類別
# https://cran.csie.ntu.edu.tw/web/packages/index.html

# 49類別 - 中文說明
# RWEPA --> task
# http://rwepa.blogspot.com/2013/10/packages-list-32.html

# Packages list
# https://cran.csie.ntu.edu.tw/web/packages/available_packages_by_name.html
# search (CTRL + F) --> nsga2

# R對話資訊 -----
sessionInfo()

# 套件安裝目錄 -----

# 預設套件安裝目錄
.Library
# "C:/PROGRA~1/R/R-46~1.1/library"
# 實際位置 C:\Program Files\R\R-4.6.1\library

# 套件安裝目錄
# 結果可能與.Library 相同
.libPaths()
# [1] "C:/Users/User/AppData/Local/R/win-library/4.6"
# [2] "C:/Program Files/R/R-4.6.1/library" 

# 已安裝套件
myinstalled <- installed.packages()
class(myinstalled)
dim(myinstalled)
mypackage <- myinstalled[, 1] # matrix[列, 行]
mypackage[1:10]

library() # same as installed.packages()

# 安裝 ggplot2 套件
install.packages("ggplot2")

# 套件說明
help(package = "ggplot2")

# 查看套件版本
packageVersion("ggplot2")

# 🌸 1.4 資料匯入（CSV/Excel）與基本檢視 -----

# open data -----

# RWEPA資料下載
# https://github.com/rwepa/DataDemo

# 政府資料開放平台
# https://data.gov.tw/

# UCI Machine Learning Repository
# https://archive.ics.uci.edu/datasets

# Google Dataset Search
# https://datasetsearch.research.google.com/

# Kaggle Dataset
# https://www.kaggle.com/datasets

# World Bank Open Data
# https://data.worldbank.org/

# AI生成資料集
# ChatGPT: https://chatgpt.com/ 
# Gemini: https://gemini.google.com/ 

# 資料建立與輸入輸出 -----

# read.table  輸入文字檔
# read.csv    輸入CSV檔
# write.table 輸出文字檔
# write.csv   輸出CSV檔

# 步驟 1. 設定工作目錄
# 步驟 2. 建立資料檔
# 步驟 3. 匯入資料  read.table
# 步驟 4. 資料處理
# 步驟 5. 匯出資料

#********************
# 步驟 1. 設定工作目錄 -----
#********************

# 預設工作目錄
getwd()

# 設定工作目錄
# 先建立 C:\rdata 資料夾
workpath <- "C:/rdata"
setwd(workpath)

# 已更改為 "C:/rdata" 工作目錄
getwd()

#********************
# 步驟 2. 準備資料檔 – 範例 -----
#********************

# 日空氣品質指標(AQI)
# https://data.gov.tw/dataset/40507
# GitHub下載: https://github.com/rwepa/DataDemo/blob/master/aqx_p_434.csv

#********************
# 步驟 3. 匯入資料  read.table -----
#********************

# ?read.table
# header: 標題名稱, sep: 區隔符號

myfile <- "aqx_p_434.csv"
myfile <- "https://raw.githubusercontent.com/rwepa/DataDemo/refs/heads/master/aqx_p_434.csv"

aq <- read.table(myfile, header=TRUE, sep=",")

# 資料檢視
head(aq)

# 欄位名稱
names(aq)

#********************
# 步驟 4. 資料處理 -----
#********************

# 資料結構
str(aq)

# 資料摘要
summary(aq)

# 日期: 字串(chr)修正為日期(Date)
aq$monitordate <- as.Date(aq$monitordate)
str(aq)

# 資料處理
head(aq, n=3)
dim(aq) # 1000列11行

# 篩選 板橋 資料
aqBanqiao<- aq[aq$sitename == "板橋",]

# 依照 monitordate 欄位由小至大遞增排序
aqBanqiao <- aqBanqiao[order(aqBanqiao$monitordate),]

# 篩選 汐止 資料
aqXizhi <- aq[aq$sitename == "汐止",]

# 依照 monitordate 欄位由小至大遞增排序
aqXizhi <- aqXizhi[order(aqXizhi$monitordate),]

# 板橋暨汐止AQI趨勢圖
plot(aqBanqiao$aqi, type="b")
lines(aqXizhi$aqi, col="red")
points(aqXizhi$aqi, col="red")

# 優化趨勢圖
# 客製化Y軸最小值,最大值
ymin <- min(aqBanqiao$aqi, aqXizhi$aqi) - 1

ymax <- max(aqBanqiao$aqi, aqXizhi$aqi) + 3

plot(aqBanqiao$aqi, 
     type = "b", 
     ylim = c(ymin, ymax), 
     main = paste0(aq$monitordate[1], " AQI 板橋vs.汐止"))
lines(aqXizhi$aqi, col="red")
points(aqXizhi$aqi, col="red")
legend("topleft", legend=c("板橋", "汐止"), col=c(1,2), lty=1)

# 優化趨勢圖-revised
plot(aqBanqiao$aqi, 
     type = "b", 
     ylim = c(ymin, ymax), 
     axes=FALSE,
     xlab = "日期",
     ylab = "AQI",
     main = paste0(aq$monitordate[1], " AQI 板橋vs.汐止"))
lines(aqXizhi$aqi, col="red")
points(aqXizhi$aqi, col="red")

# Add axis
# 1=below, 2=left, 3=above and 4=right
axis(side=1, at = 1:12, labels = aqBanqiao$monitordate)
axis(side=2, las = 2)

# 圖例
legend("topleft", legend=c("板橋", "汐止"), col=c(1,2), lty=1)

# 網格線
grid()

# 外框線
box()

#********************
# 步驟 5. 匯出資料 -----
#********************

aqBanqiaoXizhi <- rbind(aqBanqiao, aqXizhi)

# 匯出結果記事本OK,Excel亂碼
write.table(x = aqBanqiaoXizhi, 
            file = "aqBanqiaoXizhi.csv", 
            sep =",", 
            row.names = FALSE)

# Excel匯入CSV檔案正常顯示方法
# refer to materials

# Excel 匯入與匯出 -----
# refer to materials
# 推薦使用 readxl, writexl, openxlsx2 套件

# RData 資料物件儲存/匯入 -----

# save(資料物件1, 資料物件2, file=“myData.RData”)
# load(“myData.RData”)

# 🦞實作練習 -----
# 練習儲存 aq.Banqiao.Xizhi 為 aq.Banqiao.Xizhi.RData
# 練習載入 aq.Banqiao.Xizhi.RData

save(aq.Banqiao.Xizhi, file="aq.Banqiao.Xizhi.RData")
load("aq.Banqiao.Xizhi.RData")

# 匯入sas7bdat -----
# https://cran.r-project.org/web/packages/sas7bdat/index.html

library(sas7bdat)

# h_nhi_ipdte103.sas7bdat 103年模擬全民健保處方及治療明細檔_西醫住院檔
# 下載 https://github.com/rwepa/DataDemo/blob/master/h_nhi_ipdte103.sas7bdat

# dd2014 <- read.sas7bdat("h_nhi_ipdte103.sas7bdat") # 14297*80, 7.25MB

system.time(dd2014 <- read.sas7bdat("h_nhi_ipdte103.sas7bdat")) # ERROR

head(dd2014)

# 使用 haven 套件匯入SAS檔案

# 載入套件
library(haven)

# 匯入資料
dd2014 <- read_sas("h_nhi_ipdte103.sas7bdat")

# 執行系統時間
system.time(dd2014 <- read_sas("h_nhi_ipdte103.sas7bdat")) # 0.19秒
# 使用者 系統   流逝 
# 0.19   0.00   0.19

# 顯示資料
dd2014 # 14,297 × 80

# 🍎 補充篇: 大型檔案的匯入 -----

# 建立2300萬筆模擬資料
getwd()
datasize <- 23000000
mydata <- matrix(c(NA), nrow=datasize, ncol=5)
set.seed(168)
mydata[,1] <- sample(c(1:17770), datasize, replace = TRUE)
mydata[,2] <- sample(c(1:480189), datasize, replace = TRUE)
mydata[,3] <- sample(c(1:5), datasize, replace = TRUE)
mydata[,4] <- sample(c(1999:2014), datasize, replace = TRUE)
mydata[,5] <- sample(c(1:12), datasize, replace = TRUE)
colnames(mydata) <- c("movie", "customer","rating","year", "month")
dim(mydata)
write.table(mydata, file="bigdata.txt", sep=",", row.names=FALSE, col.names=TRUE) # 2300萬*5, 312MB

# Ctrl + Shift + F10: 重新啟動R
system.time(bigdata1 <- read.csv(file="bigdata.txt", header=TRUE)) # 17.02秒

# Ctrl + Shift + F10: 重新啟動R
library(data.table)
# https://cran.r-project.org/web/packages/data.table/index.html

system.time(movies <- fread("bigdata.txt")) # 0.14秒, 17.02/0.14 = 121倍時間差異

dim(movies) # 23000000*5
class(movies) # "data.table" "data.frame"
summary(movies)

# 🍎 補充篇: 大量檔案的匯入 -----

getwd()

sample1 <- iris[sample(1:nrow(iris),10),]
sample2 <- iris[sample(1:nrow(iris),10),]
sample3 <- iris[sample(1:nrow(iris),10),]

# 模擬三個匯出檔案
write.table(sample1, file="sample1.csv", sep=",", row.names=FALSE)
write.table(sample2, file="sample2.csv", sep=",", row.names=FALSE)
write.table(sample3, file="sample3.csv", sep=",", row.names=FALSE)
dir()

# 方法 1. 使用 lapply-匯入CSV檔案

# getwd() 可以修改為實際工作目錄
# pattern 可以使用"正規表示式". 輸入 ?regex 查詢線上說明
?regex

files <- dir(getwd(), pattern="sample.*\\.csv$", recursive=TRUE, full.names=TRUE)
files
tables <- lapply(files, read.csv, sep=",") # list
mydf1 <- do.call(rbind, tables) # data.frame
mydf1

# 方法 2. 使用 for loop 將匯入資料合併為資料框

mydf2 <- data.frame() # 建立空白資料框

for (x in files) {
  x <- read.csv(file=x, sep=",")
  # print(x)
  mydf2 <- rbind(mydf2, x)
}

str(mydf2) # 60*12

# 🍎 資料物件 - tibble -----

install.packages("tibble")

library(tibble)

# 建立新的 tibble
students <- tibble(
  ID    = c(1, 2, 3, 4),
  Name  = c("Amy", "John", "Mary", "David"),
  Age   = c(20, 21, 19, 22),
  Score = c(88, 75, 92, 81),
  Country = c('Taiwan', 'USA', 'Taiwan', 'Japan')
)

students # A tibble: 4 × 5

class(students) # "tbl_df" "tbl" "data.frame"

df <- tibble(iris)

df
# A tibble: 150 × 5
# 預設只顯示：前 10 列, 欄位名稱, 資料型態

# 全部顯示
print(df, n = Inf)

# 查看資料結構
glimpse(df)

# 存取欄位
df$Petal.Width

df[["Petal.Width"]]

df[, "Petal.Width"]

# 將資料框轉換為 tibble
tb <- as_tibble(mtcars)

# 🌸 1.5 練習：讀入資料並完成基本摘要與簡單圖表 -----

# 🦞實作練習 -----

# 1.使用 open data 等資料集，完成以下練習
# 2.匯入資料 read.table, read.csv, read_excel {readxl}
# 3.處理 str, summary, glimpse, table, aggregate, order, as.Date, system.time, lappy, do.call, tibble, as_tibble
# 4.繪圖/匯出 plot, lines, points, legend , axis, write.csv, write.table, save, load

# 參考資料 -----

# RWEPA
# http://rwepa.blogspot.com/

# R 資料科學家
# https://github.com/rwepa/r_data_scientist  

# R入門資料分析與視覺化應用教學(付費)
# https://mastertalks.tw/products/r?ref=MCLEE

# R商業預測與應用(付費)
# https://mastertalks.tw/products/r-2?ref=MCLEE 
# end
# 謝謝您的聆聽 , Q & A