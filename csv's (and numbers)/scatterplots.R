library(dplyr)
setwd("/Users/Debasmita/Desktop/code-switching/csv's (and numbers)")

#first creating all scatter plots

cs_data <- read.csv(file = "redoing_cs_data.csv")
head(cs_data)
non_cs_data <- read.csv(file = "non_cs_sentences_full.csv")
head(non_cs_data)

#cs_ngram <- read.csv(file = "retrained_cs_ngram.csv")
#head(cs_ngram)
plot(cs_data[,'ngram_surp_eng'], cs_data[,'ngram_surp_zh'])
abline(a=0, b=1)

#cs_dep <- read.csv(file = "retrained_cs_dep.csv")
#head(cs_dep)
plot(cs_data[,'dep_surp_eng'], cs_data[,'dep_surp_zh'])
abline(a=0, b=1)

#non_cs_ngram <- read.csv(file = "retrained_non_cs_ngram.csv")
#head(non_cs_ngram)
plot(non_cs_data[,'ngram_surp_eng'], non_cs_data[,'ngram_surp_zh'])
abline(a=0, b=1)

#non_cs_dep <- read.csv(file = "retrained_non_cs_dep.csv")
#head(non_cs_dep)
plot(non_cs_data[,'dep_surp_eng'], non_cs_data[,'dep_surp_zh'])
abline(a=0, b=1)

#now getting points of interest (POI) from each plot

cs_ngram_POI_1 <- cs_data[(cs_data$ngram_surp_eng < 3),]
summary(cs_ngram_POI_1) #TODO: how to get summary function output into a table?

cs_ngram_POI_2 <- cs_data[(cs_data$ngram_surp_eng > 8),]
summary(cs_ngram_POI_2)

cs_ngram_POI_3 <- cs_data[(cs_data$ngram_surp_zh < 4.5) & (cs_data$ngram_surp_zh > 4.2),]
summary(cs_ngram_POI_3)

cs_ngram_POI_4 <- cs_data[(cs_data$ngram_surp_zh < 6) & (cs_data$ngram_surp_zh > 5.7),]
summary(cs_ngram_POI_4)

cs_ngram_POI_5 <- cs_data[(cs_data$ngram_surp_zh < 7.5) & (cs_data$ngram_surp_zh > 7.2),]

cs_dep_POI_1 <- cs_data[(cs_data$dep_surp_eng > 8.5),]
summary(cs_dep_POI_1) #TODO: how to get summary function output into a table?

cs_dep_POI_2 <- cs_data[(cs_data$dep_surp_eng < 1) & (cs_data$dep_surp_zh < 1),]
summary(cs_dep_POI_2)

non_cs_ngram_POI_1 <- non_cs_data[(non_cs_data$ngram_surp_eng < 0.5),]
summary(non_cs_ngram_POI_1) #TODO: how to get summary function output into a table?

non_cs_ngram_POI_2 <- non_cs_data[(non_cs_data$ngram_surp_zh < 0.5),]
summary(non_cs_ngram_POI_2)

non_cs_ngram_POI_3 <- non_cs_data[(non_cs_data$ngram_surp_eng > 8),]
summary(non_cs_ngram_POI_3)

non_cs_ngram_POI_4 <- non_cs_data[(non_cs_data$ngram_surp_zh > 7),]
summary(non_cs_ngram_POI_4)

non_cs_ngram_POI_5 <- non_cs_data[(non_cs_data$ngram_surp_eng < 3.5) & (non_cs_data$ngram_surp_eng > 3.4) & (non_cs_data$ngram_surp_zh > 5),]
summary(non_cs_ngram_POI_5)

non_cs_ngram_POI_6 <- non_cs_data[(non_cs_data$ngram_surp_zh < 4.6) & (non_cs_data$ngram_surp_zh > 4.3) & (non_cs_data$ngram_surp_eng > 2) & (non_cs_data$ngram_surp_eng < 7),]
summary(non_cs_ngram_POI_6)

non_cs_dep_POI <- non_cs_data[(non_cs_data$dep_surp_eng < 1) & (non_cs_data$dep_surp_zh < 1),]
summary(non_cs_dep_POI) #TODO: how to get summary function output into a table?
#do.call(cbind, lapply(non_cs_dep_POI, summary))
