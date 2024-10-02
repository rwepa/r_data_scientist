# file     : r_kmeans_animation.R
# title    : K-means集群法動畫示範
# author   : Ming-Chang Lee
# date     : 2024.10.02
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

library(animation)
set.seed(168)
plot(c(0, 1), c(0, 1), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
text(x = 0.5, y = 0.5, paste("K-means 集群法示範\n",
                             "Ming-Chang Lee\n",
                             "RWEPA: https://rwepa.blogspot.com/"), 
     cex = 1.3, col = "black")
par(mar = c(5, 4, 4, 2) + 0.1)
kmeans.ani(
  x = cbind(X1 = runif(50), X2 = runif(50)),
  centers = 3,
  hints = c("Move centers!", "Find cluster?"),
  pch = 1:3,
  col = 1:3
)
# end
