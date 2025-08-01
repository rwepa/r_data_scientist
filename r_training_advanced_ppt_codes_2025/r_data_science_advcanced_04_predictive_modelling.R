# file     : r_data_science_advcanced_04_predictive_modelling.R
# title    : 4.預測模型
# author   : Ming-Chang Lee
# date     : 2025.08.02
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 🌸 大綱 -----
# 4.1 認識lm與glm函數
# 4.1.1 機器學習簡介
# 4.1.2 CRISP-DM標準流程
# 4.1.3 模型績效評估
# 4.1.4 lm函數
# 4.1.5 glm函數
# 4.2 熟悉開放資料集於lm與glm應用
# 4.3 深度學習應用

# 🌸 套件總覽 -----
# AER # Affairs 資料集
# collapsibleTree # 可摺疊樹狀視覺化
# devtools        # 安裝套件工具
# ggflowchart     # 繪製流程圖
# ggplot2         # 圖形文法繪圖
# htmlwidgets     # 儲存為HTML
# neuralnet       # 類神經網路
# NeuralNetTools  # 類神經網路視覺化工具
# nnet            # 類神經網路
# party           # 決策樹
# randomForest    # 隨機森林法
# RColorBrewer    # 調色盤

# 🌸 4.1 認識lm與glm函數 -----

# 認識自變數與反應變數

# https://github.com/rwepa/DataDemo?tab=readme-ov-file#variables

# X: 自變數, 獨立變數 independent variable, 預測變量 predictor variable, 解釋變量 explanatory variable, 共變量 covariate.

# Y: 反應變數 response variable, 因變數, 依變數, 應變數, 被解釋變數 dependent variable, 結果變數 outcome variable.

# 考量自變數與反應變數之間具有線性關係, 即 Y=f(X)

# lm函數之主要功能是擬合線性模型(Fitting Linear Models), 可用於單一變數之簡單線性模型(Single regression model)與多變數複迴歸模型(Multiple linear regression / Multivariable linear regression).

# 線性模型中單一變數或多變數表示自變數(X)的個數可以為1個或大於等於1個.

# 線性模型中的反應變數(Y)一般為一個變數.

# 🌸 4.1.1 機器學習簡介 -----

library(ggflowchart)  # 繪製流程圖
library(RColorBrewer) # 調色盤
library(ggplot2)      # 圖形文法繪圖

display.brewer.all(colorblindFriendly=TRUE) # 顯示所有調色盤
display.brewer.pal(n=8, name="Set2")        # 顯示特定調色盤
datacol <- brewer.pal(n=5, name="Set2")     # 使用Set2調色盤

# 建立流程圖元素
ai <- "人工智慧1950~"
dm <- "資料探勘1960~"
ml <- "機器學習1980~"
dl <- "深度學習2006~"
gl <- "生成學習2020,2022(ChatGPT)~"

# 建立資料集
df <- tibble::tibble(from = c(ai, dm, ml, dl),
                     to   = c(dm, ml, dl, gl))

# 顯示人工智慧發展史
ggflowchart(df, colour = datacol, text_size = 8) +
  ggtitle("人工智慧發展史") +
  theme(plot.title = element_text(hjust = 0.5, size = 30, face = "bold"))

# 重要里程碑:

# 1.人工智慧 (AI, artificial intelligence)1950~
# 1943年: 美國數學家 Walter Pitts和心理學家 Warren McCulloch提出人工神經元.
# 1957年: 美國心理學家 Frank Rosenblatt 提出了感知器(Perceptron). 

# 2.資料探勘 (DM, data mining)1960~
# https://en.wikipedia.org/wiki/Data_mining
# 以手動分析為主, 應用在人口普查, 商業帳務等.
# 使用技術包括敘述性統計, 變異數分析, 迴歸分析等基礎統計推論方法.
# 資料探勘目標是描述與解釋資料, 而非進行預測, 整體是找出樣式(Patterns).
# 1970年發展出IBM-DB2關聯式資料庫.

# 3.機器學習 (ML, machine learning)1980~
# https://en.wikipedia.org/wiki/Machine_learning
# 開始加入演算法之應用.
# 1980年多層類神經網路失敗, 淺層機器學習方法(支持向量機SVM等)興起.
# 機器學習目標是建立模型(Model)並預測未來事件.
# 機器學習的三大技術:
# [1].監督式學習 (Supervised learning): Telling the algorithm what to predict
# [2].非監督式學習 (Unsupervised learning): No label or target value given for the data
# [3].強化學習 (Reinforcement learning):  為了達成目標,  隨著環境的變動, 而逐步調整其行為, 並評估每一個行動之後所到的回饋是正向的或負向的. 例: 射擊遊戲.

# 4.深度學習 (DL, deep learning)2006~
# https://en.wikipedia.org/wiki/Deep_learning
# 2006年Geoffrey Hinton (深度學習之父) 成功訓練多層神經網路(限制玻爾茲曼機, RBM)並命名為深度學習.

# 5.生成學習 (GL, generative learning)2020,2022(ChatGPT)~
# https://en.wikipedia.org/wiki/Generative_artificial_intelligence
# 2020年3月，由一位匿名的麻省理工學院研究員所創造的15.ai，是一個免費的網路應用程式，可以使用最少的訓練資料，產生令人信服的角色語音。該平台被認為是第一個在網路迷因和內容創作中普及AI語音克隆（音訊深度偽造）的主流服務，影響了語音AI技術的後續發展。

# 機器學習常用技術:
# Session \ Restart R

library(collapsibleTree)

ml <- c(
  "迴歸分析 Regression analysis",
  "廣義線性模型 General linear model (GLM)",
  "天真貝氏法 Naïve-Bayes",
  "K近鄰法 k-nearest neighbors (KNN)",
  "決策樹 Decision tree",
  "隨機森林法 Random Forest",
  "支持向量機 Support vector machine (SVM)",
  "類神經網路 Neural network (NN)",
  "集成學習 Ensemble learning")

uml <- c(
  "集群法 Clustering",
  "關聯規則 Association rule",
  "主成分分析 Principal Component Analysis")

機器學習 <- data.frame(type = c(rep("監督式學習", 9), rep("非監式督學習", 3)),
                 algorithm = c(ml, uml))

# 建立tree
p <- collapsibleTree(機器學習, c("type", "algorithm"), collapsed = FALSE, fontSize=12)
p

# 儲存tree
library(htmlwidgets)
saveWidget(p, file="machinelearning_interactive.html")

# 🌸 4.1.2 CRISP-DM標準流程 -----

# 跨產業資料探勘標準作業流程 (CRoss Industry Standard Process for Data Mining)
# CRISP-DM是資料探勘的一種方法論.
# CRISP-DM於1990年起, 由SPSS以及NCR兩大廠商在合作戴姆克萊斯勒-賓士(Daimler Benz)的資料倉儲與資料探勘過程中發展出來的標準流程.

library(ggflowchart)  # 繪製流程圖
library(RColorBrewer) # 調色盤
library(ggplot2)      # 圖形文法繪圖

display.brewer.all(colorblindFriendly=TRUE) # 顯示所有調色盤
display.brewer.pal(n=6, name="Dark2")       # 顯示特定調色盤
datacol <- brewer.pal(n=6, name="Dark2")    # 使用Set2調色盤

# 建立流程圖元素

step1 <- "步驟1-商業理解"
step2 <- "步驟2-資料理解"
step3 <- "步驟3-資料準備"
step4 <- "步驟4-模式建立"
step5 <- "步驟5-評估與測試"
step6 <- "步驟6-佈署應用"

# 建立資料集
df <- tibble::tibble(from = c(step1, step2, step3, step4, step5),
                     to   = c(step2, step3, step4, step5, step6))

# 顯示CRISP-DM標準流程
ggflowchart(df, colour = datacol, text_size = 8) +
  ggtitle("CRISP-DM標準流程") +
  theme(plot.title = element_text(hjust = 0.5, size = 30, face = "bold"))

# CRISP-DM標準流程六大步驟

# 步驟1-商業理解
# 終極目標是要解決具體的產業問題, 諸如提高購買率, 找出詐欺交易, 銷售預測與異常偵測等. 因此以專業知識 (domain knowledge)進行商業理解是重要的第一步.
# 處理重點：擬定商業目標, 進行當前處境評估, 決定資料探勘目標/成本, 產生專案計劃, 解決顧客問題.

# 步驟2-資料理解
# 包括描述資料, 探索式資料分析, 核驗資料品質 
# 敘述統計分析
# 六力分析(summary函數)
# 繪圖: 
# [1]依群組特性
# [2]依時間特性
# [3]新增評估欄位
# [4]趨勢
# [5]離群值 (outlier)
# [6]散佈圖、散佈圖矩陣
# [7]盒鬚圖

# 步驟3-資料準備
# 資料準備會將資料隨機抽樣區分為[1]訓練資料70％ [2]測試資料30％.
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/images/data_preparation.png

# 步驟4-模式建立
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/images/modeling_evaluation.png

# 步驟5-評估與測試
# https://github.com/rwepa/r_data_scientist/blob/main/r_training_advanced_ppt_codes_2025/images/modeling_evaluation.png

# 步驟6-佈署應用
# https://en.wikipedia.org/wiki/Cross_Industry_Standard_Process_for_Data_Mining

# 🌸 4.1.3 模型績效評估 -----

# [1]數值模型績效指標: 包括MSE, RMSE, MAE
# 整體誤差不可直接使用誤差的算術平均!
# 均方誤差 (Mean Squared Error, MSE) 
# 均方根誤差 (Root Mean Squared Error, RMSE) 
# 平均絕對誤差 (Mean Absolute Error, MAE)
# https://rwepa.blogspot.com/2013/01/rocr-roc-curve.html

# [2]類別模型績效指標: 使用混淆矩陣 (Confusion matrix)
# https://rwepa.blogspot.com/2013/01/rocr-roc-curve.html

# 迴歸模型

# lm: Linear Model 線性迴歸模型

# glm: Generalized Linear Models 廣義線性模型, 包括邏輯斯迴歸, 卜瓦松迴歸.
# 邏輯斯迴歸(Logistic regression), Y是1個類別型變數, 參數 family = binomial()
# 卜瓦松迴歸(Poisson regression), Y是1個計數型變數, 參數 family = poisson()

# 邏輯斯迴歸（Logistic Regression）數學模型

# 公式1：邏輯函數 (Logistic function)
# p = e^(α + β₁x₁ + β₂x₂ + ⋯ + βₖxₖ) / (1 + e^(α + β₁x₁ + β₂x₂ + ⋯ + βₖxₖ))
expr1 <- expression(
  p == frac(e^(alpha + beta[1]*x[1] + beta[2]*x[2] + cdots + beta[k]*x[k]),
            1 + e^(alpha + beta[1]*x[1] + beta[2]*x[2] + cdots + beta[k]*x[k]))
)

# 公式2：對數勝算 (log odds) 轉換 (Logit Function)
# log(p / (1 - p)) = α + β₁x₁ + β₂x₂ + ⋯ + βₖxₖ
# 左側表示事件發生與不發生的機率比的對數 (log-odds)
expr2 <- expression(
  log(frac(p, 1 - p)) == alpha + beta[1]*x[1] + beta[2]*x[2] + cdots + beta[k]*x[k]
)

# 公式表示
plot(1, type = "n", xlab = "", ylab = "", axes = FALSE)
text(1, 1.2, expr1, cex = 1.2)
text(1, 0.8, expr2, cex = 1.2)
title(main = "邏輯斯迴歸（Logistic Regression）數學模型")
box()

# nls: Nonlinear Least Squares 非線性最小平方法(非線性迴歸)

# loess: Local Polynomial Regression Fitting 局部多項式迴歸

# arima: Time series 時間序列

# 🌸 4.1.4 lm函數 -----

# 迴歸模式的推論-最小平方法
# https://github.com/rwepa/DataDemo/blob/master/regression_01.pdf

# marketing.R
# https://github.com/rwepa/DataDemo/blob/master/marketing.R

# 🌸 4.1.5 glm函數 -----

# 邏輯斯迴歸-社會科學研究 affair case study

library(AER)

?Affairs # 601*9

data(Affairs, package="AER")

head(Affairs)

summary(Affairs)
# 女性: 52%
# 小孩: 72%
# 中位數年齡: 32歲
# 無外遇者: 75% (451/601)
# 最多外遇12次: 6% (38/601)

# 外遇次數統計表, 最多12次
table(Affairs$affairs)

# 建立評估變數
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair,
                           levels=c(0,1),
                           labels=c("No","Yes"))
table(Affairs$ynaffair)

# 邏輯斯迴歸-使用所有自變數
fit_full <- glm(ynaffair ~ gender + age + yearsmarried + children + religiousness + education + occupation + rating, data=Affairs, family=binomial())

# 模型摘要
summary(fit_full)

# 邏輯斯迴歸-刪除較不顯著的4個變數, 即p值大於0.05者先刪除(Pr(>|z|) 沒有標註*)
fit_reduced <- glm(ynaffair ~ age + yearsmarried + religiousness + rating, 
                   data=Affairs, 
                   family=binomial())

# 模型摘要-p值已達到顯著性
summary(fit_reduced)

# 模型比較
# p值為0.2108, 表示使用 fit_full 模型沒有較 fit_reduced 擬合更好, 因此選擇 fit_reduced.
anova(fit_reduced, fit_full, test="Chisq")

# 模型參數, 不可以直接使用該係數.
coef(fit_reduced)

# 進行指數轉換
exp(coef(fit_reduced))

# 信賴區間 (confidence interval)
exp(confint(fit_reduced))

# 敏感度分析 - rating
testdata <- data.frame(rating=c(1, 2, 3, 4, 5), 
                       age=mean(Affairs$age),
                       yearsmarried=mean(Affairs$yearsmarried),
                       religiousness=mean(Affairs$religiousness))
testdata
testdata$prob <- predict(fit_reduced, newdata=testdata, type="response")
testdata

# 敏感度分析 - age
testdata <- data.frame(rating=mean(Affairs$rating),
                       age=seq(17, 57, 10),
                       yearsmarried=mean(Affairs$yearsmarried),
                       religiousness=mean(Affairs$religiousness))
testdata
testdata$prob <- predict(fit_reduced, newdata=testdata, type="response")
testdata

# 🌸 4.2 熟悉開放資料集於lm與glm應用 -----

# lm應用 -----

data(iris)

iris_lm <- lm(Petal.Length ~ Sepal.Length, data = iris)

# 模型摘要
summary(iris_lm)

# 繪圖
plot(iris$Sepal.Length, iris$Petal.Length,
     main = "線性迴歸 - 花萼長度 vs 花瓣長度",
     xlab = "花萼長度", 
     ylab = "花瓣長度",
     pch = 16,
     col = iris$Species)
abline(iris_lm, col = "blue", lwd = 2)

# glm應用 -----

# 新增二元變數：是否為 setosa
iris$IsSetosa <- ifelse(iris$Species == "setosa", 1, 0)

# 邏輯斯迴歸模型（以花瓣長度預測）
glm_model <- glm(IsSetosa ~ Petal.Length, data = iris, family = binomial)

# 模型摘要
summary(glm_model)

# 預測機率
predicted_prob <- predict(glm_model, type = "response")

# Try: 加入其他變數

# 決策樹-party 套件 -----
library(party)

str(iris)
set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

# model formula
myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

# build tree
iris_ctree <- ctree(myFormula, data=trainData)

# check the prediction
table(predict(iris_ctree), trainData$Species)

# plot tree
print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")

# predict on test data
testPred <- predict(iris_ctree, newdata = testData)
table(testPred, testData$Species)

# 讀取節點資料
nodes(iris_ctree, 3)
nodes(iris_ctree, 4)[1]
nodes(iris_ctree, 4)[[1]]
names(nodes(iris_ctree, 4)[1])
names(nodes(iris_ctree, 4)[[1]])
nodes(iris_ctree, 5)[[1]]$prediction
nodes(iris_ctree, 6)[[1]]$prediction

# 隨機森林法-randomForest套件 -----
library(randomForest)

ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

iris.rf <- randomForest(Species ~ ., data=trainData, ntree=100, proximity=TRUE)
table(predict(iris.rf), trainData$Species)

print(iris.rf)
attributes(iris.rf)

# Error rates with various number of trees
plot(iris.rf)

# Extract variable importance measure
importance(iris.rf) # Gini index
varImpPlot(iris.rf)

# Test the built random forest on test data
irisPred <- predict(iris.rf, newdata=testData)
table(irisPred, testData$Species)
# end

# 類神經網路-nnet套件 (1個隱藏層) -----

# nnet 套件(1個隱藏層)
library(devtools)
library(nnet)

# 區分為訓練集,測試集
set.seed(168)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind == 1,]
testData <- iris[ind == 2,]

# 建立模型
iris.nnet <- nnet(formula = Species ~ .,
                  linout = TRUE,
                  size = 3, 
                  decay = 0.001, 
                  maxit = 1000,
                  data = trainData)

# 資料摘要
summary(iris.nnet)

# 繪圖
library(NeuralNetTools)
plotnet(iris.nnet, alpha=0.6)

# 預測-測試集 
irisPred.nnet <- predict(iris.nnet, testData, type = "class")

#預測結果-混淆矩陣(Confusion Matrix)
cm <- table(x = irisPred.nnet,
            y = testData$Species, 
            dnn = c("預測", "實際"))
cm

# 類神經網路-neuralnet 套件 (多個隱藏層) -----
library(neuralnet)

# 資料整理
data <- iris
data$setosa <- ifelse(data$Species == "setosa", 1, 0)
data$versicolor <- ifelse(data$Species == "versicolor", 1, 0)
data$virginica <- ifelse(data$Species == "virginica", 1, 0)
head(data)

# 區分為訓練集,測試集
set.seed(168)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- data[ind == 1,]
testData <- data[ind == 2,]

# 建立模型
f1 <- as.formula("setosa + versicolor + virginica  ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width")
bpn <- neuralnet(formula = f1, 
                 data = trainData, 
                 hidden = c(2, 4), # 2個隱藏層, 節點數分別為2, 4
                 learningrate = 0.01)
print(bpn)

# 🌸 4.3 深度學習應用 -----

# 使用原生 torch 套件
# https://cran.r-project.org/web/packages/torch/
# https://torch.mlverse.org/docs/

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