# 主題: R入門實作

單位: 桃園市政府青年事務局

地點: 桃園市青創指揮部

日期: 2026.08.02 ~ 2026.09.06

時間: 09:10-12:10, 13:30-16:30 (中間休息80分鐘)

下載: https://github.com/rwepa/r_data_scientist/tree/main/hands-on_introduction_to_r_2026

# 2026.08.02(日) Day1.R環境建置與語法基礎

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

# 2026.08.09(日) 第2章 資料清理與轉換(tidyverse)

大綱:

2.1 tidy data概念與常見資料問題(缺值、重複、型態)

2.2 dplyr：filter/select/mutate/summarise/group_by

2.3 tidyr：pivot_longer/pivot_wider、分欄/合欄

2.4 合併資料：join家族與鍵值設計

2.5 練習：完成一份可分析的乾淨資料集

+ Rmd: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/r_data_science_02_tidyverse_notebook.Rmd

+ HTML: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/r_data_science_02_tidyverse_notebook.html

+ PDF: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/r_data_science_02_tidyverse_notebook.pdf

+ DOCX: https://github.com/rwepa/r_data_scientist/blob/main/hands-on_introduction_to_r_2026/r_data_science_02_tidyverse_notebook.docx

套件總覽:

| 套件               | 主要功能                                                | 適用情境                                     |
| ---------------- | -------------------------------------------------------------------- | ------------------------------- |
| **magrittr**     | 提供 `%>%` 管線（Pipe）運算子，讓程式碼由左到右閱讀，更容易理解。         | 串接多個資料處理步驟。                     |
| **dplyr**        | 資料整理套件，提供篩選、排序、選取、分組、彙總等功能。                     | 資料前處理、資料分析。                     |
| **nycflights13** | 提供 2013 年紐約機場航班的教學資料集。                                   | 學習資料分析、`dplyr`、`ggplot2` 範例。    |
| **tidyr**        | 將資料整理成 Tidy Data（整潔資料），例如寬表與長表互轉。                   | 資料清理與格式轉換。                      |
| **tidyverse**    | 整合多個常用資料科學套件，如 `ggplot2`、`dplyr`、`tidyr`、`readr` 等。   | 一站式資料分析環境。                      |
| **readr**        | 快速讀取與輸出 CSV、TXT 等文字資料。                                    | 匯入、匯出資料。                        |
| **vcd**          | Visualizing Categorical Data，提供類別資料的統計圖形。                  | Mosaic Plot、Association Plot 等。 |
| **RColorBrewer** | 提供美觀且適合資訊視覺化的配色方案。                                     | `ggplot2`、地圖、熱圖配色。              |
| **GGally**       | 擴充 `ggplot2`，提供多變量資料探索圖形。                                | 散佈矩陣 (`ggpairs()`)、相關係數圖等。      |

