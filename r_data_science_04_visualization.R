# file     : r_data_science_04_visualization.R
# title    : 4.資料視覺化分析
# author   : Ming-Chang Lee
# date     : 2024.09.28
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 前次上課重點 -----
# 3.1 apply,lapply與樞紐分析
# 3.2 長寬資料轉換
# 補充篇: dplyr 資料操作套件
# 補充篇: 互動式資料表格
# 練習篇: 期末報告Rmd,PDF事宜
# 討論報告事宜
# https://github.com/rwepa/r_data_scientist/blob/main/README.md#%E6%9C%9F%E6%9C%AB%E5%A0%B1%E5%91%8A-aqi%E7%AF%84%E4%BE%8B

# 本週上課大綱 -----

# 4.1 使用graphics套件建立統計圖形
# 4.2 使用ggplot2套件建立視覺化分析

# 4.1 使用graphics套件建立統計圖形 -----

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

# 4.2 使用ggplot2套件建立視覺化分析 -----

library(ggplot2)

?diamonds

str(diamonds) # 53940*10

set.seed(168)

dsmall <- diamonds[sample(nrow(diamonds), 500),]

# ggplot: 散佈圖
p <- ggplot(data=dsmall, mapping=aes(carat, price, color=color)) + 
  geom_point(size=4)
p

# ggplot: 散點圖+線性迴歸
p <- ggplot(dsmall, aes(carat, price)) + 
  geom_point() +
  geom_smooth(method="lm", se=FALSE)
p

p <- ggplot(dsmall, aes(carat, price)) + 
  geom_point() +
  geom_smooth(method="lm", se=TRUE)
p

# ggplot: 散點圖+群組線性迴歸
ggplot(dsmall, aes(carat, price, group=color)) + 
  geom_point(aes(color=color), size=2) + 
  geom_smooth(aes(color=color), method="lm", se=FALSE)

# ggplot: 線圖
p <- ggplot(iris, aes(Petal.Length, Petal.Width, group=Species, color=Species)) +
  geom_line()
p

# ggplot: 線圖+分面 facet_wrap()
p <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  geom_line(aes(color=Species), size=1) + 
  facet_wrap(~Species, ncol=1)
p

# ggplot2 雙軸(Y1,Y2)繪圖
# http://rwepa.blogspot.com/2017/09/ggplot2-2y-packagelist.html

# ggplot2-新增數學式-以迴歸分析模型為例
# http://rwepa.blogspot.com/2020/09/ggplot2-equation.html

# [補充篇]弦圖 (Chord diagram) -----
# 參考: http://rwepa.blogspot.com/2019/10/chord-diagram.html

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
