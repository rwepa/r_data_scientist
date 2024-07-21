# file     : 2024.07.22-correlation-regression.R
# title    : 相關與迴歸分析
# author   : Ming-Chang Lee
# date     : 2024.07.22
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----
# 1.相關分析
# 2.迴歸分析
# 3.ts,POSIXct,POSIXlt日期時間物件
# 4.常用財金套件zoo,xts,timeSeries,quantmod,tidyquant
# 5.shiny簡介
# 6.shiny元件應用
# 7.shiny佈署

# 1.相關分析 -----

# mtcars 資料集
mtcars

str(mtcars) # 32*11 所有資料行皆為數值

class(mtcars) # data.frame

rownames(mtcars) # 列名稱

colnames(mtcars) # 行名稱

names(mtcars) # 行名稱

cor(mtcars) # 相關係數

class(cor(mtcars)) # "matrix" "array"

# 相關圖 - corrplot 套件 -----

library(corrplot)

corr <- cor(mtcars)
corr

# 預設繪製相關係數圖
corrplot(corr)

corrplot(corr, method="pie")

corrplot(corr, method="number")

# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html

# 2.迴歸分析 -----

# 機器學習 -----

# 監督式學習 vs.非監督式學習

# CRISP-DM標準流程 -----

# 資料探勘生命週期 (CRISP-DM)
# https://en.wikipedia.org/wiki/Cross_Industry_Standard_Process_for_Data_Mining
# 步驟 1：商業理解
# 步驟 2：資料理解
# 步驟 3：資料準備
# 步驟 4：模式建立
# 步驟 5：評估與測試
# 步驟 6：佈署應用

# 模型評估 -----

# 數值模型績效指標
# 均方誤差 (Mean Squared Error, MSE)
# 均方根誤差 (Root Mean Squared Error, RMSE)
# 均方根誤差 (Root Mean Squared Error, RMSE)

# 類別模型績效指標
# 混淆矩陣(Confusion Matrix)
# http://rwepa.blogspot.com/2013/01/rocr-roc-curve.html

# 線性模型 (Linear Model) -----

# 迴歸分析推論
# https://github.com/rwepa/DataDemo/blob/master/regression_01.pdf

# R 迴歸模型
?lm
?glm
?nls
?arima

?lm
# my.lm <- lm(formula, data="xxx")
# formula: y ~ x1 + x2 + ... +xn

# 線性迴歸散佈圖
plot(women, main="線性迴歸散佈圖", xlab="自變數(X)", ylab="依變數(Y)", pch=16, col="darkblue")
abline(lm(weight ~ height, data=women), col="red", lty=2, lwd=2)
text(59, 150, expression(y[i] == beta[0] + beta[1] * x[i] + epsilon[i]), pos=4, cex=1.5)
text(59, 144, expression(hat(y[i]) == hat(beta[0]) + hat(beta[1]) * x[i]), pos=4, cex=1.5)
arrows(62, 140, 63, 130.5, col="red", lwd=2)

# 迴歸模型 – women資料集  -----

# women: Average Heights and Weights for American Women
# y: weight
# x: height

fit.lm <- lm(weight ~ height, data=women)

class(fit.lm) # lm

str(fit.lm) # List of 12, lm物件本質上一種 list

summary(fit.lm)
# weight = -87.52+3.45*height

# residuals(殘差)
names(fit.lm)
women$weight   # actual
fitted(fit.lm) # predicted
residuals(fit.lm) # residual=actual-predicted
women$weight - fitted(fit.lm)

# 迴歸係數
fit.lm$coefficients
coef(fit.lm)
coefficients(fit.lm)

# plot data
plot(x=women$height, 
     y=women$weight, 
     xlab="Height (in inches)", 
     ylab="Weight (in pounds)", 
     main="Average Heights and Weights for American Women")

abline(fit.lm, col="red")

# 模型診斷繪圖-方法1
# 結果有4張圖形
# (1)Residuals vs Fitted
# (2)Q-Q Residuals
# (3)Scale-Location (or Spread-Location)
# ($)Residuals vs Leverage

op <- par(mfrow=c(2,2))
plot(fit.lm)
par(op)

# 依序每次繪製一張圖
plot(fit.lm, 1) # Residuals vs Fitted
plot(fit.lm, 2) # Q-Q Residuals
plot(fit.lm, 3) # Scale-Location
plot(fit.lm, 4) # Cook's distance
plot(fit.lm, 4, id.n = 5) # 顯示5個極值
plot(fit.lm, 5) # Residuals vs Leverage
plot(fit.lm, 6) # Cook's distance vs Leverage

# 模型診斷繪圖-方法2
library(ggfortify)
autoplot(fit.lm)

# 迴歸係數視覺化
library(coefplot)

# 粗線: 1個標準誤差的信賴區間 (Confidence interval)
# 細線: 2個標準誤差的信賴區間
# 圓點: 係數的估計值
# 灰色垂直線為０的參考線
# 如果2個標準誤差的信賴區間不包括0, 則該係數是顯著的.
coefplot(fit.lm)

# 預測新資料
womenNew <- data.frame(height = c(64.5, 70.2))

womenNew

womenPredict <- predict(fit.lm, 
                        newdata = womenNew,
                        se.fit = TRUE,
                        interval = "prediction",
                        levels = 0.95)
womenPredict$fit

# R 練習-行銷資料 marketing -----

# 資料檔: https://github.com/rwepa/DataDemo/blob/master/marketing.csv

# 程式碼: https://github.com/rwepa/DataDemo/blob/master/marketing.R

# 常用操作 Excel 套件

# readxl: 讀取 Excel【推薦】
# writexl: 寫入至 Excel【推薦】
# openxlsx: 讀取 Excel, 格式設定(包括plot), 寫入至 Excel【推薦】
# xlsx: 讀取 Excel, 格式設定, 寫入, 需安裝 Java JDK或JRE
# XLConnect: 讀取 Excel, 格式設定, 寫入, 需安裝 Java JDK或JRE

# 3.ts,POSIXct,POSIXlt日期時間物件 -----

# 時間序列物件 - ts (Time Series) -----
set.seed(168)
data.ts <- ts(round(runif(81,3000,8000)), start=c(1994,1), frequency=4)
is.ts(data.ts)
start(data.ts)
end(data.ts)
frequency(data.ts)
deltat(data.ts) # 0.25(=1/4)
plot(data.ts)
plot.ts(data.ts)

# 日期/時間

# as.Date( ) -----
mydate <- as.Date("1970/1/1")
mydate
class(mydate)
as.numeric(mydate)
as.character(mydate)

# as.Date( , format=...) -----
as.Date("5/26/2022", format="%m/%d/%Y")
as.Date("05/26/2022", format="%m/%d/%Y")
as.Date("May 26, 2022", format="%B %d, %Y") # NA
as.Date("五月 26, 2022", format="%B %d, %Y")

# 方法1.調整 locale 值
Sys.setlocale("LC_TIME", "C")
as.Date("May 26, 2022", format="%B %d, %Y")

# CTRL + SHIFT + F10
# 方法2.使用lubridate套件
library(lubridate)
parse_date_time("May 26, 2022", orders="%B %d, %Y")

# CTRL + SHIFT + F10
# format( ) – 調整輸出格式
mydate <- Sys.Date()
mydate
format(mydate, format="%m-%d-%Y")
class(format(mydate, format="%m-%d-%Y"))

# 日
format(mydate, format="%d")

# 月
months(mydate)

# 星期
weekdays(mydate)

# 季
quarters(mydate)

# 年
format(mydate, format="%Y")

# 民國年
paste0("民國", as.numeric(format(mydate, format="%Y")) - 1911, "年")

# 年月日時分秒
# 1.POSIXct 類別
# 2.POSIXlt 類別(l:List)

# 線上說明
?POSIXt

# 1.建立 POSIXct 物件
myPOSIXct <- as.POSIXct(Sys.time())
myPOSIXct
class(myPOSIXct)
Sys.timezone()
attributes(myPOSIXct)

myDateTimeStr1 <- "4-7-2011 09:10:01"
myPOSIXct1 <- as.POSIXct(myDateTimeStr1, format="%d-%m-%Y %H:%M:%S")
myPOSIXct1
?strptime

# 高頻資料(High Frequency Data)
HfDateTimeStr <- "2018-7-23 10:17:07.125"
HfPOSIXct <- as.POSIXct(HfDateTimeStr)
HfPOSIXct

# 調整小數點顯示位數
options(digits.secs = 3)
HfPOSIXct

# 2.建立 POSIXlt 物件
myPOSIXlt <- as.POSIXlt(Sys.time())
myPOSIXlt
class(myPOSIXlt)
names(unclass(myPOSIXlt))
myPOSIXlt$sec
myPOSIXlt$min
myPOSIXlt$yday

# 4.常用財金套件zoo,xts,timeSeries,quantmod,tidyquant -----

# zoo 套件 -----

# https://cran.r-project.org/web/packages/zoo/index.html

library(zoo)

f <- function(a, b) {
  c <- paste(a, b)
  return(strptime(c, format = "%Y%m%d %H%M"))
}

d <- read.zoo(text="TICKER,PER,DATE,TIME,CLOSE
                    SYMBOL1,1,20180728,1001,14180
                    SYMBOL2,1,20180728,1002,14241",
              FUN = f,
              index.column = list("DATE", "TIME"),
              header=TRUE, sep=",")
d
class(d) # zoo

# 練習-使用zoo套件,台股期貨匯入與繪圖 -----

library(zoo)

# 匯入資料
# https://github.com/rwepa/DataDemo/blob/master/tx_1min_2014.csv

tx1min <- read.table("tx_1min_2014.csv", header = TRUE, sep = ",")

# 資料結構(str)與摘要(summary)
head(tx1min)
str(tx1min) # data.frame 74217*7
summary(tx1min) # 檢查是否有NA

# 將Date, Time合併為一個 DateTime 欄位
tx1min$DateTime <- paste(tx1min$Date, tx1min$Time)
tx1min <- tx1min[, c(8, 3:7)]
head(tx1min)

# 轉換為 zoo 物件
tx1min <- read.zoo(tx1min, format="%Y/%m/%d %H:%M:%S", FUN=as.POSIXct)
str(tx1min) # zoo 74217*5
head(tx1min)

# 繪圖
plot(tx1min, main="2014年台股期貨", xlab="日期")

# 資料篩選
tx1min.2014q1 <- window(tx1min, start=as.POSIXct("2014-1-1"), end=as.POSIXct("2014-3-31"))
dim(tx1min.2014q1) # 16452*5
head(tx1min.2014q1, n=3)
tail(tx1min.2014q1, n=3)

# xts 套件 -----

# https://cran.r-project.org/web/packages/xts/index.html

library(xts)
(xts1 <- xts(x=1:10, order.by=Sys.Date()-1:10))

dates <- seq(as.Date("2017-04-01"), length=5, by="days")
data <- rnorm(5)
xts2 <- xts(x=data, order.by=dates)
xts2

xts3 <- xts(x=rnorm(10), order.by=as.POSIXct(Sys.Date()+1:10))
xts3

data(AirPassengers)
xts4 <- as.xts(AirPassengers)
head(xts4)

index(xts4)    # 索引值
coredata(xts4) # 資料

# timeseries 套件 -----

# https://cran.r-project.org/web/packages/timeSeries/index.html
# 線上說明 https://cran.r-project.org/web/packages/timeSeries/vignettes/timeSeriesPlot.pdf

# quantmod 套件 -----

# 載入 quantmod 套件會有Error
# library(quantmod)
# Error in new.session() : Could not establish session after 5 attempts

# 解決方法, 使用 install_github
# Ctrl + Shift + F10
remotes::install_github("joshuaulrich/quantmod@358-getsymbols-new.session")
# 顯示以下4個選項, 選取2
# 1: All                         
# 2: CRAN packages only          
# 3: None                        
# 4: zoo (1.8-9 -> 1.8-10) [CRAN]

library(quantmod)

# 讀取IBM在Yahoo Finance 股票資料
getSymbols("IBM", src="google") # from google finance (Google不再提供)

getSymbols("IBM", src="yahoo") # from yahoo finance

getSymbols("IBM") # 不用加註src

head(IBM, n=3)

class(IBM)

# 讀取資料-台灣加權指數
# TWII (TSEC weighted index)
getSymbols("^TWII") # Warning message: ^TWII contains missing values.
head(TWII, n=3)
str(TWII)
dim(TWII) # 3779*6

# 刪除NA資料
TWII <- na.omit(TWII)
dim(TWII) # 3763*6

# 繪圖
chartSeries(TWII)

# 建立R環境(命名空間)
twii.env <- new.env()
getSymbols("^TWII", from="2019-1-1", env=twii.env)

twii.2019 <- twii.env$TWII
twii.1 <- get("TWII", envir=twii.env)
twii.2 <- with(twii.env, TWII)

rm(list=c("twii.1","twii.2"))

# 台積電範例
# 上市 2330.TW
# 上櫃 4506.TWO

getSymbols("2330.TW", from="2000-1-1")
`2330.TW` <- na.omit(`2330.TW`)

2330.TW   # error
`2330.TW` # OK
chartSeries(`2330.TW`)

# 資料篩選
head(`2330.TW`)

# Error: unexpected numeric constant in "head(`2330.TW`$2330."
head(`2330.TW`$2330.TW.Close)

head(`2330.TW`$`2330.TW.Close`)
tail(`2330.TW`)

dim(`2330.TW`)
names(`2330.TW`)

# 修改欄位名稱
names(`2330.TW`) <- gsub(pattern='2330.TW.', replacement = "", x =names(`2330.TW`))
names(`2330.TW`)

tw2330 <- `2330.TW`

rm(`2330.TW`)

# 選取 2021年5月 所有資料
tw2330["2021-05"]

# 範圍區隔運算子 '/': 啟始日期至2021-05-15
tw2330["/2021-05-15"]

# 範圍區隔運算子 '/': 2022-05-01至最近日期
tw2330["2022-05-01/"]

# 最近一年開始的資料
tw2330_Last_1Year <- last(tw2330,'1 year')
tw2330_Last_1Year

# 開始前2年資料
tw2330_First_2Year <- first(tw2330, '2 year')
tw2330_First_2Year
head(tw2330_First_2Year)
tail(tw2330_First_2Year)

# 繪圖
chartSeries(tw2330)
chartSeries(tw2330, theme="white")

# S&P500 index
getSymbols("^GSPC", from=as.Date("1960-01-04"))
chartSeries(last(GSPC, '2 year'))

# 中國移動
getSymbols("0941.hk")
head(`0941.HK`)
chartSeries(`0941.HK`)

# 每週 apply.week
# 每月 apply.monthly
# 每季 apply.quarterly
# 每年 apply.yearly

# 每週成交量總計
WeekVo<- apply.weekly(Vo(tw2330), sum)
head(WeekVo)

# 每週平均成交量
DayVoMean <- apply.weekly(Vo(tw2330), mean)
DayVoMean

# 每年成交量總計
YearVo <- apply.yearly(Vo(tw2330), sum)
YearVo

# 繪圖 -----
# line
# bars
# candlesticks

# 篩選2021年資料,預設黑色背景
chartSeries(tw2330,
            type="line",
            subset='2021')

# 篩選2021年,自訂白色背景
chartSeries(tw2330,
            type="line",
            subset='2021',
            theme=chartTheme('white'))

chartSeries(tw2330,
            type="bar",
            subset='2021-05::2021-06',
            theme=chartTheme('white'))

chartSeries(tw2330,
            type="candlesticks",
            subset='2021-05::2021-06',
            theme=chartTheme('white'))

# 財金技術指標 -----

# 載入 quantmod 套件,亦自動載入 TTR 套件 (Technical trading rule)

# 簡單移動平均 Simple Moving Average 

sma <- SMA(Cl(tw2330), n=20)
tail(sma, n=5)

# 繪圖,加入移動平均
chartSeries(tw2330,
            type="line",
            subset='2021-01::',
            theme=chartTheme('white'))
addSMA(n=30, col= "blue")
addSMA(n=100, col = "red")

# 指數移動平均 Exponential moving average
ema <- EMA(Cl(tw2330), n=20)
tail(ema, n=5)

chartSeries(tw2330,
            type="line",
            subset='2021-01::',
            theme=chartTheme('white'))
addEMA(n=30,on=1,col = "blue")
addEMA(n=200,on=1,col = "red")

# 布林通道 Bollinger band
# https://en.wikipedia.org/wiki/Bollinger_Bands
bb <- BBands(Cl(tw2330), sd=2)
tail(bb, n=5)

chartSeries(tw2330,
            type="line",
            subset='2021-01::',
            theme=chartTheme('white'))
addBBands(n=20,sd=2)

# tidyquant 套件 -----

# https://cran.r-project.org/web/packages/tidyquant/index.html

# 台股代碼表 -----

# 本國上市證券國際證券辨識號碼一覽表
# 下載 https://github.com/rwepa/DataDemo/blob/master/tw_stock_list.xlsx
# 資料來源 https://isin.twse.com.tw/isin/C_public.jsp?strMode=2

library(readxl)
stockcode <- read_excel("tw_stock_list.xlsx")
names(stockcode) <- c("Code", "Name", "ISINCode", "ListingDate", "Market", "Industry", "CFICode")
head(stockcode) # 1758 × 7
class(stockcode)
save(stockcode, file = "stockcode.RData")

# CTRL + SHIFT + F10
load(file = "stockcode.RData")
head(stockcode)

# 5.shiny簡介 -----

# 參考資源 https://shiny.rstudio.com/

# Shiny 參考資料-Get Started:
# http://shiny.rstudio.com/tutorial/

# 自動安裝套件 -----
usedpackages <- c("shiny", "ggplot2")

verifyPackages <- function(need.packages) {
  for (x in need.packages) {
    if (!x %in% installed.packages()[,"Package"])
      install.packages(x)
  }
}
verifyPackages(usedpackages)

# shiny 內建範例資料 -----

# shiny 安裝目錄
.libPaths()

library(shiny)

# 顯示內建11個範例
dir(paste0(.libPaths(), "/shiny/examples"))

# shiny example - 01_hello
runExample("01_hello")

runExample("02_text")

runExample("03_reactivity")

# 建立第一個shiny網頁程式 -----

# 以 "02_text"為基礎, 複製為"C:\rdata\myFirstShiny"資料夾,完成以下功能:
# 1.修改標題為　myFirstShiny 
# 2.整合 「01_hello」: sidebarInput
# 3.整合 「01_hello」: renderPlot(繪製第1個變數之直方圖)
# 4.將直方圖標題改為選取之資料集名稱

# 程式碼
# https://github.com/rwepa/DataDemo/blob/master/ai_using_python_and_r/myFirstShiny.R

# 6.shiny元件應用 -----

# 輸入控制項 -----

?selectInput

# selectInput 下拉式選單
# 如果資料有很多筆,可使用list物件

# 檔案上傳 -----

runExample("09_upload")

# 輸出控制項 - 文字/表報 -----

# render函數對照表
# *Output (ui.R)
ls("package:shiny", pattern="Output$") # 9個

# render* (server.R)
ls("package:shiny", pattern="^render") # 8個

runExample("02_text")

# 比對以下表格
# 文字: verbatimTextOutput("summary") 
# --> output$summary <- renderPrint({})

# 報表: tableOutput("view") 
# --> output$view <- renderTable({})

# 版面配置 -----

# 1.側邊佈局 Sidebar Layout
# 2.網格佈局 Grid Layout
# 3.分頁佈局 Tabsets Layout
# 4.瀏覽選單佈局 Navbar Pages
# 5.瀏覽下拉式選單佈局 Navbar Menu
# refer to materials

# 7.shiny佈署 -----

# Taiwan Stock App -----

# shiny App
# https://rwepa.shinyapps.io/shinyStockVis/

# 程式碼
# https://github.com/rwepa/DataDemo/blob/master/shinyStockVis.zip

# shiny App 佈署 -----
# 方法1: shiny server 免費版(安裝於住家/公司)
# 方法2: shiny Server Pro 付費版
# 方法3: https://www.shinyapps.io/

# 下載 Ubuntu 24.04 LTS
# https://ubuntu.com/download/desktop

# Ubuntu Install R
# https://rwepa.blogspot.com/2013/05/ubuntu-r.html
# https://cloud.r-project.org/bin/linux/ubuntu/

# 參考資料 -----

# RWEPA
# http://rwepa.blogspot.com/

# R入門資料分析與視覺化應用教學(付費)
# https://mastertalks.tw/products/r?ref=MCLEE

# R商業預測與應用(付費)
# https://mastertalks.tw/products/r-2?ref=MCLEE

# end
