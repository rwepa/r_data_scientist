# file     : r_data_science_01_r_rstudio.R
# title    : R/RStudio簡介
# author   : Ming-Chang Lee
# date     : 2025.06.07
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----
# R/RStudio簡介
# 1.1 R/RStudio下載、使用與套件簡介
# 1.2 開放資料實務應用

# 1.1 R/RStudio下載、使用與套件簡介
# RWEPA簡介 -----
# http://rwepa.blogspot.com/

# 資料分析暨視覺化應用 -----

# 資料分析架構/APC方法 -----
# 1.群組
# 2.時間
# 3.建立評估變數

# Excel 下拉式選單與條件式格式設定教學
# 🌸YouTube (包括中文字幕)：https://youtu.be/OVA4dvkrsBM
# LINK: https://rwepa.blogspot.com/2023/10/excel-drop-down-list-and-conditional-formatting.html

# R+Shiny, Python+Streamlit 互動式平台

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

# shiny銷售儀表板
# Shiny: https://rwepa.shinyapps.io/shinySalesDashboard/
# RWEPA | shiny企業實務應用 第4集-shiny銷售儀表板【中文字幕】
# YouTube: https://youtu.be/4GgZlf8heQk

# shiny企業實務應用 第6集-小明算命師(下) - 第1季完結篇
# Ubuntu Shiny Server: https://shiny.rwepa.net/shiny-hr-teller/
# YouTube: https://youtu.be/rrD6KV3eV-w

# 登山路線視覺化分析平台 (Python + Streamlit)
# YouTube: https://youtu.be/-_zghs2qrIg
# 系統展示: https://rwepa-climb.streamlit.app/

# 銷售儀表板2025 (Python + Streamlit)
# YouTube：https://youtu.be/QmvlYHspvns 
# 系統展示:  https://rwepa-sales-dashboard.streamlit.app/ 

# Power BI - RFM分析
# 🌸YouTube：https://youtu.be/Lkr9HmzLTtg
# 🌸Link: http://rwepa.blogspot.com/2023/07/rwepa-rfm-analysis-using-power-bi.html

# Tableau - 智慧製造應用
# https://github.com/rwepa/Talks
# https://public.tableau.com/app/profile/ming.chang.lee/vizzes

# Tableau 教學
# Tableau資料分析與視覺化工具實作教師工作坊(初階)
# https://github.com/rwepa/Talks/blob/main/tableau_tutorial_basic.pdf

# Tableau資料分析與視覺化工具實作教師工作坊(進階)
# https://github.com/rwepa/Talks/blob/main/tableau_tutorial_advanced.pdf

# Tableau與R語言實務應用
# https://github.com/rwepa/Talks/blob/main/tableau_r.pdf

# Tableau與MySQL資料庫實務應用
# https://github.com/rwepa/Talks/blob/main/tableau_mysql.pdf

# Python 程式設計-李明昌 免費電子書
# http://rwepa.blogspot.com/2020/02/pythonprogramminglee.html

# R 入門資料分析與視覺化應用(7小時28分鐘)
# https://mastertalks.tw/products/r?ref=MCLEE

# R 商業預測應用(8小時53分鐘)
# https://mastertalks.tw/products/r-2?ref=MCLEE

# 如何學習 R?
尋找答案 <- list(方法1 = c("同事", "同學", "朋友等"),
             方法2 = "Google",
             方法3 = "alan9956@gmail.com")

print(尋找答案)

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

# Using R for Data Analysis and Graphics: Introduction, Code and Commentary
# https://cran.csie.ntu.edu.tw/doc/contrib/usingR.pdf

# R參考文獻 -----
citation()

# 實作練習 -----
# R執行畫面
plot(runif(100), type="l", main= "R大數據分析")
demo(graphics)
demo(persp)

# R for Mac -----
# https://youtu.be/72MYRBNo5Bk

# R for Ubuntu -----
# http://rwepa.blogspot.tw/2013/05/ubuntu-r.html

# 實作練習 -----
# 新增R檔案練習
# 使用R原生環境,輸入以下程式碼, 另儲存成 MyFirstProject.R

plot(runif(10), type="b", main= "R大數據分析")
x <- rnorm(10)
x
pairs(iris[-5], pch=16, col=iris$Species, main="RWEPA-iris資料集散佈圖矩陣")

# RStudio下載 -----
# https://posit.co/

# 實作練習 -----
# RStudio 儲存檔案
# 新增 C:\rdata\helloworld.R
# 參考講義輸入程式碼

# RStudio Addins (外掛功能) -----
install.packages("addinslist")
# 參考: https://docs.posit.co/ide/user/ide/guide/productivity/add-ins.html

# R + Editor -----

# Eclipse + StatET 4.10.0 -----
# https://projects.eclipse.org/projects/science.statet

# Visual Studio Code + R
# https://vscode.dev.org.tw/docs/languages/r

# Anaconda + Jupyter Notebook -----

# 方法1 使用Anaconda Navigator
# 僅支援 R-3.6.1
# 先安裝 Anaconda: https://www.anaconda.com/download
# https://docs.anaconda.com/navigator/tutorials/r-lang/
# refere to materials

# 方法2 使用R原生環境
# 支援最新版 R-4.4.1
# https://www.datacamp.com/blog/jupyter-and-r-markdown-notebooks-with-r

# 安裝 IRkernel 三步驟

# 步驟1 開啟R終端機視窗
# 開啟命令提示字元
# cd C:\Program Files\R\R-4.4.1\bin
# R

# 步驟2 安裝套件
# install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))

# devtools::install_github('IRkernel/IRkernel')

# IRkernel::installspec()

# 步驟3 關閉R環境
# q()

# Positron (整合R, Python, Jupyter), Since 2024.6 -----
# 首頁: https://github.com/posit-dev/positron 
# 下載: https://github.com/posit-dev/positron/releases

# R Markdown -----
# https://www.rstudio.com/resources/cheatsheets/
# 儲存為 *.Rmd 檔案
# refer to materials

# Quarto, Since 2022.7 -----
# 下載: https://quarto.org/
# 儲存為 *.qmd 檔案

# R 基礎操作 -----

# R運作方式
# 資料物件 -> 函數與運算式 -> 結果物件

# 控制台的特定符號 -----
iris$Sepal.Length

# 取出第145個值
iris$Sepal.Length[145]

# 物件命名原則 -----
2024bigdata <- "R" # Error

bigdata2024 <- "R" # OK

big. <- 123
big_ <- 123

# Google's R Style Guide -----
# https://google.github.io/styleguide/Rguide.html

# 輔助說明 -----

help.start()

?plot

help(plot)

help.search("regression")

??regression

# 套件 -----

# e1071 package
install.packages("e1071")

library(e1071)

example(svm, package="e1071")

# 已載入的套件
search()

# R套件 - 44類別
# https://cran.csie.ntu.edu.tw/web/packages/index.html

# 44類別 - 中文說明
# RWEPA --> task
# http://rwepa.blogspot.com/2013/10/packages-list-32.html

# R對話資訊 -----
sessionInfo()

# 套件安裝目錄 -----

# 預設套件安裝目錄
.Library

# 套件安裝目錄
# 可能全部安裝在 \R\library
.libPaths()

# 已安裝套件
myinstalled <- installed.packages()
class(myinstalled)  # "matrix" "array"
dim(myinstalled)    # 1830*16
mypackage <- myinstalled[, 1] # matrix[列, 行]
mypackage[1:10]

library() # same as installed.packages()

# 資料型別 -----

# 整數
x1 <- c(1, 2, 3)

# 數值
x2 <- seq(1,10, by=0.5)

# 字串
x3 <- c(1, 2, 3, "台北市", "新北市")

# 邏輯值
x4 <- x1 > 1.5

# 數學運算 -----

# R即是計算機
# log, exp

# e，作為數學常數，是自然對數函數的底數，亦稱自然常數、自然底數，或是尤拉數（Euler's number），以瑞士數學家尤拉命名。它是一個無限不循環小數。
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

# 1.2 開放資料分析 -----

# RWEPA \ open data
# https://rwepa.blogspot.com/2019/09/dataset.html

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

#********************
# 步驟 3. 匯入資料  read.table -----
#********************

# ?read.table
# header: 標題名稱, sep: 區隔符號

myfile <- "aqx_p_434.csv"

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

# RData 資料物件儲存/匯入 -----

# save(資料物件1, 資料物件2, file=“myData.RData”)
# load(“myData.RData”)

# 實作練習 -----
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

system.time(dd2014 <- read.sas7bdat("h_nhi_ipdte103.sas7bdat"))

head(dd2014)

# 使用 haven 套件匯入SAS檔案

# 載入套件
library(haven)

# 匯入資料
dd2014 <- read_sas("h_nhi_ipdte103.sas7bdat")

# 執行系統時間
system.time(dd2014 <- read_sas("h_nhi_ipdte103.sas7bdat")) # 0.43秒
#   user  system elapsed 
#   0.21    0.00    0.43 

# 顯示資料
dd2014 # 14,297 × 80

# R 連結資料庫 -----

# RStudio 連結MySQL
# 🌸YouTube(包括中文字幕)：https://youtu.be/jsdM-y1nspQ 
# https://rwepa.blogspot.com/2024/05/using-rstudio-to-connect-mysql.html 

# RMySQL套件編譯與建立
# http://rwepa.blogspot.tw/2013/01/windows-rmysql.html

# RODBC 與 SQL Server 資料匯入與寫入
# http://rwepa.blogspot.tw/2013/08/rodbc-sql-server.html

# Oracle
# ROracle: OCI Based Oracle Database Interface for R

# PostgreSQL
# RPostgreSQL: R Interface to the 'PostgreSQL' Database System

# SQLite
# RSQLite: 'SQLite' Interface for R

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