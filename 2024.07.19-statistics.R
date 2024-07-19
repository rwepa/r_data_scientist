# file     : 2024.07.19-statistics.R
# title    : 數據統計量計算與基本統計圖表製作
# author   : Ming-Chang Lee
# date     : 2024.07.19
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 大綱 -----
# 1.集中趨勢與分散趨勢
# 2.長寬資料轉換
# 3.離散與連續資料的統計圖表
# 4.dplyr管線操作
# 5.ggplot2圖形-3個實務範例
# 6.互動式表格
# 7.YouBike2.0臺北市公共自行車即時資訊資料分析

# 1.集中趨勢與與分散趨勢 -----
# 集中趨勢: mean, median, mode
# 分散趨勢: sd, var, range, quantile
# 配合 apply, lapply, aggregate
?quantile

# 2.長寬資料轉換 -----

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

# 3.離散與連續資料的統計圖表 -----

# 四大繪圖類型
# 1.比較 Comparison
# 2.組成 Composition
# 3.分配 Distribution
# 4.關聯 Relationship
# https://extremepresentation.typepad.com/files/choosing-a-good-chart-09.pdf

# 長條圖
CarArrived <- table(NumberOfCar <- rpois(100, lambda=5))
CarArrived
barplot(CarArrived)
barplot(CarArrived, col=rainbow(14))

# 圓形圖
# Sales ratio
pie.sales <- c(0.14, 0.30, 0.26, 0.15, 0.10, 0.05)

# Sales area
names(pie.sales) <- c("Taipei1", "Taipei2", "Taipei3", "Taichung", "Kao", "Other")

# default colours
pie(pie.sales)

# pie with customized colour
pie(pie.sales, col = c("purple", "violetred1", "green3", "cornsilk", "cyan", "white"))

# pie with density of shading lines
pie(pie.sales, density = c(5,20), clockwise=TRUE)

# Box-and-whisker plot(s) of the given (grouped) values.
mat <- cbind(Uni05 = (1:100)/21, Norm=rnorm(100), T5 = rt(100,df= 5), 
             Gam2 = rgamma(100, shape = 2))
head(mat)
boxplot(data.frame(mat), main = "boxplot")

# 莖葉圖 stem plot
set.seed(123)
mat <- round(rnorm(10,30,10),0)
mat
stem(mat)

# 直方圖
set.seed(168)
hist(rnorm(1000))

# 核密度圖 Kernel Density Plot
d <- density(mtcars$mpg)
plot(d)

# 客製化 6-Sigma Quality Level
z <- pretty(c(44,56), 50) # Find 50 equally spaced points
ht <- dnorm(z, mean=50,sd=1) # By default: mean=0, standard deviation=1
plot(z, ht, type="l", main="6-Sigma Quality Level", 
     xlab="Qualty characteristic", ylab="Quality Level" , 
     axes=FALSE, xlim=c(42,58), ylim=c(0,0.5))

# Add axis
# 1=below, 2=left, 3=above and 4=right
axis(side=1, c(42:58),tick = TRUE)
axis(side=2, tick = TRUE)

# Add vertical line
# h=0: horizontal line(s);v=0: vertical line(s)
abline(v=c(44,50,56), lty=c(1,2,1), col=c("red","blue","red"))  

# Add text
text(44,0.5,"LSL", adj = c(-0.2,0))
text(50,0.5,"T",adj = c(-0.2,0))
text(56,0.5,"USL",adj = c(-0.2,0))

# 點圖
x <- mtcars[order(mtcars$mpg),] # sort by mpg
x$cyl <- factor(x$cyl) # it must be a factor
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,labels=row.names(x),cex=.7,groups= x$cyl,
         main="Gas Milage for Car Models\ngrouped by cylinder",
         xlab="Miles Per Gallon", gcolor="black", color=x$color)

# 3D 繪圖
# scatterplot3d package
# setup plotting environment for 2 rows and 2 columns
# par(bg = "white")
op <- par(mfrow = c(2,2))

# method 1: scatterplot3d (type=point) - Parabola
library(scatterplot3d)
x <- seq(-3, 3, length = 30)
y <- x
f <- function (x,y) {a <- 9; a - x^2 - y^2}
scatterplot3d(x, y, f(x,y),
              highlight.3d=TRUE, col.axis="blue",
              pch=20,
              main="Euclidean Utility Function - parabola, (type=point)",
              xlab="X", ylab="Y", zlab="f(x,y)", 
              zlim=c(0,9),
              col.grid="lightblue", 
              type="p"
)

# method 2: scatterplot3d (type=point)
library(scatterplot3d)
x <- seq(-3, 3, length = 30)
f <- function (x,y) {a <- 9; a - x^2 - y^2}
x1 <- rep(x, 30)
x2 <- rep(x, each=30)
znew <- f(x1, x2)
scatterplot3d(x1, x2, znew,
              highlight.3d=TRUE, col.axis="blue",
              pch=20,
              main="Euclidean Utility Function, (type=point)",
              xlab="X", ylab="Y", zlab="f(x,y)", 
              zlim=c(0,9),
              col.grid="lightblue", 
              type="p"
)

# method 3: scatterplot3d (type=line)
library(scatterplot3d)
x <- seq(-3, 3, length = 30)
f <- function (x,y) {a <- 9; a - x^2 - y^2}
x1 <- rep(x, 30)
x2 <- rep(x, each=30)
znew <- f(x1, x2)
scatterplot3d(x1, x2, znew,
              highlight.3d=TRUE, col.axis="blue",
              pch=20,
              main="Euclidean Utility Function (type=line)",
              xlab="X", ylab="Y", zlab="f(x,y)", 
              zlim=c(0,9),
              col.grid="lightblue", 
              type="l"
)

# method 4: persp
x <- seq(-3,3,length = 30)
y <- x
f <- function (x,y) { a <- 9; a-x^2-y^2}
z <- outer(x,y,f)
persp(x,y,z,zlim = range(c(-10:10), na.rm = TRUE), 
      expand=1,theta = 30, phi = 30,
      col = "lightblue",ticktype="detailed", 
      xlab="X", ylab="Y", zlab="f(x,y)",
      main="Euclidean Utility Function")

# method 5: misc3d (need "rgl" package)
# misc3d package
library(misc3d)
parametric3d(
  fx = function(u, v) u,
  fy = function(u, v) v,
  fz = function(u, v) -9 - u^2 - v^2 ,
  fill = FALSE,
  color = "blue",
  scale = FALSE,
  umin = -3, umax = 3, vmin = -3, vmax = 3, n = 100)

# setup plotting environment to the default
# par(mfrow=c(1,1))
par(op)

# 4.dplyr管線操作 -----

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

# 5.ggplot2圖形-3個實務範例 -----

# https://cran.r-project.org/web/packages/ggplot2/index.html
# ggplot2: Create Elegant Data Visualisations Using the Grammar of Graphics
# 參考資料 https://ggplot2-book.org/

# Introduction to ggplot2
# https://cran.r-project.org/web/packages/ggplot2/vignettes/ggplot2.html

# ggplot2概念 -----
# 1.以圖層(layers)為基礎的繪圖套件,它實現了Wilkinson (2005)的繪圖文法(Grammar of Graphics)概念.
# 2.一個圖形是由數個圖層所組成,其中一層包含了資料(data)層.
# 3.Wilkinson認為圖形繪製須結合數據與繪製規範,規範並非是圖形視覺效果的名稱(例如:長條圖,散佈圖,直方圖等).
# 4.規範應是一組共同決定圖形如何建立的規則 – a grammar of graphics.

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

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  facet_wrap(~class)

# ggplot2: 線圖+散佈圖
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_line()

# ggplot2: 散佈圖+線圖+群組
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color=factor(cyl))) +
  geom_line()

# ggplot2 animation (動畫圖) -----
# https://www.datanovia.com/en/blog/gganimate-how-to-create-plots-with-beautiful-animation-in-r/

library(ggplot2)
library(gganimate)
library(gapminder)

theme_set(theme_bw())

head(gapminder)

# Static plot
p <- ggplot(
  gapminder, 
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p

# 基本動畫圖
p + transition_time(year) +
  labs(title = "Year: {frame_time}")

# 依五大洲群組動畫圖
p + facet_wrap(~continent) +
  transition_time(year) +
  labs(title = "Gapminder Animation Year: {frame_time}")

# 網路抓取 R CRAN 套件清單, 使用 ggplot2 套件繪圖, 建立第2個y軸座標 -----
# https://rwepa.blogspot.com/2017/09/ggplot2-2y-packagelist.html

# ggplot2-新增數學式-以迴歸分析模型為例 (regression line equation) -----
# https://rwepa.blogspot.com/2020/09/ggplot2-equation.html

# R軟體開放資料應用-高速公路篇-使用ggplot2 -----
# http://rwepa.blogspot.com/2019/05/highway.html

# leaflet - 地圖應用
library(leaflet)
m1 <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 121.542384, lat = 25.058035, popup = "台北") %>%
  setView(lng = 120.974, lat = 23.6, zoom = 8)
m1

# 6.互動式表格 -----

# kableExtra 套件 -----
# r cran kableExtra
# https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html

library(kableExtra)

dt <- mtcars[1:5, 1:6]
kbl(dt)

# Bootstrap theme
dt %>%
  kbl() %>%
  kable_styling()

dt %>%
  kbl() %>%
  kable_paper("hover", full_width = F)

dt %>%
  kbl(caption = "Full width booktabs style table") %>%
  kable_classic(full_width = TRUE, html_font = "Cambria")

dt %>%
  kbl() %>%
  kable_classic_2(full_width = FALSE)

dt %>%
  kbl() %>%
  kable_minimal()

dt %>%
  kbl() %>%
  kable_material(c("striped", "hover"))

dt %>%
  kbl() %>%
  kable_material_dark()

kbl(dt) %>%
  kable_styling(bootstrap_options = "striped", full_width = FALSE, position = "left")

kbl(dt) %>%
  kable_styling(bootstrap_options = "striped", full_width = F, position = "float_right")

# 字型大小
kbl(dt) %>%
  kable_styling(bootstrap_options = "striped", font_size = 20)

# 背景色彩
mtcars[1:8, 1:8] %>%
  kbl() %>%
  kable_paper(full_width = F) %>%
  column_spec(2, color = spec_color(mtcars$mpg[1:8]),
              link = "https://haozhu233.github.io/kableExtra/") %>%
  column_spec(6, color = "white",
              background = spec_color(mtcars$drat[1:8], end = 0.7),
              popover = paste("am:", mtcars$am[1:8]))

# Inline plotting
mpg_list <- split(mtcars$mpg, mtcars$cyl)
disp_list <- split(mtcars$disp, mtcars$cyl)
inline_plot <- data.frame(cyl = c(4, 6, 8), mpg_box = "", mpg_hist = "",
                          mpg_line1 = "", mpg_line2 = "",
                          mpg_points1 = "", mpg_points2 = "", mpg_poly = "")
inline_plot %>%
  kbl(booktabs = TRUE) %>%
  kable_paper(full_width = FALSE) %>%
  column_spec(2, image = spec_boxplot(mpg_list)) %>%
  column_spec(3, image = spec_hist(mpg_list)) %>%
  column_spec(4, image = spec_plot(mpg_list, same_lim = TRUE)) %>%
  column_spec(5, image = spec_plot(mpg_list, same_lim = FALSE)) %>%
  column_spec(6, image = spec_plot(mpg_list, type = "p")) %>%
  column_spec(7, image = spec_plot(mpg_list, disp_list, type = "p")) %>%
  column_spec(8, image = spec_plot(mpg_list, polymin = 5))

# 森林圖 (Forest plot)
coef_table <- data.frame(
  Variables = c("var 1", "var 2", "var 3"),
  Coefficients = c(1.6, 0.2, -2.0),
  Conf.Lower = c(1.3, -0.4, -2.5),
  Conf.Higher = c(1.9, 0.6, -1.4)
) 

data.frame(
  Variable = coef_table$Variables,
  Visualization = ""
) %>%
  kbl(booktabs = T) %>%
  kable_classic(full_width = FALSE) %>%
  column_spec(2, image = spec_pointrange(
    x = coef_table$Coefficients, 
    xmin = coef_table$Conf.Lower, 
    xmax = coef_table$Conf.Higher, 
    vline = 0)
  )

# plotly 互動式繪圖 -----
# https://cran.r-project.org/web/packages/plotly/index.html
# https://plotly.com/r/

library(plotly)

# 奧克蘭芒加瓦烏火山地形資訊 (Topographic Information on Auckland's Maunga Whau Volcano)
?volcano

# 3D plot
# volcano is a numeric matrix that ships with R
fig <- plot_ly(z = ~volcano)
fig <- fig %>% add_surface()
fig

# Surface Plot With Contours
fig <- plot_ly(z = ~volcano) %>% add_surface(
  contours = list(
    z = list(
      show=TRUE,
      usecolormap=TRUE,
      highlightcolor="#ff0000",
      project=list(z=TRUE)
    )
  )
)

fig <- fig %>% layout(
  scene = list(
    camera=list(
      eye = list(x=1.87, y=0.88, z=-0.64)
    )
  )
)

fig

# 7.YouBike2.0臺北市公共自行車即時資訊資料分析 -----

# source: https://data.gov.tw/dataset/137993

# 載入套件
library(jsonlite)
library(dplyr)
library(leaflet)
library(htmltools)

# 匯入資料並轉換為tibble
urls <- "https://tcgbusfs.blob.core.windows.net/dotapp/youbike/v2/youbike_immediate.json"
df <- tibble::as_tibble(fromJSON(txt = urls))

# 轉換為 factor
df$sarea <- factor(df$sarea)

# 轉換為 Date
df$infoDate <- as.Date(df$infoDate)

# 將 "YouBike2.0_" 取代為空白
df$sna <- gsub("YouBike2.0_", "", df$sna)

# 新增使用率變數 usage
df$usage <- (df$total - df$available_rent_bikes)/df$total

# 資料結構
str(df)

# 資料結構
str(df)

# 資料摘要
summary(df)

# 可借數量直方圖
tmp <- hist(df$available_rent_bikes)
ymax <- tmp$counts[1]+150
hist(df$available_rent_bikes, 
     ylim =c(0, ymax),
     xlab = "Available Rent Bikes",
     main = paste0("臺北市Youbike可借數量直方圖, ", df$infoDate[1]))
box()
grid()

# 可借數量依行政區水平長條圖
df_available_tmp <- aggregate(x = available_rent_bikes ~ sarea,
                              data = df,
                              FUN = sum)

df_available_tmp <- df_available_tmp[order(df_available_tmp$available_rent_bikes),]

df_available <- as.table(df_available_tmp$available_rent_bikes)
names(df_available) <- df_available_tmp$sarea
df_available

barplot(df_available, 
        width = 0.5, 
        horiz = TRUE, 
        cex.names = 0.8,
        las = 2,
        main = paste0("臺北市Youbike可借數量依行政區水平長條圖, ", df$infoDate[1]))
box()
grid()

# 臺北市Youbike使用率互動式地圖

# 設定地圖的標題
tag.map.title <- tags$style(HTML("
  .leaflet-control.map-title { 
    transform: translate(-50%,20%);
    position: fixed !important;
    left: 50%;
    text-align: center;
    padding-left: 10px; 
    padding-right: 10px; 
    background: rgba(255,255,255,0.75);
    font-weight: bold;
    font-size: 18px;
  }
"))

# 建立 tag 物件
title <- tags$div(
  tag.map.title, HTML("臺北市Youbike使用率互動式地圖")
)  

# leaflet地圖
m <- df %>% 
  leaflet() %>%
  addTiles() %>%
  addCircles(lng = ~longitude, 
             lat = ~latitude, 
             radius = ~usage*80, 
             label = ~paste0(df$sna, "-", round(df$usage*100,0), "%"),
             labelOptions = labelOptions(
                   textsize = "16px",
                   style = list("font-weight" = "bold", padding = "4px"))) %>%
  addControl(title, position = "topleft", className="map-title")
m
# end
