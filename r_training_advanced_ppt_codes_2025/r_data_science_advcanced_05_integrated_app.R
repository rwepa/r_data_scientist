# file     : r_data_science_advcanced_05_integrated_app.R
# title    : 5.資料科學報告整合應用
# author   : Ming-Chang Lee
# date     : 2025.08.09
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 🌸 大綱 -----
# 5.1 熟悉管線操作、ggplot2與建立模型
# 5.2 熟悉rmarkdown製作Word報告
# 5.3 補充篇-openxlsx套件簡介
# 5.4 補充篇-VirtualBox + Ubuntu + R + RStudio
# 5.5 補充篇-非監督式學習-集群法(Clustering)
# 5.6 補充篇-非監督式學習-關聯規則(Association rule)

# 🌸 套件總覽 -----
# animation # 動畫
# arules    # 關聯規則
# openxlsx  # Excel 匯入/編輯/匯出

# 🌸 5.1 熟悉管線操作、ggplot2與建立模型 -----
# 參考 r_data_science_advcanced_02_dplyr.R
# 參考 r_data_science_advcanced_03_ggplot2.R
# 參考 r_data_science_advcanced_04_predictive_modelling.R
# 定訂目標 --> 初步理解資料 --> 詳細認識資料 --> 建立預測模型 --> 模型應用於新資料

# 🌸 5.2 熟悉rmarkdown製作Word報告 -----
# 參考 r_data_science_advcanced_01_datasets.pdf (P.83)

# 🌸 5.3 補充篇-openxlsx套件簡介 -----
# openxlsx 套件提供 讀取, 寫入和編輯 Excel 檔案
# 使用 Rcpp 套件增加讀寫效能, 不用安裝 Java JDK.
# https://cran.r-project.org/web/packages/openxlsx/vignettes/Introduction.html

# 寫入 Excel 檔案: write.xlsx 函數 -----

# 載入 openxlsx 套件
library(openxlsx)

# 讀取工作目錄
getwd()

# 範例1.資料框寫入 Excel 檔案 -----
write.xlsx(x = iris, file = "writeXLSX_example1_iris_write.xlsx") # 推薦使用本方法
write.xlsx(iris, file = "writeXLSX_example1_iris_write.xlsx")     # 省略參數名稱 x=
write.xlsx(x = iris, "writeXLSX_example1_iris_write.xlsx")        # 省略參數名稱 file=
write.xlsx(iris, "writeXLSX_example1_iris_write.xlsx")            # 省略所有參數名稱

# 範例2.資料框寫入 Excel 檔案-表格 -----
# 表格(Table)是一種功能強大的資料管理工具，更方便於排序, 篩選, 格式化和分析資料.
# Excel \ 插入 \ 表格
# Excel \ 表格 \ 轉換為範圍
write.xlsx(iris, file = "writeXLSX_example2_iris_write_table.xlsx", asTable = TRUE)

# 範例3.串列的多個元素寫入 Excel 檔案多個工作表, 工作表名稱為串列元素名稱 -----
mylist <- list(iris = iris, mtcars = mtcars, AirPassengers = AirPassengers)

# 每個元素之類別
sapply(mylist, class)

write.xlsx(mylist, file = "writeXLSX_example3_iris_write_list.xlsx")

# 範例4.串列的多個元素寫入 Excel 檔案,多個工作表, 多個表格 -----
write.xlsx(mylist, file = "writeXLSX_example4_iris_list_table.xlsx", asTable = TRUE)
# Error: x must be of class data.frame

# 將 AirPassengers 轉換為 data.frame
class(mylist$AirPassengers) # ts

AirPassengers_df <- data.frame(
  Day = seq.Date(from=as.Date("1949-01-01"), to=as.Date("1960-12-01"), by="month"),
  Passengers = as.numeric(AirPassengers)
)
class(AirPassengers_df)
AirPassengers_df
mylist$AirPassengers <- AirPassengers_df

# 三個元素皆為 data.frame
sapply(mylist, class)

write.xlsx(mylist, file = "writeXLSX_example4_iris_list_table.xlsx", asTable = TRUE)

# 範例5.設定儲存格-外框.色彩 -----
options(openxlsx.borderColour = "#4F80BD")

# 設定儲存格-外框.樣式
options(openxlsx.borderStyle = "thin")

# 設定儲存格-日期格式
options(openxlsx.dateFormat = "mm/dd/yyyy")

# 設定儲存格-時間格式
options(openxlsx.datetimeFormat = "yyyy-mm-dd hh:mm:ss")

# 設定數值預設值為 NULL
options(openxlsx.numFmt = NULL)

# 建立資料框
df <- data.frame(Date = Sys.Date() - 0:19, 
                 LogicalT = TRUE, 
                 Time = Sys.time() - 0:19 * 60 * 60, 
                 Cash = paste("$", 1:20), Cash2 = 31:50, 
                 hLink = "https://CRAN.R-project.org/",
                 Percentage = seq(0, 1, length.out = 20), 
                 TinyNumbers = runif(20)/1e+09, stringsAsFactors = FALSE)
df

# 自訂變數的類別(Excel \ 儲存格 \ 數值 \ 類別)
class(df$Cash) <- "currency"          # 貨幣
class(df$Cash2) <- "accounting"       # 會計專用
class(df$hLink) <- "hyperlink"        # 超連結
class(df$Percentage) <- "percentage"  # 百分比
class(df$TinyNumbers) <- "scientific" # 科學記號

str(df)

# 儲存格-數值類別
write.xlsx(df, "writeXLSX_example5_style.xlsx")

# 範例6.設定儲存格-外框.色彩-表格 ----
# 儲存格-數值類別-表格
write.xlsx(df, file = "writeXLSX_example6_style_table.xlsx", asTable = TRUE)

# 範例7.標題格式-列 -----

# 活頁簿樣式 (Workbook styles)
# 儲存格-對齊方式
hs <- createStyle(fontColour = "#ffffff", # hs: head style
                  fgFill = "#4F80BD", 
                  halign = "center",
                  valign = "center", 
                  textDecoration = "Bold", 
                  border = "TopBottomLeftRight", 
                  textRotation = 45)


# borders = "rows" - 列為格線
# headerStyle = hs - 標題格式
write.xlsx(iris, file = "writeXLSX_example7_rows_headerStyle.xlsx", borders = "rows", headerStyle = hs)

# 範例8.標題格式-行 -----
# borders = "rows" - 利為格線
# headerStyle = hs - 標題格式
write.xlsx(iris, file = "writeXLSX_example8_columns_headerStyle.xlsx", borders = "columns", headerStyle = hs)

# 範例9.標題格式-表格+自訂 -----
write.xlsx(iris, 
           file = "writeXLSX_example9_headerStyle_customerized.xlsx", 
           asTable = TRUE, headerStyle = createStyle(textRotation = 45))

# 範例10.標題格式-表格-多個工作表 -----
mylist <- list(iris = iris, colClasses = df)

write.xlsx(mylist, file = "writeXLSX_example10_columns_headerStyle.xlsx", borders = "columns", headerStyle = hs)

write.xlsx(mylist, file = "writeXLSX_example10_columns_headerStyle_table.xlsx", asTable = TRUE, tableStyle = "TableStyleLight2")

# 範例11.直接開啟外部 Excel 檔案:  openXL 函數 -----

openXL("writeXLSX_example11_columns_headerStyle.xlsx")

openXL("writeXLSX_example11_columns_headerStyle_table.xlsx")

# 範例12.編輯活頁(Workbook)物件
wb <- write.xlsx(iris, "writeXLSX_iris.xlsx")
class(wb) # Workbook
str(wb)

# 設定第1個工作表, 第1:5行, 欄寬為20
setColWidths(wb, sheet = 1, cols = 1:5, widths = 20)

# 儲存活頁簿
saveWorkbook(wb, "writeXLSX_iris.xlsx", overwrite = TRUE)

# Workbook creation walk-through
# create workbook and set default border Colour and style
require(ggplot2)

# 新增活頁簿
wb <- createWorkbook()

# 設定外框\色彩
options(openxlsx.borderColour = "#4F80BD")

# 設定外框\線條\樣式
options(openxlsx.borderStyle = "thin")

# 修改字型, 大小
modifyBaseFont(wb, fontSize = 10, fontName = "Arial Narrow")

# 新增工作表
addWorksheet(wb, sheetName = "Motor Trend Car Road Tests", gridLines = FALSE)

# 新增工作表
addWorksheet(wb, sheetName = "Iris", gridLines = FALSE)

# 檢視 \ 凍結視窗
freezePane(wb, sheet = 1, firstRow = TRUE, firstCol = TRUE)

# 將資料寫入第1個工作表
writeDataTable(wb, sheet = 1, x = mtcars, colNames = TRUE, rowNames = TRUE, tableStyle = "TableStyleLight9")

# 設定欄寬
setColWidths(wb, sheet = 1, cols = "A", widths = 18)

# 將資料寫入第2個工作表
writeDataTable(wb, sheet = 2, iris, startCol = "K", startRow = 2)

ggplot(data = iris, mapping=aes(Petal.Length, Petal.Width, color = Species)) +
  geom_point()

# 新增繪圖
insertPlot(wb, 2, xy = c("B", 16))  ## insert plot at cell B16

means <- aggregate(x = iris[, -5], by = list(iris$Species), FUN = mean)
vars <- aggregate(x = iris[, -5], by = list(iris$Species), FUN = var)

# 新增群組平均數
headSty <- createStyle(fgFill = "#DCE6F1", halign = "center", border = "TopBottomLeftRight")
writeData(wb, 2, x = "Iris dataset group means", startCol = 2, startRow = 2)
writeData(wb, 2, x = means, startCol = "B", startRow = 3, borders = "rows", headerStyle = headSty)

# 新增群組變異數
writeData(wb, 2, x = "Iris dataset group variances", startCol = 2, startRow = 9)
writeData(wb, 2, x = vars, startCol = "B", startRow = 10, borders = "columns", headerStyle = headSty)

# 設定欄寬
setColWidths(wb, 2, cols = 2:6, widths = 12)
setColWidths(wb, 2, cols = 11:15, widths = 15)

# 新增標題
s1 <- createStyle(fontSize = 14, textDecoration = c("bold", "italic"))
addStyle(wb, 2, style = s1, rows = c(2, 9), cols = c(2, 2))

# 儲存活頁簿
saveWorkbook(wb, "writeXLSX_example12_basics.xlsx", overwrite = TRUE)  ## save to working directory

# 🌸 5.4 補充篇-VirtualBox + Ubuntu + R + RStudio ----
# YouTube  (包括中文字幕...準備中)：https://youtu.be/DxZUj9quKEI
# LINK: http://rwepa.blogspot.com/2025/08/virtualbox-ubuntu-r-rstudio.html
# PDF: https://github.com/rwepa/ubuntu_r_rstudio/blob/main/virtualbox_ubuntu_r_rstudio.pdf
# 安裝指令: https://github.com/rwepa/ubuntu_r_rstudio/blob/main/virtualbox_ubuntu_r_rstudio.txt

# 🌸 5.5 補充篇-非監督式學習-集群法(Clustering) -----

# 參考資料: 商業預測與應用(付費,字幕)
# https://mastertalks.tw/products/r-2?ref=MCLEE

# 集群法(Clustering)或稱為聚類分析,集群分析(Cluster analysis)是一種物以類聚方法.
# 每個集群的相似性是以資料間的距離來判斷,分組後在同一集群組內的樣本點具有高度的相似性.
# 不同群組間的樣本點則具有高度的異質性.
# 分群屬於非監督式學習法(Unsupervised learning),即資料沒有標籤(unlabeled data).
# 無法藉由的反應變數(Response variable, Y)來做分類之訓練.
# 因為資料沒有標籤,與監督式學習法不同,非監督式學習法無法衡量演算法的正確率.

# 集群法的二大類別 -----
# 1.非階層式集群法(或切割式集群法 Partitional clustering)
# 2.階層式集群法(Hierarchical clustering)

#        --非階層式集群法 --> K平均集群法(K-means集群法)
#       |                 |
# 集群法|                 --> K-medoid集群法,使用分割環繞物件法(Patition Around Medoid, PAM)
#       |
#        --  階層式集群法 --> 凝聚階層法(agglomerative hierarchical)-由下往上
#                         |
#                         --> 分割階層法(divisive hierarchical)-由上往下

# K-Means集群法實施步驟 -----
# 1.先選定集群個數(k),或依過去實務經驗,可以選定k=2,3,4,5...
# 2.隨機給定k個資料點作為k個集群的中心(簡稱群心).
# 3.將所有資料點指派至距離最近的群心所在的集群.
# 4.重新更新k個集群的群心.
# 5.重複3–4步驟,直到所有群心沒有太大的變動(或是收斂至事先約定條件),則結束整個演算法.

# 範例1 kmeans 動態示範 -----
library(animation)

kmeans.ani(x = cbind(X1 = runif(50), X2 = runif(50)), 
           centers = 3, 
           hints = c("Move centers!", "Find cluster?"), 
           pch = 1:3, 
           col = 1:3)

# 範例2 kmeans集群法 -----
set.seed(1234)

df <- iris[,-5]

clustersize <- 3

df_kmeans <- kmeans(df, centers = clustersize)

df_kmeans # list

names(df_kmeans)
# "cluster"      資料點集群編號
# "centers"      集群中心點矩陣
# "totss"        總變異平方和 --> totss = tot.withinss + betweenss
# "withinss"     每個集群的組內變異平方和
# "tot.withinss" 所有集群組內變異平方和的總和(評估準則,愈小愈好)
# "betweenss"    所有資料點的組間變異平方和(betweenss = totss - tot.withinss)
# "size"         每個集群資料點個數
# "iter"         疊代次數
# "ifault"       整數值,演算法除錯用

mytable <- table(iris$Species, df_kmeans$cluster)

mytable # 橫列:實際值, 直行: 預測值

sum(diag(mytable))/nrow(df) # 89.3%

plot(df[3:4], col=df.kmeans$cluster, pch=16)

# 🌸 5.6 補充篇-非監督式學習-關聯規則(Association rule) -----

# 支持度(support)
# https://en.wikipedia.org/wiki/Association_rule_learning

# Apriori 演算法
# https://en.wikipedia.org/wiki/Apriori_algorithm

# arules package - 提供資料探勘中關聯規則apriori algorithm
# http://rwepa.blogspot.com/2013/01/arules-apriori-algorithm.html

# arules package -北風資料庫操作篇
# http://rwepa.blogspot.com/2013/01/arules-package.html

# 🌸 參考資料 -----

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



