# file     : 2024.07.18-ifelse-loops.R
# title    : 程式的流程控制
# author   : Ming-Chang Lee
# date     : 2024.07.18
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----

# 1.資料物件
# 2.匯入Excel檔案
# 3.匯入單一大型檔案
# 4.匯入多個檔案
# 5.流程控制 ifelse
# 6.迴圈 for,while
# 補充篇: RFM分析

# # 討論 iris 自訂函數 ----
# 輸入iris 資料集
# 計算每列第2大數值的向量結果
# 使用 function 自訂函數

# 1.資料物件 -----

# https://github.com/rwepa/r_data_scientist/blob/main/2024.07.18-dtata-object.png
# 注意圖中有一條橫線

# 向量   vector
# 矩陣   matrix
# 陣列   array
# 資料框 data.frame
# 串列   list

# 向量是最基本的物件,包括數值向量、字元向量.
# 向量中所有資料的資料型別須相同.
# 因子是一種較特別的向量, 儲存類別型變數.
# 矩陣是二維陣列,陣列允許大於或等於2個維度.
# 矩陣與陣列的所有資料的資料型別須相同.
# 資料框、時間序列、串列均可同時存入數字與字串，但資料框與時間序列內的向量長度都相等
# 串列可包含陣列與資料框,可包括多種資料型別,函數回傳值以串列(list)物件為主
# 函數輸入值以資料框為主.

# 建立向量函數 c (concatenate) -----
# 將一群數字、字串、邏輯值結合成向量
# 將多個向量結合成向量
# 向量物件具有屬性長度 length 與型式 mode
# 向量會將所有元素將強制(coercion)轉換成單一相同型態
# 因子(factor)是一種特別的向量，用於將資料依離散型變數做成分群(group)

x <- c(1, 3, 5, 7, 9)
x

# 因子 factor - levels, labels -----
f1 <- factor(1:3)
f2 <- factor(1:3, levels=1:5)

f1
f2

f2[4] <- 5
f2[5] <- 10
f2

# factor 範例1 -----
eye.colors <- factor(c("brown", "blue", "blue", "green", "brown", "brown", "brown"))
eye.colors
levels(eye.colors)

# 問題: R的內建顏色, 657種色彩
colors()
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# factor 範例2 ------
gender <- factor(c("男", "女", "男", "男", "女"))

gender

levels(gender)

# 思考題: 如何顯示順序改為 "男" "女"

str(gender)

# 有序因子 (ordered factor) -----
# 有序因子表示有大小順序, 例: {大, 中, 小}
# 有序因子也可以用於"李克特量表"
# https://zh.wikipedia.org/zh-tw/李克特量表
# 強烈反對 (1分)
# 不同意
# 既不同意也不反對
# 同意
# 堅決同意 (5分)

ClothSize <- ordered(c("L", "H", "L", "M", "H"), 
                     levels = c("L", "M", "H"))

ClothSize

levels(ClothSize)

str(ClothSize)

# 因子轉換 -----
# as.factor 		    轉換為因子
# as.numeric()     	轉換為數值
# as.character()   	轉換為字串
# 因子內部儲存為 整數 {1, 2, 3, …}, 整數表示顏色或使用 colors()
# 使用時機- 例: 縣市別, 性別將字串轉換為因子
# 使用 cut 函數: 數值類別

# cut 函數練習
?cut

summary(iris$Sepal.Length)

cut(iris$Sepal.Length, 
    breaks = c(0, 4.3,6.4, Inf),
    labels = c("small", "middle", "large"))

# 向量 vector -----
# 類似 Excel 的一行或是一列
# 整數, 實數, 字元, 數值+字元?

# 整數
v0 <- c(1:10)
v0
class(v0)
typeof(v0)

# 實數
v1 <- c(.29, .30, .15, .89, .12)
v1
class(v1)
typeof(v1)

v1[1]
v1[2:4]
v1[1,3,5] # error
v1[c(1,3,5)]

# 字元
x2 <- c("Taiwan", "China", "USA")
x2
is.vector(x2)

# Expand the length of a vector
length(x2) <- 5
x2

# 數值+字元
# 強制(coercion)轉換成單一相同型態
v2 <- c(.29, .30, .15, .89, .12, "RWEPA")
v2
class(v2)
typeof(v2)
mean(v2)

# 思考題: 如何取得 v2 數值資料之平均值

# 向量具有 mode, length 屬性 
x1 <- vector(mode="numeric", length=1000000)

# 檢視前6筆資料
head(x1)

# 是否為向量
is.vector(x1)

# 向量具有名稱
taiwan1 <- c("正月初一", "正月初二", "正月初四", "正月初五", "正月初九", "正月十五")
names(taiwan1) <- c("春節", "回娘家", "接神日", "迎財神", "天公生", "元宵節")
taiwan1

# 矩陣 matrix -----

# 矩陣是將向量擴充至二個(或保持一個)維度。
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL)
# 預設採用直行填入資料

# 轉換為矩陣
# as.matrix(x) 

# 判斷是否為矩陣
# is.matrix(x)
as.matrix(head(iris[-5], n=4))

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

x + y   # 矩陣相加
x - y   # 矩陣相減
x %*% y # 矩陣相乘
t(x)    # 矩陣轉置 
diag(x) # 取出對角線值

?solve # 解a*x=b 聯立方程式(equation system) --> 科學運算的基礎

# 陣列 array -----

# 陣列是將矩陣擴充至3個(或以上)維度, 類似 Python: numpy.ndarray
# 陣列表示多重維度且為相同資料型態
# array(data = NA, dim = length(data), dimnames = NULL)

# 轉換為陣列
# as.array(x)

# 判斷是否為陣列
# is.array(x)

multiarray <- array(c(1:24), dim = c(3, 4, 2))
multiarray

dim(multiarray)

length(multiarray)

# 取出第1個元素的第1列
multiarray[1,,1]

# 取出第2個元素的第1列
multiarray[1,,2]

# 取出所有元素的第1列
multiarray[1,,]

# loop 逐一取出元素
for (x in multiarray){
  print(x)
}

# 檢查資料是否有在陣列之中
99 %in% multiarray

20 %in% multiarray

# 資料框 data.frame -----

# 資料框是一種重要的資料物件型態
# 一般R模型計算以資料框作為資料輸入
# 資料框是二維資料物件，每一橫列表示一個觀測值，每一直行表示一個變數，變數資料型態可能不相同，但個數相同。

# 不用輸入載入資料函數data(),亦可直接存取cars
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

# 認識 iris, 150*5 -----
iris
head(iris)
tail(iris)

# 資料結構 str
str(iris)

# 資料摘要 summary
summary(iris)

# apply: 參數1表示列
apply(iris[-5], 1, mean)

# apply: 參數2表示行
apply(iris[-5], 2, mean)

# lapply 回傳 list
lapply(iris[-5], mean)

# 實作練習 -----

# 練習a.iris {datasets} 操作
# 找出 Sepal.Length變數大於中位數的資料集
# 學員思考並練習^_^

# 練習b.Cars93 {MASS}操作,資料篩選

data(Cars93, package = "MASS") # 載入資料集
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

# 練習c.計算 Luggage.room 的平均值為何?
# 將 Luggage.room 的遺漏值以平均值填補
mean(Cars93$Luggage.room) # NA

mean(Cars93$Luggage.room, na.rm = TRUE)
sum(is.na(Cars93$Luggage.room)) # 11
Cars93$Luggage.room[is.na(Cars93$Luggage.room)] <- mean(Cars93$Luggage.room, na.rm = TRUE)
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

# 群組個數 table-2個維度
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

# 2.匯入Excel檔案 -----

# 步驟1. 載入套件

library(readxl)  # 匯入 Excel 檔案, read_excel 函數
library(writexl) # 匯出為 Excel 檔案, write_xlsx 函數

# https://cran.r-project.org/web/packages/readxl/index.html
# https://cran.r-project.org/web/packages/writexl/index.html

# 步驟2. 模擬大量Excel,CSV資料
# 模擬臺北市12個行政區, 即12個Excel檔案, 每個檔案有1個工作表
# 工作表行數為12個, 行名稱為1月,2月,...12月, 列數為5個.

nworkbooks <- 12
ncolumns <- 12
nrows <- 5
getwd()

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

# 取得所有Excel檔案的完整路徑名稱
files <- dir(getwd(), pattern="df.*\\.xlsx$", recursive=TRUE, full.names=TRUE)
files
# [1] "C:/rdata/df_1.xlsx"  "C:/rdata/df_10.xlsx" "C:/rdata/df_11.xlsx" "C:/rdata/df_12.xlsx" "C:/rdata/df_2.xlsx" 
# [6] "C:/rdata/df_3.xlsx"  "C:/rdata/df_4.xlsx"  "C:/rdata/df_5.xlsx"  "C:/rdata/df_6.xlsx"  "C:/rdata/df_7.xlsx" 
# [11] "C:/rdata/df_8.xlsx"  "C:/rdata/df_9.xlsx"

# 取得所有Excel檔案名稱
filenames <- dir(getwd(), pattern="df.*\\.xlsx$", recursive=TRUE, full.names=FALSE)
filenames
# [1] "df_1.xlsx"  "df_10.xlsx" "df_11.xlsx" "df_12.xlsx" "df_2.xlsx" 
# [6] "df_3.xlsx"  "df_4.xlsx"  "df_5.xlsx"  "df_6.xlsx"  "df_7.xlsx" 
# [11] "df_8.xlsx"  "df_9.xlsx"

# 匯入所有Excel資料並儲存為list資料物件
dflist <- lapply(files, read_excel)
names(dflist) <- filenames
dflist
class(dflist)

# 3.匯入單一大型檔案 -----

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
system.time(bigdata1 <- read.csv(file="C:/rdata/bigdata.txt", header=TRUE)) # 64.44秒

# Ctrl + Shift + F10: 重新啟動R
library(data.table)
# https://cran.r-project.org/web/packages/data.table/index.html

system.time(movies <- fread("C:/rdata/bigdata.txt")) # 0.55秒, 64.44/0.55=117倍時間差異

dim(movies) # 23000000*5
class(movies) # "data.table" "data.frame"
summary(movies)

# 4.匯入多個檔案 -----

# 方法 1. 使用 lapply-匯入CSV檔案

# getwd() 可以修改為實際工作目錄
# pattern 可以使用"正規表示式". 輸入 ?regex 查詢線上說明.

files <- dir(getwd(), pattern="df.*\\.csv$", recursive=TRUE, full.names=TRUE)
files
tables <- lapply(files, read.csv, sep=",") # list
mydf1 <- do.call(rbind, tables) # data.frame
mydf1

# 方法 2. 使用 for loop-將匯入資料合併為資料框

mydf <- data.frame() # 建立空白資料框

for (x in files) {
  x <- read.csv(file=x, sep=",")
  print(x)
  mydf <- rbind(mydf, x)
}

str(mydf) # 60*12

# 參考資料: https://github.com/rwepa/DataDemo/blob/master/ai_using_python_and_r/ai_using_python_and_r_part2_r.R#L1534


# 5.流程控制 ifelse -----

# if 流程控制

?if # ERROR, 出現+

# unexpected token '?', expected 'LPAREN', LPAREN: Left PARENthesis 左括號

?"if" # OK

?`if` # OK

# if 用法1 -----

# if (條件式) {
#   表示式
# }

# if 範例1 -----
x <- 6

if (x > 0) {
  print("正數")
}

# if 用法2 -----

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

# ifelse 用法 -----
x <- c(1, 3, NA, 5, NA)
ifelse(is.na(x), 999, x)

# switch 函數 -----
centre <- function(x, type) {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = 0.1))
}

(x <- rt(n=10, df=1)) # 隨機抽樣10個樣本,其自由度為1的t分配

# 6.迴圈 for,while -----

# for 迴圈 -----
(mydata <- c("R", "ggplot2", "shiny", "zoo", "leaflet"))

for (i in mydata) {
  print(nchar(i))
}

# while 迴圈 -----

i <- 1
while (i <= length(mydata)) {
  print(paste0("字串 ", mydata[i], " 的長度為: ", nchar(mydata[i])))
  i <- i + 1
}

# 補充篇: RFM分析 -----

# RFM是一種用於分析客戶價值的方法 
# 常用於銷售資料庫,零售和服務分析之中,包括3項重要的指標:
# 1.R 最近消費(Recency)   - 日期天數
# 2.F 消費頻率(Frequency) - 發生次數
# 3.M 消費金額(Monetary)  - 總消費金額(元)

# R 最近消費 -----

# 客戶最近購買與上次購買的時間差.
# 例: 將最近購買日期分為4個等級,編碼等級越高的客戶,表示最近購買比率較高
# 最近購買日期的前25%,R編碼為4
# 50%-75%,R編碼為3
# 25%~50%,R編碼為2
# %25以下,R編碼為1

# 最近消費日期很小  ......        # 最近消費日期很大
# 0 ..[4].. 25% ..[3].. 50% ..[2].. 75% ..[1].. 100%

# F 消費頻率 -----

# 客戶在一定期間內購買產品的次數.
# 編碼等級越大的客戶,其消費頻率越高,忠誠度與顧客價值也越高.
# 同理購買次數最多的前25%,編碼為4,其他依序為3,2,1

# M 消費金額 -----

# 客戶在一定期間內購買產品的總金額.
# 編碼等級越高的客戶,其消費金額越高,顧客價值也越高.
# 同理消費金額最多的前25%,編碼為4, 其他依序為3,2,1

# 1.了解企業的銷售統計分析.
# 2.有效的運用行銷預算,進行最佳銷售產品分析.
# 3.對不同的客群給予不同的優惠,進行客製化行銷.
# 4.增加顧客生命週期,培養每一位顧客成為貴客(新客-->常客-->貴客).

library(readxl) # 讀取 Excel 檔案
# 參考 R入門資料分析與視覺化應用 3-12 將R資料匯出為CSV/Excel檔案

library(dplyr) # 資料處理文法
# 參考 R入門資料分析與視覺化應用 3-11使用dplyr套件,加速資料處理

library(ggplot2) # 繪圖文法
# 參考 R入門資料分析與視覺化應用 4-3 圖形文法繪圖ggplot2套件

# 匯入銷售資料
# 資料來源 http://archive.ics.uci.edu/ml/datasets/online+retail
# 資料下載: https://github.com/rwepa/DataDemo/blob/master/OnlineRetail.xlsx 

# 欄位說明
# InvoiceNo   發票編號
# StockCode   產品編號
# Description 產品說明
# Quantity    數量
# InvoiceDate 發票日期
# UnitPrice   單價
# CustomerID  客戶編號
# Country     客戶居住國家

sale <- read_excel("OnlineRetail.xlsx") # 541909*8(約54萬筆)

# 資料結構
str(sale)

# 資料摘要
summary(sale)

# 資料處理
# Quantity 有負數
# UnitPrice 有負數
# CustomerID 有NA

sale <- sale %>%
  mutate(Quantity = replace(Quantity, Quantity <= 0, NA),
         UnitPrice = replace(UnitPrice, UnitPrice <= 0, NA))

sale <- sale %>% na.omit(sale) # 397884*8

# 將字元向量轉換成因子(factor)向量
sale <- sale %>%
  mutate(InvoiceNo = as.factor(InvoiceNo),
         StockCode = as.factor(StockCode),
         InvoiceDate = as.Date(InvoiceDate, "%m/%d/%Y"),
         CustomerID = as.factor(CustomerID), 
         Country = as.factor(Country))

# 新增 商品銷售總金額 GMV (Gross Merchandise Volume) 欄位
sale <- sale %>%
  mutate(GMV = Quantity*UnitPrice) # 397884*9

# 篩選欄資料並新增 df_customer 物件 397884*3
df_customer <- sale %>%
  select(CustomerID, InvoiceDate, GMV)

# 前三大商品銷售總金額國家{英國,荷蘭,愛爾蘭}
sale %>%
  group_by(Country) %>%
  summarise(totalGMV = sum(GMV)) %>%
  arrange(desc(totalGMV)) %>%
  print(n = 3)

# 依國家別,由大至小排序繪製商品銷售總金額
totalGMV <- sale %>%
  group_by(Country) %>%
  summarise(totalGMV = round(sum(GMV))) %>%
  arrange(desc(totalGMV)) %>%
  print(n = Inf)

# 除了 United Kingdom 以外, 依國家別,繪製前10大國家之商品銷售總金額
totalGMV %>%
  slice(2:11) %>%
  ggplot(aes(x=reorder(Country, totalGMV), y=totalGMV)) +
  geom_bar(stat="identity", fill="darkgray") +
  coord_flip() +
  geom_text(aes(label=totalGMV)) +
  labs(title = "前10大國家之商品銷售總金額統計圖", x = "國家", y = "銷售總金額") +
  theme(plot.title = element_text(hjust = 0.5))

# RFM Analysis

analysis_date <- as.Date("2020/03/25")

df_RFM <- sale %>% 
  group_by(CustomerID) %>% 
  summarise(recency = as.numeric(analysis_date - max(InvoiceDate)),
            frequency = n_distinct(InvoiceNo),
            monetary = sum(GMV)) # 4338*4

summary(df_RFM)

# 建立 RFM分析

# R_分數
# 最近消費百分位數(25%, 50%, 75%),將資料分成4個區間.
# 數值愈小,表示最近消費愈佳,編碼為4
# 0% --- 25% --- 50% --- 75% --- 100%
# 編碼 4      3       2       1

df_RFM$R_Score <- NA
df_RFM$R_Score[df_RFM$recency >= quantile(df_RFM$recency, probs=0.75)] <- 1 # 日期愈遠,編碼愈小

df_RFM$R_Score[df_RFM$recency >= quantile(df_RFM$recency, probs=0.50) & 
                 df_RFM$recency < quantile(df_RFM$recency, probs=0.75)] <- 2

df_RFM$R_Score[df_RFM$recency >= quantile(df_RFM$recency, probs=0.25) & 
                 df_RFM$recency < quantile(df_RFM$recency, probs=0.50)] <- 3

df_RFM$R_Score[df_RFM$recency < quantile(df_RFM$recency, probs=0.25)] <- 4

# F_分數
# 消費頻率百分位數(25%, 50%, 75%),將資料分成4個區間.
# 數值愈小,表示消費頻率較少,編碼為1
# 0% --- 25% --- 50% --- 75% --- 100%
# 編碼 1      2       3       4
df_RFM$F_Score <- NA
df_RFM$F_Score[df_RFM$frequency >= quantile(df_RFM$frequency, probs=0.75)] <- 4

df_RFM$F_Score[df_RFM$frequency >= quantile(df_RFM$frequency, probs=0.50) & 
                 df_RFM$frequency < quantile(df_RFM$frequency, probs=0.75)] <- 3

df_RFM$F_Score[df_RFM$frequency >= quantile(df_RFM$frequency, probs=0.25) & 
                 df_RFM$frequency < quantile(df_RFM$frequency, probs=0.50)] <- 2

df_RFM$F_Score[df_RFM$frequency < quantile(df_RFM$frequency, probs=0.25)] <- 1

df_RFM

# 同理 M_分數
# end
