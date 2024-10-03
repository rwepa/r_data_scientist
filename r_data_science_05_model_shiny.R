# file     : r_data_science_05_model_shiny.R
# title    : 5.預測模型整合案例
# author   : Ming-Chang Lee
# date     : 2024.10.05
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 前次上課重點 -----
# 4.1 使用graphics套件建立統計圖形
# 4.2 使用ggplot2套件建立視覺化分析

# 本週上課大綱 -----
# 5.1 銷售與人力資源預測模型
# 5.2 shiny互動式App佈署應用
# 補充篇: 期末報告討論

# 5.1 銷售與人力資源預測模型 -----

# 銷售模型 -----

# 🌸RWEPA | shiny企業實務應用 第4集-shiny銷售儀表板
# LINK: https://rwepa.blogspot.com/2023/02/r-shiny-04-sales-project.html
# YouTube:[27'06] https://youtu.be/4GgZlf8heQk
# shiny: https://rwepa.shinyapps.io/shinySalesDashboard/
# Slide: https://rwepa.quarto.pub/r-shiny-04-sales-project/

# 下載 R程式碼並練習執行:
# 1.包括 app.R 與 data 資料夾

# 2.整體儲存於 r-shiny-04-sales-project 資料夾
# Code: https://github.com/rwepa/business_analytics/tree/main/r-shiny-04-sales-project/r-code

# 3.開啟 app.R -> 按 [Run App]

# 4.理解 app.R 程式架構 (ui and server)

# 人力資源預測模型 -----

# 🌸RWEPA | shiny企業實務應用 第6集-小明算命師(下)第1季完結篇
# LINK: https://rwepa.blogspot.com/2023/03/r-shiny-06-hr-teller.html
# YouTube: [24'55] https://youtu.be/rrD6KV3eV-w

# 下載 R程式碼並練習執行:
# 1.包括 app.R 與 data, images 資料夾

# 2.整體儲存於 r-shiny-06-hr-teller 資料夾
# Code: https://github.com/rwepa/business_analytics/tree/main/r-shiny-06-hr-teller/r-code

# 3.開啟 app.R -> 按 [Run App]

# 4.理解 app.R 程式架構, 包括以下四大內容:
# part 1. 套件與資料處理
# part 2. UI介面
# part 3. Server 介面
# part 4. 執行 shiny

# 5.2 shiny互動式App佈署應用 -----

# https://shiny.rstudio.com/
# https://www.rstudio.com/resources/webinars/

# 自動安裝套件 -----
usedpackages <- c("shiny", "ggplot2")

verify.packages <- function(need.packages) {
  for (x in need.packages) {
    if (!x %in% installed.packages()[,"Package"])
      install.packages(x)
  }
}
verify.packages(usedpackages)

# 基礎互動式shiny -----

library(shiny)

# 顯示內建11個範例
dir(paste0(.libPaths(), "/shiny/examples"))

# shiny example - 01_hello
runExample("01_hello")

runExample("02_text")

runExample("03_reactivity")

# 輸入控制項 -----
?selectInput

# selectInput 下拉式選單:如果資料有很多筆,可使用list物件

# 檔案上傳 -----
runExample("09_upload")

# 輸出控制項-文字/表報 -----

# render函數對照表
# *Output (ui.R)
ls("package:shiny", pattern="Output$") # 9個

# render* (server.R)
ls("package:shiny", pattern="^render") # 8個

runExample("02_text")
# 比對以下表格:
# 文字: verbatimTextOutput("summary") --> output$summary <- renderPrint({})
# 報表: tableOutput("view") --> output$view <- renderTable({})

# 輸出控制項 - ggplot2 -----
# server.R 採用 renderPlot

# 版面配置 -----

# 1.側邊佈局 Sidebar Layout
# 2.網格佈局 Grid Layout
# 3.分頁佈局 Tabsets Layout
# 4.瀏覽選單佈局 Navbar Pages
# 5.瀏覽下拉式選單佈局 Navbar Menu

# 補充篇: 期末報告討論 -----
# 課程回顧

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
