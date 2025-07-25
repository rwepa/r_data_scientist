# file     : r_data_science_02_r_object.R
# title    : 2. 資料物件
# author   : Ming-Chang Lee
# date     : 2025.06.14
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----

# 2.1 資料物件簡介
# 2.2 向量
# 2.3 因子
# 2.4 矩陣
# 2.5 資料框
# 2.6 串列
# 2.7 時間序列 (ts)
# 2.8 補充篇: Excel檔案匯入與匯出
# 2.9 補充篇: 大型檔案的匯入
# 2.10 補充篇: 大量檔案的匯入

# 🍎 2.1 資料物件簡介 -----

# RStudio 支援專案資料夾功能, File \ New Project \ New Directory ...
# 專案資料夾會建立 "XXX.Rproj" 檔案
# 開啟專案方法: 直接開啟 "XXX.Rproj", 畫面右上角會顯示"專案名稱"

# 資料物件 -----
# https://github.com/rwepa/r_data_scientist/blob/main/imgs/2024.07.18-dtata-object.png
# 資料物件包括向量,因子,矩陣,陣列,資料框,串列與時間序列.

# 資料物件名稱命名方式採用中, 英文皆可以, 建議使用英文為主.
# 不可以使用數字開頭.
# 如果使用R的保留字, 則在字尾處可加上 s 即可避免與保留字相同. 例: cms
# 函數輸入的參數大部分是資料框(data.frame).
# 統計計算結果大部分是串列(list).

# 🍎 2.2 向量 (vector) -----

# 向量是最基本的物件, 可以使用 c() 建立
# ":"表示連續範圍, 例: c(1:10), 亦可使用 1:10 表示.
# ","表示不連續範圍. 例: c(1, 2, 3, 5, 8)
# 向量類似 Excel 的一個直行資料.
# 向量包括整數,數值,複數,字串,邏輯值,日期等.
# 向量中所有資料型別須相同, 例: 一個向量的資料型態須同為整數或數值或字串,不可以混合使用.
# 例: 資料如果包括數值與字串資料型態, R會進行隱含式轉換(Implicit conversion).
# 隱含式轉換會將混合的資料型態轉換為為相容性較高的資料型態.
# 數值與字串全部轉為字串.

# 向量是1個維度, 向量擴充成2個維度為矩陣, 擴充成3個以上的維度是陣列.

# plot繪圖顏色col參數設定為整數型態的向量

plot(x=1:16, y=1:16, 
     col=1:16, 
     pch=16, 
     cex=3, 
     main="col=1:8 整數型態應用", 
     xlab='', 
     ylab='')
text(1:16, labels=1:8, col='white')

# 使用plot函數的col=1:8設定,分別表示黑,紅,綠,藍,青,紫,黃與灰.
# 如果數字大於8,則顏色會重複使用.
# pch表示繪圖的符號,16表示實心圓形.
# cex為設定文字的大小,預設值為1,大於1表示放大,小於1表示縮小.

# 657個顏色 -----
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
colors()

# 建立向量函數 c (concatenate) -----
x <- c(1, 3, 5, 7, 9)
x
class(x) # "numeric"

x <- seq(from=100, to=140, 3)
x

# 整數向量 -----
v0 <- c(1:10)
v0
class(v0) # integer
typeof(v0)

# 實數向量 -----
v1 <- c(.29, .30, .15, .89, 0.12)
v1
class(v1)
typeof(v1) # double

v1[1]
v1[2:4]
v1[1,3,5] # error
v1[c(1,3,5)]

# 字元向量 -----
x2 <- c("Taiwan", "China", "USA")
x2
is.vector(x2)

# Expand the length of a vector
length(x2) <- 5
x2

# 數值+字元向量 -----
# 強制(coercion)轉換成相容性較高的單一相同資料型態.
v2 <- c(.29, .30, .15, .89, .12, "RWEPA")
v2
class(v2)
typeof(v2)
mean(v2)

# 轉換為數值資料
as.numeric(v2)

# 如何取得數值資料之平均值
mean(as.numeric(v2))
mean(as.numeric(v2), na.rm=TRUE)

# 向量具有 mode, length 屬性 
x1 <- vector(mode="numeric", length=1000000)

# 檢視前6筆資料
head(x1)

# 檢視前3筆資料
head(x1, n=3)

# 判斷是否為向量
is.vector(x1)

# 字串向量
taiwan1 <- c("正月初一", "正月初二", "正月初四", "正月初五", "正月初九", "正月十五")
names(taiwan1) <- c("春節", "回娘家", "接神日", "迎財神", "天公生", "元宵節")
taiwan1

# 顯示所有物件清單
ls()

# 顯示 datasets 套件的所有資料集 -----
data(package="datasets")

#汽車道路測試資料集 -----
mtcars

# 線上說明
?mtcars

# 以下程式不執行,亦可直接使用 datasets 套件
data(mtcars, package="datasets")

# 載入套件清單
# 預設R啟動後會自動載入 datasets 套件
search()

# str資料結構
str(mtcars)

# summary資料摘要,本範例所有變數皆為數值資料,且沒有NA遺漏值
summary(mtcars)
# Min.		: Minimum 最小值
# 1st Qu.	: First quartile 或25百分位數或第一四分位數 Q_1
# Median	: Second quartile 中位數或50百分位數或第二四分位數 Q_2
# Mean	  : 平均值
# 3rd Qu.	: Third quartile 或75百分位數或第三四分位數 Q_3
# Max.    : Maximum 最大值

# 取出直行向量,即某一欄位,某一變數
# 資料物件$欄位名稱

# 方法1 結果為向量,建議採用方法1之向量物件.
mtcars$mpg

# 方法2 結果為資料框
mtcars['mpg']

# 方法3 結果為向量
mtcars[, c('mpg')]

# 方法4 使用指標題(index)結果為向量
mtcars[,1]

class(mtcars$mpg)  # numeric
typeof(mtcars$mpg) # double

#讀取向量元素 (mtcars) -----
mtcars_mpg <- mtcars$mpg
mtcars_mpg
mtcars_mpg[1] # 第1筆資料
mtcars_mpg_number <- length(mtcars_mpg)
mtcars_mpg[mtcars_mpg_number] # 最後1筆資料

# 🌸 R指標使用-1表示刪除, Python指標-1表示最後一筆 -----

mtcars_mpg[0] # 指標須從1開始
mtcars_mpg[33] # 資料最多為32筆,第33筆無資料,回傳NA
mtcars_mpg[1:6] # 篩選第1至6筆
head(mtcars_mpg) # 顯示前6筆,結果與上述相同

# 篩選倒數第6筆至最後1筆
mtcars_mpg[(mtcars_mpg_number-5):mtcars_mpg_number]

# 顯示最後6筆,結果與上述相同
tail(mtcars_mpg)

mtcars_mpg[c(1,3,5,8:10)] # 使用逗號選取不連續範圍
mtcars_mpg[-c(3:6)]       # 使用負號表示NOT,即刪除範圍
mtcars_mpg[c(30:32)]      # 使用冒號選取

# 向量常用函數 -----
# c	      # 建立向量
# min	    # 最小值
# max	    # 最大值
# abs	    # 絕對值
# sqrt	  # 根號
# round	  # 四捨五入
# ^	      # 次方,線上查詢?'^',查詢時左右二邊須加上單引號或雙引號
# %%	    # 餘數,線上查詢?'%%'
# %/%	    # 商數,線上查詢?'%/%'
# log	    # 以 e 為底的對數,即自然對數
# log10	  # 以 10 為底的對數
# log2	  # 以 2 為底的對數
# exp	    # 自然指數
# sin	    # 正弦函數,?sin參考其他三角函數

# mean	  # 平均值
# median	# 中位數
# var	    # 變異數
# sd	    # 標準差
# diff	  # 二個元素相減
# sort	  # 排序
# order	  # 排序的指標順序
# sum	    # 加總
# prod	  # 相乘
# cumsum  # 累積加總
# cumprod # 累積相乘
# which	  # 邏輯值為TRUE的指標
# any	    # 任何一個元素符合條件,其結果為TRUE
# all	    # 所有元素符合條件,其結果為TRUE

pi        # 3.141593
NaN       # 不是一個數值 (Not a Number)
Inf       # 無窮大 (infinity)
-Inf      # 負無窮大
.Machine  # 電腦數值的界限
letters   # 小寫英文字母
LETTERS   # 大寫英文字母
month.abb  # 英文月份縮寫
month.name # 英文月份

# 🌸 實作練習 -----
# Cars93 {MASS}
# 找出 Luggage.room 變數大於該欄位平均數的資料筆數?
# Analysis:

# 🍎 2.3 因子(factor) -----

# 因子是一種較特別的向量, 因子主要功能是儲存字元向量, R內部以整數1,2,3,...表示
# 因子可以視為類別型變數.

# 例: 銷售資料中的地區別欄位包括北部地區,中部地區,南部地區,東部地區以及離島地區.
# 上述R的內部儲存方式如下:
# 北部地區 整數1
# 中部地區 整數2
# 南部地區 整數3
# 東部地區 整數4
# 離島地區 整數5

# 因子 factor - levels, labels -----
f1 <- factor(1:3)
f2 <- factor(1:3, levels=1:5)

f1
f2

f2[4] <- 5
f2[5] <- 10
f2

# factor with levels -----
eyeColors <- factor(c("brown", "blue", "blue", "green", "brown", "brown", "brown"))
eyeColors
levels(eyeColors)
str(eyeColors)

# Factor w/ 3 levels "blue","brown",..: 2 1 1 3 2 2 2
# R內部使用整數表示因子, 加速電腦執行.
# w/ 表示 with

gender <- factor(c("男", "女", "男", "男", "女"))
gender
levels(gender)
str(gender)

# 有序因子 (ordered factor) -----
# 適用時機: 有限類別型變數
# 例: 李克特量表 (Likert scale)
# 李克特五點選項 (1強烈反對 2不同意 3既不同意也不反對 4同意 5堅決同意)

ClothSize <- ordered(c("L", "H", "L", "M", "H"), 
                     levels = c("L", "M", "H"))
ClothSize
levels(ClothSize)
str(ClothSize)

# 因子轉換 -----
# as.factor() 		  轉換為因子
# as.numeric()     	轉換為數值
# as.character()   	轉換為字串

# 🌸 實作練習 -----
# iris {datasets}
# iris 資料集
# 安德森鳶尾花卉資料集(Anderson's Iris data set), 鳶尾花卉資料集(Iris flower data set), 
# 或費雪鳶尾花卉資料集(Fisher's Iris data set)是一種多重變數分析的資料集.
# 最初是埃德加·安德森從加拿大加斯帕半島的鳶尾屬花朵中提取的形態學變異資料.
# 後由羅納德·費雪(Ronald Aylmer Fisher)作為判別分析的一個例子,運用到統計學中.
# https://zh.wikipedia.org/zh-tw/安德森鸢尾花卉数据集

?iris

# 將數值變數轉換為類別型變數 --> 群組功能
# 將 ris$Sepal.Length 區分為三個區間 (min, Q1], (Q1, Q3], (Q3, max]
# 三個區間的標籤為 {"small", "middle", "large"}
# Analysis:
?cut

# 🌸 實作練習 -----
# 開啟適當的 open data, 練習 cut 函數.
# https://data.gov.tw/
# Analysis:

# 🍎 2.4 矩陣 (matrix) -----

# 矩陣是二維陣列.
# 矩陣所有資料的資料型別須相同, 不可以混合使用.
# 考慮線性代數的一個 m×n 矩陣是由m列與n行所形成, 可以使用 matrix() 建立.
# 考慮線性代數的一個 n×n 方陣(Square matrix)是由n列與n行所形成, 可以使用 matrix() 建立.
# 矩陣與方陣在R中皆以矩陣(matrix)方式儲存.
# 將資料填入至矩陣資料物件時,預設採用直行方式由上至下,由左至右方式儲存

# 預設採用直行填入資料
x <- matrix(c(1:4), ncol = 2)
x
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4

# 使用 byrow = TRUE 改為橫列填入
x <- matrix(c(1:4), ncol = 2, byrow = TRUE)
x
# [,1] [,2]
# [1,]    1    2
# [2,]    3    4

# 矩陣運算
is.matrix(x)
as.matrix(head(iris[-5], n=4))

y <- matrix(c(4:1), ncol = 2)
y

x + y
x - y
x %*% y # 矩陣相乘
t(x)    # 矩陣轉置(Transpose)
diag(x) # 對角線矩陣的值

?solve # 解a*x=b,計算x值

# 陣列 (array) -----

# 陣列(Array)是矩陣的維度擴充,矩陣最多是2個維度,陣列允許大於或等於2個維度.
# 陣列資料物件所有元素的資料型態須相同,即所有資料皆為數字,字串與邏輯值,不可以混合使用,此特性與向量及矩陣相同.

# 建立陣列的函數為array(data = NA, dim = length(data), dimnames = NULL)
# data參數為輸入資料,預設的維度等於資料的長度.
# dimnames參數可以設定各維度的名稱.

# as.array函數為轉換為陣列.
# is.array函數可判斷物件是否為陣列.


a1 <- array(LETTERS)
a1
dim(a1)      # 26
class(a1)    # array
is.array(a1) # TRUE

a2 <- array(data=c(1:3), dim=c(2,3,2))
a2
# , , 1
# 
# [,1] [,2] [,3]
# [1,]    1    3    2
# [2,]    2    1    3
# 
# , , 2
# 
# [,1] [,2] [,3]
# [1,]    1    3    2
# [2,]    2    1    3

# 預設data會採用直行且循環填滿
# c(2,4,3) 2列,4行,3個元素
a3 <- array(data=c(1:24), dim=c(2,4,3))
a3
# , , 1
# 
# [,1] [,2] [,3] [,4]
# [1,]    1    3    5    7
# [2,]    2    4    6    8
# 
# , , 2
# 
# [,1] [,2] [,3] [,4]
# [1,]    9   11   13   15
# [2,]   10   12   14   16
# 
# , , 3
# 
# [,1] [,2] [,3] [,4]
# [1,]   17   19   21   23
# [2,]   18   20   22   24

dim(a3)
# [1] 2 4 3

# 篩選第1個元素
a3[,,1]

# 篩選前2列,前3行,第1,3元素
a3[1:2, 1:3, c(1,3)]
# , , 1
# 
# [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
# 
# , , 2
# 
# [,1] [,2] [,3]
# [1,]   17   19   21
# [2,]   18   20   22

# 🍎 2.5 資料框 (data.frame) -----

# cars 資料集 -----
# 不用輸入載入資料函數data,亦可直接存取cars
data(cars, package = "datasets")

?cars
help(cars)
head(cars, n=3)
#   speed dist
# 1     4    2
# 2     4   10
# 3     7    4

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

# 🌸 實作練習 -----
# iris {datasets}
# 找出 Sepal.Length變數大於中位數的資料集
# 學員思考並練習^_^

# 🌸 實作練習 -----
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

# 🍎 2.6 串列 (list) -----

# R建立模型函數回傳值大部分以串列資料物件為主,例：建立線性模型lm函數之回傳值為串列.

# list建立串列
mylist <- list(head(month.abb, n=3), matrix(c(1:6), ncol=3), head(cars))
mylist
class(mylist)
str(mylist) # List of 3
length(mylist) # 3

# 使用指標篩選元素

mylist[1] # 鍵與值
# [[1]]
# [1] "Jan" "Feb" "Mar"

mylist[[1]] # 只有值

# 元素的長度
length(mylist[[1]]) # 3
length(mylist[[2]]) # 6
length(mylist[[3]]) # 2

# 元素的鍵與值
mylist[2]
mylist[[2]]
mylist[2] + 10   # Error
mylist[[2]] + 10 # OK

# list元素名稱
names(mylist) # NULL表示沒有元素名稱
names(mylist) <- c("Month", "Data", "Cars")
mylist # 包括元素名稱

# 使用名稱篩選元素的值
mylist$Month
# [1] "Jan" "Feb" "Mar"

mylist$Data
#      [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

mylist$Cars
#   speed dist
# 1     4    2
# 2     4   10
# 3     7    4
# 4     7   22
# 5     8   16
# 6     9   10

# 判斷是否相等
identical(mylist$Data, mylist[[2]]) # TRUE

# 統計運算函數回傳 list -----
?women
women # 15*2
womenLinerModel <- lm(weight ~ height, data=women) # y~x1+x2+x3+...
class(womenLinerModel) # lm
str(womenLinerModel) # List of 12
womenLinerModel$coefficients
# weight = -87.51667 + 3.45000*height

# 🍎 2.7 時間序列 (ts) -----

# 時間序列是一組按照時間發生先後順序進行排列的資料序列.
# 通常一組時間序列的時間間隔為一固定值.
# 例: 國內生產毛額(GDP), 消費者物價指數(CPI), 加權股價指數, 利率, 匯率與每日溫度等.

# 建立時間序列的語法為ts函數
?ts
# data為輸入的觀測值.
# start為啟始時間單位,可以使用整數或實數,實數表示frequency所佔的比例.
# end為結束時間單位, 一般參數end不用輸入,ts函數會自行計算.
# frequency為整數數值, 表示一年內發生頻率,  1為年單位, 4為季單位, 12為月單位.
# deltat為frequency的倒數.

# as.ts 函數: 將物件轉換為時間序列.
# is.ts 函數: 判斷是否為時間序列, 結果為TRUE或FALSE.

# 實務應用時, 可採用 zoo 與 xts 等套件進行時間序列操作.
# 參考: R 入門資料分析與視覺化應用-2-8 好用的日期時間資料處理zoo, xts套件
# https://mastertalks.tw/products/r?ref=MCLEE

# ts 範例 -----
set.seed(168)
x <- matrix(rnorm(300), 100, 3, dimnames=list(NULL, c("Stock1", "Stock2", "Stock3")))
invest <- ts(x, start = c(2005, 1), frequency = 12)
class(invest)
# [1] "mts" "ts" "matrix"

head(invest, n=3)
#          Stock1    Stock2     Stock3
# [1,] -0.5237601 1.6010045 -0.2243593
# [2,]  0.3884328 0.4373063 -1.1558917
# [3,]  0.8771446 0.9600000 -0.0145320

start(invest)
# [1] 2005    1

end(invest)
# [1] 2013    4

plot(invest)

# 🍎 2.8 補充篇: Excel檔案匯入與匯出 -----

# XLConnect 套件 -----

# 使用 XLConnect 套件須先安裝Java JDK或JRE

# 在Google搜尋畫面輸入「java jdk」,選取第一個搜尋結果
# JDK Development Kit 22.0.2 downloads --> x64 Installer
# https://download.oracle.com/java/22/latest/jdk-22_windows-x64_bin.exe

# 系統變數 JAVA_HOME 設定: C:\Program Files\Java\jdk-24
# 系統變數 Path      設定: %JAVA_HOME%\bin

# 參考線上說明
vignette("XLConnect")

# openxlsx 套件 -----
# read.xlsx {openxlsx}

# 下載: gfc.xlsx
# https://github.com/rwepa/DataDemo/blob/master/gfc.xlsx

library(openxlsx)

myfile <- "gfc.xlsx"

df <- read.xlsx(xlsxFile = myfile, sheet = 1, skipEmptyRows = FALSE)
df

?read.xlsx
# xlsxFile      : Excel檔案名稱
# sheet         : 工作表名稱或整數值編號.
# skipEmptyRows : 省略空白列, 預設值為TRUE.
# 本例設定 skipEmptyRows = FALSE 表示空白列亦會匯入, 且匯入為NA表示.

head(df, n=3)

# openxlsx 套件之Excel匯出 -----
# write.xlsx {openxlsx}

mydf <- head(iris)

# 方法1.匯出資料框(data.frame)至Excel單一工作表
write.xlsx(x = mydf, file = "writeXLSX1.xlsx", sheetName="irisHead")

# 方法2.匯出資料框(data.frame)至Excel單一工作表-表格功能
write.xlsx(x = mydf, file = "writeXLSXTable1.xlsx", sheetName="irisHead", asTable = TRUE)

# 方法3.匯出串列(list)至Excel多個工作表
mylist <- list(data1 = iris, data2 = mtcars, data3=faithful)

write.xlsx(x = mylist, file = "writeXLSX2_list.xlsx")

# 方法4.匯出串列(list)至Excel多個工作表-表格功能
write.xlsx(x = mylist, file = "writeXLSXTable2.xlsx", asTable = TRUE)

# 方法5. 新增圖形至工作表
wb <- createWorkbook()

# 新增資料至工作表
addWorksheet(wb, sheetName = "waiting_data", gridLines = FALSE)
writeDataTable(wb, sheet = 1, 
               x = faithful,
               colNames = TRUE, 
               rowNames = FALSE,
               tableStyle = "TableStyleLight9")

# 新增繪圖至工作表
hist(faithful$waiting)
addWorksheet(wb, sheetName = "waiting_histogram", gridLines = FALSE)
insertPlot(wb, sheet = 2, xy = c("B", 2))
saveWorkbook(wb, "waiting_histogram.xlsx", overwrite = TRUE)

# readxl 套件 -----
# https://cran.r-project.org/web/packages/readxl/index.html

# 🍎 2.9 補充篇: 大型檔案的匯入 -----

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
write.table(mydata, file="bigdata.txt", sep=",", row.names=FALSE, col.names=TRUE) # 需一些時間 
# 2300萬*5, 491MB

# Ctrl + Shift + F10: 重新啟動R
system.time(bigdata1 <- read.csv(file="bigdata.txt", header=TRUE)) # 31.24秒

# Ctrl + Shift + F10: 重新啟動R
library(data.table)
# https://cran.r-project.org/web/packages/data.table/index.html

system.time(movies <- fread("bigdata.txt")) # 0.31秒, 31.24/0.31 = 100.7742倍時間差異

dim(movies) # 23000000*5
class(movies) # "data.table" "data.frame"
summary(movies)

# 🍎 2.10 補充篇: 大量檔案的匯入 -----

getwd()

sample1 <- iris[sample(1:nrow(iris),10),]
sample2 <- iris[sample(1:nrow(iris),10),]
sample3 <- iris[sample(1:nrow(iris),10),]

# 模擬三個匯出檔案
write.table(sample1, file="sample1.csv", sep=",", row.names=FALSE)
write.table(sample2, file="sample2.csv", sep=",", row.names=FALSE)
write.table(sample3, file="sample3.csv", sep=",", row.names=FALSE)

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
