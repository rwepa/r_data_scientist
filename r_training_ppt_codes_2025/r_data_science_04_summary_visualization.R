# file     : r_data_science_04_summary_visualization.R
# title    : 4.資料摘要與視覺化分析
# author   : Ming-Chang Lee
# date     : 2025.06.28
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 🌸 大綱 -----
# 4.1 使用apply, lapply與aggregate
# 4.2 使用graphics套件繪圖

# 補充篇: dplyr 資料操作套件
# 補充篇: 互動式資料表格
# 練習篇: 期末報告Rmd,PDF事宜

# 🌸 4.1 使用apply, lapply與aggregate -----

# apply, lapply: 主要應用於每列或每行的統計計算

# aggregate: 類似 Excel 樞紐分析, 可應用於多維度計算, 例: 列, 行, 公司別, 時間軸...

# 資料摘要分析包括 summary, 集中趨勢, 分散趨勢

# summary: 摘要分析主要是提供六力分析

# 集中趨勢: 
# mean      平均值
# median    中位數
# quantile  分位數 https://zh.wikipedia.org/zh-tw/分位数

# 分散趨勢:
# var       變異數 https://zh.wikipedia.org/zh-tw/方差
# sd        標準差(母體標準差,樣本標準差) ttps://zh.wikipedia.org/wiki/標準偏差
# range     全距 ttps://zh.wikipedia.org/zh-tw/全距

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

data(iris, package = "datasets")

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

# 長寬資料轉換 -----

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

# 🌸 4.2 使用graphics套件繪圖 -----

# 資料視覺化簡介 -----

# 為什麼需要視覺化?
# A:人腦不善於閱讀和分析大量資料
# A:人腦很善於閱讀和分析圖形

# 人類是視覺動物，其視覺神經系統有強大的模式識別和分析能力，視覺化是啟動這套系統的途徑
# 視覺化是一種高效的資訊壓縮和展示方法，能將大量資料快速傳輸給人的大腦
# 視覺化能探索並提煉資料，並促進新的問題的提出和解決
# 探索式資料分析是資料視覺化的重要應用
# identify properties, relationships, regularities, or patterns (性質, 關係, 規則, 樣式)

# 安斯庫姆四重奏（Anscombe's quartet) -----
# 是四組基本的統計特性一致的數據，但由它們繪製出的圖表則截然不同。每一組數據都包括了11個(x,y)點。這四組數據由統計學家弗朗西斯·安斯庫姆（Francis Anscombe）於1973年構造，他的目的是用來說明在分析數據前先繪製圖表的重要性，以及離群值對統計的影響之大。

# https://zh.wikipedia.org/wiki/安斯库姆四重奏

data(anscombe)
summary(anscombe)

# 建立迴歸模型
ff <- y ~ x

mods <- setNames(as.list(1:4), paste0("lm", 1:4))

for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  mods[[i]] <- lmi <- lm(ff, data = anscombe)
  print(anova(lmi))
}

## See how close they are (numerically!)
mods[1]            # 取出key+value
mods[1]$coef       # 回傳 NA
mods[[1]]$coef     # 正確回傳迴歸模型的係數

sapply(mods, coef) # 回傳4迴個歸模型的係數
lapply(mods, function(fm) coef((fm))) # 回傳4迴個歸模型的係數, 資料物件為list

# 繪圖
# mfrow = (列, 行)
# mar: the number of lines of margin to be specified on the four sides 圖的內邊界
# oma: outer margins in lines of text 圖的外邊界距離

op <- par(mfrow = c(2, 2), mar = 0.1 + c(4,4,1,1), oma =  c(0, 0, 2, 0))

for(i in 1:4) {
  ff[2:3] <- lapply(paste0(c("y","x"), i), as.name)
  plot(ff, data = anscombe, col = "red", pch = 21, bg = "orange", cex = 1.2,
       xlim = c(3, 19), ylim = c(3, 13))
  abline(mods[[i]], col = "blue")
}

# 圖的標題
mtext("Anscombe's 4 Regression data sets", outer = TRUE, cex = 1.5)

# 復原設定值
par(op)

# 第一個著名的視覺化 - 俄法戰爭 -----
# https://en.wikipedia.org/wiki/Charles_Joseph_Minard#/media/File:Minard.png
# 繪製者: Charles Joseph Minard, a French engineer, in 1869.
# 主題: Illustrate the number of losses suffered by Napoleon’s army during the disastrous march toward Moscow in 1812.6 - 1812.11
# 出發: 42.2萬
# 到達: 10萬
# 回國: 1萬

# 成功的資料視覺化-4大關鍵 ----
# 1.資訊 Information: 準確性, 真實性, 一致性
# 2.故事 Story: 資料視覺化的認同性
# 3.目標 Goal: 找到重要結論
# 4.視覺表現 Visual Form: 藝術的呈現
# 參考資料 https://informationisbeautiful.net/visualizations/what-makes-a-good-data-visualization/
# David McCandless , Knowledge Is Beautiful: Impossible Ideas, Invisible Patterns, Hidden Connections - Visualized, Oct 21, 2014.

# 資料視覺化流程 -----
# 步驟1.視覺化目標:資料準備, 資料理解, 資料整理
# 步驟2.視覺化繪圖結構
# 步驟3.視覺化結果

# 視覺化目標考量 -----
# 1.資料來源 (內部/外部, 免費/付費)
# 2.聽眾 vs. 觀眾
# 3.期望結果: 高層主管 vs. 基層員工
# 4.確認視範化目標
#  + 產品銷售資料分析(產品別, 部門別, 時間別)
#  + 教務研究-學生休退學預警分析(院別, 系別, 學習, 休學, 退學)
#  + 醫學研究-疾病/藥品預測分析 (類別預測, 數值預測)
#  + 製造分析-生產最佳化分析
#  + 社會經濟資料分析 (趨勢)

# 視覺化圖表 -----
# https://datavizcatalogue.com/ 

# 基本統計繪圖函數 -----

# 繪圖 {grapics}
# 1.高階繪圖(high-level plotting)：在圖形裝置(graphic device)上建立新的繪圖區。例：散佈圖、直線圖、長條圖、直方圖、圓形圖、盒鬚圖與3D繪圖。
# 2.低階繪圖(low-level plotting)： 在一個已經存在的繪圖上，加上其它圖形元素。例：額外的點、線、文字與圖例等。

methods(plot)

?plot

# 散佈圖 plot
data(Cars93, package = "MASS")
plot(Cars93$Horsepower, Cars93$Price)

# 散佈圖矩陣
data(mtcars)
pairs(mtcars[, 1:7])

# 盒鬚圖 boxplot
boxplot(Cars93$Price)

Cars93_Price <- boxplot(Cars93$Price)

Cars93_Price

# 群組盒鬚圖 OrchardSprays 果園噴霧劑 -----

boxplot(decrease ~ treatment, 
        data = OrchardSprays, 
        col = "bisque")

# 水平群組盒鬚圖 -----
boxplot(decrease ~ treatment, 
        data = OrchardSprays, 
        col = "bisque",
        horizontal=TRUE)

# 群組盒鬚圖-Y軸取log值 ------
boxplot(decrease ~ treatment, 
        data = OrchardSprays, 
        col = "bisque", 
        log = "y")

# 長條圖 barplot -----
counts <- table(mtcars$gear)

barplot(counts, 
        main="Car Distribution",
        xlab="Number of Gears",
        ylim = c(0, 20))

# 直方圖 hist -----
hist(iris$Petal.Length,
     xlab = "Petal Length",
     col = "orange",
     border = "blue",
     main = "iris-Petal.Length 直方圖")

# 直方圖優化
hist(iris$Petal.Length,
     xlab = "Petal Length",
     col = "orange",
     border = "blue",
     main = "iris-Petal.Length 直方圖",
     ylim = c(0,40))

# R的圖形輸出
# http://rwepa.blogspot.com/2013/05/r.html

data(Cars93, package = "MASS")

pdf("Cars93_xyplot.pdf")

plot(Cars93$Horsepower, Cars93$Price,
     main = "Cars93 Scatter Plot",
     xlab = "Horsepower",
     ylab = "Price",
     pch = 16,
     col = Cars93$Type)

legend("topleft", 
       legend = levels(Cars93$Type), 
       col = 1:length(levels(Cars93$Type)),
       pch = 16)

dev.off()

# 進階繪圖函數 -----

# plot – type 參數
# "p" : points
# "l" : lines
# "b" : both points and lines
# "c" : for empty points joined by lines
# "o" for overplotted points and lines
# "s" and "S" for stair steps
# "h" for histogram-like vertical lines
# "n" does not produce any points or lines (不繪圖)

# 加上點
?points
# pch = {0:18} # 1: 空心圓, 16: 實心圓

# 加上線
?lines

# lty值, 預設值 lty = 1
# 0  "blank"
# 1  "solid"
# 2  "dashed"
# 3  "dotted"
# 4  "dotdash"
# 5  "longdash"
# 6  "twodash"

# 加上區域
?polygon

# 熱繪圖 image {graphics} -----
?image

# 平行座標軸 -----
help(parcoord, package = "MASS")

# 單變數繪圖
?curve

# f(x)=x^3 + 2*x^2 - 10*x + 1
# Google -> f(x)=x^3 + 2*x^2 - 10*x + 1

curve(x^3 + 2*x^2 - 10*x + 1) # 結果怪怪的!!!

# 個案討論 -----
# GFC案例

# https://github.com/rwepa/DataDemo/blob/master/gfc.csv

urls <- "https://raw.githubusercontent.com/rwepa/DataDemo/master/gfc.csv"

gfc <- read.table(urls, head=TRUE, sep=",")

head(gfc)

str(gfc)

summary(gfc)

plot(gfc$amount, type = "l") # 結果似乎有進步的空間!!!

# 參考結果
# https://github.com/rwepa/DataDemo/blob/master/gfc_2_vis.R

# 🌸 補充篇: dplyr 資料操作套件 -----

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

# 🌸 補充篇: 互動式資料表格 -----

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

# 🌸 練習篇: 期末報告Rmd,PDF事宜 ------

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
