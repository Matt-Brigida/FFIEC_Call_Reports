library(xts)
library(plm)

num <- readRDS("./totNumSBloans.rds")

med <- apply(num, 2, median)

result <- median(med[med > 0])

result
## 204

result*(.0506)
