# file     : r_data_science_05_data_science_application.R
# title    : 5.資料科學報告整合應用
# author   : Ming-Chang Lee
# date     : 2025.07.05
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 🌸 大綱 -----
# 5.1 熟悉流程控制、摘要與視覺化分析
# 5.1.1 流程控制
# 5.1.2 摘要
# 5.1.3 視覺化分析
# 5.2 熟悉rmarkdown製作Word報告
# 5.2.1 中文 Rmd,PDF
# 5.2.2 使用銷售檔案(sample-superstore2023_tw.xlsx)建立Rmd報表應用
# 5.2.3 學員報告分享

# 🌸 5.1 熟悉流程控制、摘要與視覺化分析 -----

# 🌸 5.1.1 流程控制 -----

# apply

# lapply

# lapply 配合使用 as.data.frame

# 配合使用 ifelse

# for (i in 1:nrow(df)) {
#   ...
# }

# 🌸 5.1.2 摘要 -----

# 資料結構 str 

# 資料摘要 summary

# 離散型計數 table

# 樞紐分析 aggregate

# 🌸 5.1.3 視覺化分析 -----

# 繪圖 plot {graphics}: 使用散佈圖或線圖

# 直方圖 hist {graphics}: 理解資料分佈情形

# 盒鬚圖 boxplot {graphics}: 找出異常值 (Outliers)

# 散佈圖矩陣(Scatterplot Matrices) pairs {graphics}: 多個變數同時比較2個變數之相關性

# 平行座標軸(Parallel Coordinates Plot) parcoord {MASS}: 適用於大量變數之間找出樣式 (patterns)

# 🌸 5.2 熟悉rmarkdown製作Word報告 -----

# RStudio \ File \ New File \ R Markdown

# 🌸 5.2.1 中文 Rmd,PDF -----

# YouTube：https://youtu.be/6Wc75BH02iE
# LINK: https://rwepa.blogspot.com/2024/09/rmarkdown-chinese-font-pdf.html
# 投影片: https://github.com/rwepa/DataDemo/blob/master/rmarkdown_chinese_font.pdf

# 參考以下文章提及須先執行2個步驟:
  
# 步驟1. 安裝 tinytex
# install.packages("tinytex")

# 步驟2. 安裝 TinyTeX
# tinytex::install_tinytex()

# 步驟3. 設定 .Rmd 檔案的標題 header-includes:, 本例 author 以中文輸入測試
# 參考文章: https://groups.google.com/g/taiwanruser/c/5cXK5BOmBmY/m/tGkrggijAAAJ

# 🌸 5.2.2 使用銷售檔案(sample-superstore2023_tw.xlsx)建立Rmd報表應用 -----

# 目標: 理解銷售資料分析
# 檔名: sample-superstore2023_tw.xlsx
# 來源: https://github.com/rwepa/DataDemo/blob/master/sample-superstore2023_tw.xlsx
# 說明: https://github.com/rwepa/DataDemo?tab=readme-ov-file#sample-superstore2023xlsx

# 問題:
# 1. 依區域為群組, 計算銷售額總計統計表
# 2. 依區域, 類別為群組, 計算銷售額總計統計表類別, 區域/類別銷售額總計最大前3名與最小後3名為何?
# 3. 繪製長條圖, 群組長條圖
# 4. 繪製每日/月/年銷售總額線圖

# 🌸 5.2.3 學員報告分享 -----
# 期待中...

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
