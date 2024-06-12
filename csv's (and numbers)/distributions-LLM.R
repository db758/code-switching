#loading data
setwd("/Users/Debasmita/Desktop/code-switching/csv's (and numbers)")
library(MASS)
library(astrolibR)

cs_data <- read.csv(file = "redoing_cs_data.csv")
head(cs_data)
non_cs_data <- read.csv(file = "non_cs_sentences_full.csv")
head(non_cs_data)

other_data <- read.csv(file = "surprisals_for_distribution_analysis.csv")
A <- other_data$non_cs_sentences_llm_surps
A <- na.omit(A)
head(A)

random_non_cs_data <- read.csv("new_random_non_cs_1_data.csv")
head(random_non_cs_data)
random_non_cs_data_new <- random_non_cs_data[!(random_non_cs_data$cs_word_length_zh>=5),]
head(random_non_cs_data_new)

non_cs_cs1_length <- non_cs_data$cs_word_length_zh
random_non_cs_non_cs1_length <- random_non_cs_data_new$cs_word_length_zh

summary(non_cs_cs1_length)
summary(random_non_cs_non_cs1_length)
#################################################################################

# comparing "code-switch" points in code-switched data versus non-code-switched data
code_switched_cs_surp <- cs_data$llm_surp_zh
head(code_switched_cs_surp)
code_switched_non_cs_surp <- non_cs_data$llm_surp_zh
head(code_switched_non_cs_surp)

c1 <- rgb(173,216,230,max = 255, alpha = 80, names = "lt.blue")
c2 <- rgb(255,192,203, max = 255, alpha = 80, names = "lt.pink")
c3 <- rgb(255, 255, 0, max=255, alpha = 80, names = "lt.yellow")

length(code_switched_cs_surp)
length(code_switched_non_cs_surp)
length(A)

fig_data <-data.frame(Surprisal=c(code_switched_cs_surp, code_switched_non_cs_surp, A),Grp=rep(c("CS CS1","Non-CS CS1", "Non-CS"),times=c(1476, 1476,length(A))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue", "lightblue"), notch=TRUE)

t.test(code_switched_cs_surp, code_switched_non_cs_surp)
t.test(code_switched_cs_surp, A)
t.test(code_switched_non_cs_surp, A)

###############################################################################

B <- other_data$cs_sentences_before_cs_surp
B <- na.omit(B)
C <- other_data$cs_sentences_cs_back_surp
C <- na.omit(C)
D <- other_data$cs_sentences_after_cs_surp
D <- na.omit(D)
wiki <- other_data$sample_zhwiki_surp
wiki <- na.omit(wiki)
pre <- other_data$cs_sentences_word_before_cs
pre <- na.omit(pre)
pre_cs2 <- other_data$cs_sentences_word_before_cs_back
pre_cs2 <- na.omit(pre_cs2)
wiki_eng <- other_data$sample_engwiki_surp
wiki_eng <- na.omit(wiki_eng)
types_eng <- other_data$types_eng
types_eng <- na.omit(types_eng)
types_zh <- other_data$types_zh
types_zh <- na.omit(types_zh)
google_translated_cs_eng <- cs_data$gt_ngram_surp_eng
google_translated_cs_eng <- na.omit(google_translated_cs_eng)
google_translated_non_cs_eng <- non_cs_data$gt_ngram_surp_eng
google_translated_non_cs_eng <- na.omit(google_translated_non_cs_eng)

code_switched_cs_surp <- cs_data$llm_surp_zh
code_switched_non_cs_surp <- non_cs_data$llm_surp_zh

# comparing non-code-switched sents to sample of monolingual zh-wiki


#TODO: redo surps from llm for wiki
wiki_llm <- other_data$sample_zhwiki_llm_surp
wiki_llm <- na.omit(wiki_llm)

length(A)
length(wiki_llm)

fig_data <-data.frame(Surprisal=c(A, wiki_llm),Grp=rep(c("Non-CS","Monolingual (zh)"),times=c(length(A), length(wiki_llm))))
boxplot(Surprisal~Grp,data=fig_data, col=c("purple", "blue"), notch=TRUE)

t.test(A, wiki_llm)

#####################################################################################

# comparing code-switched CS-1 eng to sample of monolingual eng-wiki

wiki_eng_llm <- other_data$sample_engwiki_llm_surp
wiki_eng_llm <- na.omit(wiki_eng_llm)
summary(wiki_eng_llm)
summary(wiki_eng)

fig_data <-data.frame(Surprisal=c(cs_data$llm_surp_eng, wiki_eng_llm),Grp=rep(c("CS1 Eng","ML Eng"),times=c(1476, length(wiki_eng_llm))))
boxplot(Surprisal~Grp,data=fig_data, col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

t.test(cs_data$llm_surp_eng, wiki_eng_llm)

##############################

mean_eng <- mean(wiki_eng_llm)
print(mean_eng)

mean_zh <- mean(wiki_llm)
print(mean_zh)

new_cs_eng <- cs_data$llm_surp_eng/mean_eng
head(cs_data$llm_surp_eng)
head(new_cs_eng)

new_cs_zh <- cs_data$llm_surp_zh/mean_zh
head(cs_data$llm_surp_zh)
head(new_cs_zh)

mean_data <- data.frame(new_cs_eng, new_cs_zh)
boxplot(as.data.frame(mean_data), names = c("CS-1 Eng/Mean(ML Eng)", "CS-1 Zh/Mean(ML Zh)"), ylab="Ratio of surprisals", col=c("magenta", "lightpink"), notch=TRUE)


summary(new_cs_eng)
summary(new_cs_zh)
