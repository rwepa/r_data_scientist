# 主題: R入門實作

單位: 桃園市政府青年事務局

地點: 桃園市青創指揮部

日期: 2026.08.02 ~ 2026.09.06

時間: 09:10-12:10, 13:30-16:30 (中間休息80分鐘)

下載: https://github.com/rwepa/r_data_scientist/tree/main/hands-on_introduction_to_r_2026

課程: https://ievents.iii.org.tw/EventS.aspx?t=0&id=3216

# 2026.08.02(日) Day1. R環境建置與語法基礎

大綱:

1.1 R/RStudio(或Posit Cloud)環境與專案管理

1.2 物件、向量、矩陣、清單、data.frame/tibble

1.3 套件安裝與使用(install.packages / library)

1.4 資料匯入(CSV/Excel)與基本檢視

1.5 練習：讀入資料並完成基本摘要與簡單圖表

+ R環境建置與語法基礎 PDF: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_01_introduction.pdf

+ R環境建置與語法基礎 R: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_01_introduction.R

+ 資料物件補充篇詳細說明: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_01_object.R

+ R下載(Windows): https://cran.csie.ntu.edu.tw/bin/windows/base/R-4.6.1-win.exe

+ RStudio下載(Windows): https://download1.rstudio.org/electron/windows/RStudio-2026.07.1-147.exe

+ R下載(macOS): https://cran.csie.ntu.edu.tw/bin/macosx/sonoma-arm64/base/R-4.6.1-arm64.pkg

+ RStudio下載(macOS): https://download1.rstudio.org/electron/macos/RStudio-2026.07.1-147.dmg

套件總覽:

+ e1071       # 支持向量機(svm)
    
+ haven       # 匯入統計檔案 SAS, SPSS
    
+ data.table  # 匯入大型檔案 (100GB)
   
+ tibble      # tibble 資料物件(Simple Data Frames)

# 2026.08.09(日) Day2. 資料清理與轉換(tidyverse)

大綱:

2.1 tidy data概念與常見資料問題(缺值、重複、型態)

2.2 dplyr：filter/select/mutate/summarise/group_by

2.3 tidyr：pivot_longer/pivot_wider、分欄/合欄

2.4 合併資料：join家族與鍵值設計

2.5 練習：完成一份可分析的乾淨資料集

+ Rmd: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_02_tidyverse_notebook.Rmd

+ HTML: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_02_tidyverse_notebook.html

+ PDF: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_02_tidyverse_notebook.pdf

+ DOCX: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_02_tidyverse_notebook.docx

套件總覽:

| 套件 | 主要功能 | 適用情境 |
|:---|:---|:---|
| **dplyr** | 資料整理套件，提供篩選、排序、選取、分組、彙總等功能。 | 資料前處理、資料分析。 |
| **GGally** | 擴充 **ggplot2**，提供多變量資料探索圖形。 | 散佈圖矩陣 `ggpairs()`、相關係數圖等。 |
| **magrittr** | 提供 `%>%` 管線（Pipe）運算子，讓程式碼由左到右閱讀，更容易理解。 | 串接多個資料處理步驟。 |
| **nycflights13** | 提供 2013 年紐約機場航班的教學資料集。 | 學習資料分析、`dplyr`、`ggplot2` 範例。 |
| **RColorBrewer** | 提供美觀且適合資訊視覺化的配色方案。 | `ggplot2`、地圖、熱圖配色。 |
| **readr** | 快速讀取與輸出 CSV、TXT 等文字資料。 | 資料匯入與匯出。 |
| **tidyr** | 將資料整理成 Tidy Data（整潔資料），例如寬表與長表互轉。 | 資料清理與格式轉換。 |
| **tidyverse** | 整合多個常用資料科學套件，如 `ggplot2`、`dplyr`、`tidyr`、`readr` 等。 | 整合式資料分析環境。 |
| **vcd** | *Visualizing Categorical Data*，提供類別資料的統計圖形。 | Mosaic Plot、Association Plot 等。 |

# 2026.08.23(日) Day3. 資料視覺化與洞察(ggplot2)

大綱:

3.1 圖表語法(aes、geom、scale、theme)

3.2 常用圖表：長條/折線/散點/箱型圖與選用情境

3.3 分面與分組比較(facet、color/fill)

3.4 圖表標註與故事化呈現(標題、註解、重點標示)

3.5 練習：產出一頁「關鍵洞察」圖表集

+ Rmd: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_03_ggplot2_notebook.Rmd

+ HTML: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_03_ggplot2_notebook.html

+ PDF: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/hands_on_r_03_ggplot2_notebook.pdf

套件總覽:

| 套件 | 主要功能 | 適用情境 |
|:---|:---|:---|
| **DiagrammeR** | 用於建立流程圖、關係圖、網路圖與圖形結構，支援 Mermaid、Graphviz（DOT）等語法。 | 資料分析流程圖、系統架構圖、決策流程圖、關係圖。 |
| **dplyr** | 提供資料篩選、選取、排序、欄位新增、分組、彙總及資料合併等功能。 | 資料清理、資料前處理、探索性資料分析（EDA）、資料彙總。 |
| **ggplot2** | 依據 Grammar of Graphics 建立資料視覺化圖表，支援多種圖層與統計圖形。 | 資料探索、統計圖表、資料視覺化及分析報告。 |
| **httr** | 提供 HTTP 請求功能，讓 R 可以與 Web API、REST API 及網路服務進行資料交換。 | API 串接、取得網路資料、政府開放資料、第三方服務整合。 |
| **readr** | 提供快速且一致的文字資料讀取與寫入功能，例如 CSV、TSV 等格式。 | CSV、TSV、TXT 等文字資料的匯入與匯出。 |

未完 ...
