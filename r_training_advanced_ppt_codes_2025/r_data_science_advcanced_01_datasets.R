# file     : r_data_science_advcanced_01_datasets.R
# title    : 1.理解資料集操作
# author   : Ming-Chang Lee
# date     : 2025.07.12
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----
# 1.理解資料集操作
# 1.1 R與RStudio下載、安裝與操作
# 1.2 認識datasets套件之資料操作

# 🌸 1.1 R與RStudio下載、安裝與操作 -----

# RWEPA簡介 -----
# http://rwepa.blogspot.com/

# 資料分析暨視覺化應用 -----

# 資料分析架構/APC方法 -----
# 1.群組
# 2.時間
# 3.建立評估變數

# Excel 下拉式選單與條件式格式設定教學 -----
# 🌸YouTube (包括中文字幕)：https://youtu.be/OVA4dvkrsBM
# LINK: https://rwepa.blogspot.com/2023/10/excel-drop-down-list-and-conditional-formatting.html

# Regression Analysis in Excel (Excel 迴歸分析) -----
# 🌸YouTube：https://youtu.be/i5_urp8XzEs
# LINK: https://rwepa.blogspot.com/2022/05/httpsrwepa.blogspot.com202205regression-analysis-in-excel.html.html

# R+Shiny, Python+Streamlit 互動式平台 -----

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
# 系統展示: https://rwepa-sales-dashboard.streamlit.app/ 

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

# R for macOS -----
# macOS 安裝 R 軟體: https://youtu.be/72MYRBNo5Bk
# macOS 中文字型 plot: https://rwepa.blogspot.com/2013/11/mac-plot.html
# Xcode, Fortran compiler: https://cran.r-project.org/bin/macosx/tools/

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
# RStudio \ Addins \ Browse RStudio addins
# 參考: https://docs.posit.co/ide/user/ide/guide/productivity/add-ins.html

# R + Editor -----

# Eclipse + StatET 4.11.0 -----
# https://projects.eclipse.org/projects/science.statet

# Visual Studio Code + R
# https://code.visualstudio.com/docs/languages/r

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
# https://rstudio.github.io/cheatsheets/html/rmarkdown.html
# 儲存為 *.Rmd 檔案

# 步驟1. 安裝 tinytex
# install.packages("tinytex")
 
# 步驟2. 安裝 TinyTeX
# tinytex::install_tinytex()

# 步驟3. Fonts 下載: 
# https://github.com/rwepa/DataDemo/tree/master/fonts
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

# R套件 - 48類別
# https://cran.csie.ntu.edu.tw/web/packages/index.html

# 48類別 - 中文說明
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

# 小寫英文字母
letters

# 大寫英文字母
LETTERS

# 英文月份縮寫
month.abb

# 英文月份全名
month.name

# 🌸 1.2 認識 datasets 套件之資料操作 -----

# Q1: 取得 datasets 套件之資料集清單 -----
data(package = "datasets")

# Q2: 取得 datasets 套件的資料集清單並以網頁呈現 -----
# 技巧: 使用 kableExtra, DT 套件之表格網頁呈現

library(kableExtra)  # 表格製作

mylist <- data(package = "datasets")
names(mylist) # "title" "header" "results" "footer"
mylist$results # matrix
df <- data.frame(mylist$results) # 108*4
df <- df[,c(3, 4)]
names(df)

# 建立資料集類別函數
getDataClass <- function (x) {
  out <- tryCatch(class(eval(parse(text = x))), error = function(e) "NOT EXPORTED")
  return(out)
}

# 新增 Class 欄位
myClass <- lapply(df$Item, getDataClass)

# 取出第1個元素
df$Class <- sapply(myClass, "[[", 1)

str(df)

# 理解 datasets 套件版本
packageVersion("datasets")

# 將 df 匯出為 kbl 資料物件並於瀏覽器檢視
df %>%
  kbl(caption = "<center>datasets套件資料集明細表</center>") %>% # 標題
  kable_styling("hover", full_width = FALSE) %>%                 # 不使用全部寬度
  footnote(general = "說明",
           number = c(paste0("R版本: ", packageVersion("base")),
                      paste0("datasets套件版本: ", packageVersion("datasets"))))

# 將 df 匯出為 kbl 資料物件並儲存為HTML
df %>%
  kbl(caption = "<center>datasets套件資料集明細表</center>") %>%
  kable_styling("hover", full_width = FALSE) %>%
  footnote(general = "說明",
           number = c(paste0("R版本: ", packageVersion("base")),
                      paste0("datasets套件版本: ", packageVersion("datasets")))) %>%
  save_kable(file = "datasets套件資料集明細表.html")

library(DT)
datatable(df, filter = "top")

# Q3: 取得 datasets 套件的資料集清單並匯出為 .csv -----

write.csv(df, file = "datasets_list.csv", row.names=FALSE)

# Q4: 取得 datasets 套件的資料集清單並匯出為 .xlsx -----

library(writexl)
write_xlsx(df, path = "datasets_list.xlsx")

# Q5: 熟悉以下資料集之資料操作 -----

# 1. AirPassengers  : ts         時間序列
# 2. Titanic        : table      表格
# 3. airquality     : data.frame 資料框
# 4. iris           : data.frame 資料框 
# 5. mtcars         : data.frame 資料框
# 6. penguins       : data.frame 資料框

# 🌸 1. AirPassengers -----
# 1949-1960年航空旅客每月平均乘客數,單位:千人.
# 12年*12個月=144筆資料
# 時間序列是一組按照時間發生先後順序進行排列的資料序列.
# 通常一組時間序列的時間間隔為一固定值.
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_ppt_codes_2025/r_data_science_02_r_object.R#L652

?AirPassengers

data("AirPassengers")

AirPassengers

class(AirPassengers) # ts

length(AirPassengers)

# 繪製 ts 資料
plot(AirPassengers)
# 找出樣式 (Patterns)

# 🌸 2. Titanic -----
# 1912年鐵達尼號存活資料
?Titanic

data(Titanic)

Titanic

class(Titanic) # table

# 繪製 table 資料
plot(Titanic)

# Mosaic Plots
# 馬賽克圖（Mosaic Plot）是一種用於視覺化多類別資料的圖表
# 特別適合展示多個類別變數之間的關係
# 將一個矩形區域分割成更小的矩形，每個小矩形的面積代表了相應類別組合的比例或頻率
# 目標是清晰地展示了資料分佈和關聯情形.

mosaicplot(Titanic, main = "鐵達尼號之馬賽克圖")

mosaicplot(Titanic, main = "鐵達尼號之馬賽克圖", color = TRUE)

mosaicplot(Titanic, main = "鐵達尼號之馬賽克圖", color = TRUE, shade = TRUE)
# 找出樣式 (Patterns)

# 使用公式 ~ 表示
mosaicplot(~ Sex + Age + Survived, data = Titanic, color = TRUE)

# Higher survival rates in children?
apply(Titanic, c(3, 4), sum)

# Higher survival rates in females?
apply(Titanic, c(2, 4), sum)

# total amount
Titanic
sum(Titanic)

# 將 table 轉換為 data.frame
titanic_df <- as.data.frame(Titanic)
titanic_df
sum(titanic_df$Freq) # 2201

# 🌸 3. airquality -----
?airquality # 153*6
# 1973年紐約空氣品質測量

data(airquality)

airquality # 153*6

class(airquality)
# Ozone	: Ozone (ppb)             : 平均臭氧濃度
# Solar.R	: Solar R (lang)        : 太陽輻射頻率
# Wind	: Wind (mph)              : 平均風速(英里/小時)
# Temp	: Temperature (degrees F) : 每日最高溫(華氏)
# Month	: Month (1--12)           : 月份
# Day	    : Day of month (1--31)  : 日期

str(airquality)

summary(airquality) # 有 NA 值

# 散佈圖矩陣 (Scatterplot Matrices)
pairs(airquality, panel = panel.smooth, main = "1973年紐約空氣品質-散佈圖矩陣")
# 找出樣式 (Patterns)

# 🌸 4. iris ------
?iris

data(iris)

iris # 150*5

str(iris)

summary(iris) # 沒有 NA 值

# 相關係數
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}

# iris-散佈圖矩陣
pairs(iris[1:4], 
      col = iris$Species, 
      pch = 16, 
      lower.panel = panel.smooth, # 使用 lowess
      upper.panel = panel.cor)

legend(x = 0.5,
       y = 1, 
       levels(iris$Species), 
       pch = 16,
       col = (1:3),
       bty = "n",
       horiz = TRUE, 
       xjust = 0.5, 
       yjust = 0.2, 
       xpd = TRUE)
# bty = "n" 取消圖例外框
# xpd = TRUE: 所有繪圖都會被裁切至圖形區域(figure region)
# xpd = FALSE: 所有繪圖都會被裁切至繪圖(plot region)
# 找出樣式 (Patterns)

# 🌸 5. mtcars -----
?mtcars
# 汽車資料
# mpg	 : Miles/(US) gallon                       ; 英里/加侖
# cyl	 : Number of cylinders                     ; 汽缸數
# disp : Displacement (cu.in.)                   ; 排氣量
# hp   : Gross horsepower                        ; 總馬力
# drat : Rear axle ratio                         ; 後軸傳動比
# wt   : Weight (1000 lbs)                       ; 重量
# qsec : 1/4 mile time                           ; 加速至1/4英哩時間
# vs   : Engine (0 = V-shaped, 1 = straight)     ; 引擎排列
# am   : Transmission (0 = automatic, 1 = manual); 變速箱(0=自排, 1=手排)
# gear : Number of forward gears                 ; 前進檔數
# carb : Number of carburetors                   ; 化油器數量

data(mtcars)

mtcars # 32*11

str(mtcars)

summary(mtcars)

# mtcars-散佈圖矩陣
pairs(mtcars, main = "mtcars data", gap = 1/4)

# mtcars-條件圖
coplot(mpg ~ disp | as.factor(cyl), 
       data = mtcars,
       panel = panel.smooth, 
       rows = 1)

# 🌸 6. penguins -----
# 南極洲帕爾默站企鵝
?penguins

# species: factor, with levels Adelie, Chinstrap, and Gentoo; 3個物種: 阿德利企鵝(Adelie penguin), 頰帶企鵝(chinstrap penguin), 巴布亞企鵝(Gentoo penguin) 
# island: factor, with levels Biscoe, Dream, and Torgersen) ; 島嶼
# bill_len: numeric, bill length (millimeters)              ; 喙長(公釐, mm)
# bill_dep: numeric, bill depth (millimeters)               ; 喙深
# flipper_len: integer, flipper length (millimeters)        ; 鳍長
# body_mass: integer, body mass (grams)                     ; 重量
# sex: factor, with levels female and male                  ; 性別
# year: integer, study year: 2007, 2008, or 2009            ; 研究年份

data(penguins)

penguins # 344*8

str(penguins)

summary(penguins) # 有 NA 值

# 理解 ?penguins 結果

# https://bookdown.org/adam_aiken/rboot/dataviz.html

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