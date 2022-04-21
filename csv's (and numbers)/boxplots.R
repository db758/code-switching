setwd("/Users/Debasmita/Desktop/code-switching/csv's (and numbers)")

diffs <- read.csv(file = 'diffs.csv')
head(diffs)

boxplot(as.data.frame(diffs))
