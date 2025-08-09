# 主題: 數位人才培育工作坊 - R進階實作

單位: 桃園市新明青創基地

日期: 2025.07.12 ~ 2025.08.09

下載: https://github.com/rwepa/r_data_scientist/tree/main/r_training_advanced_ppt_codes_2025

# 2025.07.12(六) 1.教務管理規定、理解資料集操作

  1.1 R與RStudio下載、安裝與操作
  
  1.2 認識datasets套件之資料操作

  + 套件總覽

    + DT          # 資料表格網頁呈現

    + e1071       # 支持向量機(svm)
    
    + kableExtra  # 表格製作
    
    + writexl     # 匯出Excel檔案
  
  + PDF: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_01_datasets.pdf

  + R: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_01_datasets.R

# 2025.07.12_DATASETS_WISHLIST

資料集分析願望清單

+ White:

  + 近十年國防預算結構分析

  + https://data.gov.tw/dataset/139911

  + 近十年國防預算結構分析_290973.csv

+ Joel:

  + 上櫃公司企業ESG資訊揭露彙總資料-溫室氣體排放
 
  + https://data.gov.tw/dataset/156375
 
  + t187ap46_O_1.csv

+ Tom:

  + 臺北市新車、機動車輛及駕照監理統計資料(按使用燃料別分類)

  + https://data.gov.tw/dataset/157969

  + 臺北市新車領牌數－按使用燃料別分類.csv

+ Uni:

  + 桃園市機車排放空氣污染物檢驗站
  
  + https://data.gov.tw/dataset/101243

  + 定檢站資料.csv

+ Mark:

  + 桃園市公益彩券盈餘分配辦理社會福利事業執行情形-每年統計

  + https://data.gov.tw/dataset/148529

  + 108年桃園市公益彩券盈餘分配辦理社會福利事業情形季報表.csv
  
    ...

  + 113年桃園市公益彩券盈餘分配辦理社會福利事業情形季報表.csv

+ Log:

  + 農產品交易行情

  + https://data.gov.tw/dataset/8066

  + COA_OpenData.csv

+ Mei:

  + 桃園市歷年住宅補貼受理情形統計表

  + https://data.gov.tw/dataset/28078
 
  + 桃園市歷年住宅補貼受理情形統計表-0612修正.csv

 # 2025.07.19(六) 2.資料管線操作

   2.1 認識dplyr套件

   2.2 熟悉開放資料集於dplyr應用

   + 套件總覽

      + dplyr        # 資料操作文法
      
      + magrittr     # 管線操作
      
      + nycflights13 # 2013年NYC機場航班資料, 33萬筆資料 
      
      + readr        # 讀取CSV檔案
      
      + tabulapdf    # 讀取PDF檔案
      
      + tidyr        # 長寬資料轉換

   + R: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_02_dplyr.R

# 2025.07.26(六) 3.圖形文法繪圖

   3.1 認識ggplot2套件

   3.2 熟悉開放資料集於ggplot2應用

   + 套件總覽

      + dplyr        # 資料操作文法
      
      + ggplot2      # 圖形文法繪圖

   + Rmd: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_03_ggplot2.Rmd

   + R: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_03_ggplot2.R

   + HTML: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_03_ggplot2.html.zip

   + PDF: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_03_ggplot2.pdf

   + Word: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_03_ggplot2.docx

# 2025.08.02(六) 4.預測模型

   4.1 認識lm與glm函數

      4.1.1 機器學習簡介
      
      4.1.2 CRISP-DM標準流程
      
      4.1.3 模型績效評估
      
      4.1.4 lm函數
      
      4.1.5 glm函數
   
   4.2 熟悉開放資料集於lm與glm應用
   
   4.3 深度學習應用

   + 套件總覽

      + AER             # Affairs 資料集
    
      + collapsibleTree # 可摺疊樹狀視覺化
    
      + devtools        # 安裝套件工具
    
      + ggflowchart     # 繪製流程圖
    
      + ggplot2         # 圖形文法繪圖
    
      + htmlwidgets     # 儲存為HTML
    
      + neuralnet       # 類神經網路
    
      + NeuralNetTools  # 類神經網路視覺化工具
    
      + nnet            # 類神經網路
    
      + party           # 決策樹
    
      + randomForest    # 隨機森林法
    
      + RColorBrewer    # 調色盤

   + R: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_04_predictive_modelling.R

# 2025.08.09(六) 5.資料科學報告整合應用

   5.1 熟悉管線操作、ggplot2與建立模型
   
   5.2 熟悉rmarkdown製作Word報告

   5.3 補充篇-openxlsx套件簡介

   5.4 補充篇-VirtualBox + Ubuntu + R + RStudio
   
   5.5 補充篇-非監督式學習-集群法(Clustering)

   5.6 補充篇-非監督式學習-關聯規則(Association rule)

   + 套件總覽

      + animation # 動畫
    
      + arules    # 關聯規則
    
      + openxlsx  # Excel 匯入/編輯/匯出

   + R: https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/r_data_science_advcanced_05_integrated_app.R
   + quarto render to docx: quarto render hello.qmd --to docx
   
