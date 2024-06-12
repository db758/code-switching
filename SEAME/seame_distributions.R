#loading data
setwd("/Users/Debasmita/Desktop/code-switching/SEAME")
library(MASS)
library(astrolibR)

cs_data <- read.csv(file = "seame_with_eng2_zh2_translations_no_todos_fixed_surps.csv")
head(cs_data)
non_cs_data <- read.csv(file = "seame_non_cs_data.csv")
head(non_cs_data)

#################################################################################
#restricted set analysis for jml

restricted_text <- read.csv("restricted_set_jml.csv")
restricted_text_zh <- restricted_text$speexh_zh
restricted_text_zh <- na.omit(restricted_text_zh)
head(restricted_text_zh)

cs_text_zh <- cs_data$cs.word.zh.h5.surprisal
cs_text_zh <- na.omit(cs_text_zh)
head(cs_text_zh)

fig_data <-data.frame(Surprisal=c(restricted_text_zh, cs_text_zh),Grp=rep(c("Restricted Non-CS Zh","CS CS1 Zh"),times=c(length(restricted_text_zh), length(cs_text_zh))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue"), notch=TRUE)

#################################################################################
#restricted AND grouped set analysis for jml

restricted_text <- read.csv("restricted_set_jml.csv")
restricted_text_zh <- restricted_text$grouped_zh_non_cs_speech
restricted_text_zh <- na.omit(restricted_text_zh)
head(restricted_text_zh)

cs_text_zh <- restricted_text$grouped_zh_cs_speech
cs_text_zh <- na.omit(cs_text_zh)
head(cs_text_zh)

fig_data <-data.frame(Surprisal=c(restricted_text_zh, cs_text_zh),Grp=rep(c("Restricted Non-CS Zh","CS CS1 Zh"),times=c(length(restricted_text_zh), length(cs_text_zh))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue"), notch=TRUE)

#################################################################################

# comparing "code-switch" points in code-switched data versus non-code-switched data
# there are no pre-identified "code switch" points in the non-cs data, so we use:
# 1) a randomly selected non-cs word; 2) the mean of all words in the non-cs sentence

cs1_zh_surp_og <- cs_data$cs.word.zh.h5.surprisal #6171
cs1_zh_surp_wbw <- cs_data$cs.word.zh.wbw.h5.surprisal #6171

random_non_cs <- non_cs_data$random.word.hub5.surprisal #22773
mean_non_cs <- non_cs_data$mean.hub5.surprisal #22773

fig_data <-data.frame(Surprisal=c(cs1_zh_surp_og, random_non_cs),Grp=rep(c("Zh CS1 Original","Random Monolingual Zh"),times=c(6171, 22773)))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightblue", "lightpink"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(cs1_zh_surp_wbw, random_non_cs),Grp=rep(c("Zh CS1 WBW","Random Monolingual Zh"),times=c(6171, 22773)))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightblue", "lightpink"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(cs1_zh_surp_og, mean_non_cs),Grp=rep(c("Zh CS1 Original","Mean Monolingual Zh"),times=c(6171, 22773)))
boxplot(Surprisal~Grp,data=fig_data, col=c("blue", "lightpink"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(cs1_zh_surp_wbw, mean_non_cs),Grp=rep(c("Zh CS1 WBW","Mean Monolingual Zh"),times=c(6171, 22773)))
boxplot(Surprisal~Grp,data=fig_data, col=c("blue", "lightpink"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(cs1_zh_surp_og, random_non_cs, mean_non_cs),Grp=rep(c("Zh CS1 Original","Random Monolingual Zh", "Mean Monolingual Zh"),times=c(6171, 22773, 22773)))
boxplot(Surprisal~Grp,data=fig_data, col=c("blue", "lightblue", "lightpink"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(cs1_zh_surp_wbw, random_non_cs, mean_non_cs),Grp=rep(c("Zh CS1 WBW","Random Monolingual Zh", "Mean Monolingual Zh"),times=c(6171, 22773, 22773)))
boxplot(Surprisal~Grp,data=fig_data, col=c("blue", "lightblue", "lightpink"), notch=TRUE)

t.test(cs1_zh_surp_og, random_non_cs)
t.test(cs1_zh_surp_wbw, random_non_cs)
t.test(cs1_zh_surp_og, mean_non_cs)
t.test(cs1_zh_surp_wbw, mean_non_cs)

#ks.test(cs1_zh_surp_og)

###############################################################################

# comparing non-code-switched sents to sample of monolingual zh-wiki

other_data <- read.csv(file = "surprisals_for_distribution_analysis.csv")
wiki <- other_data$hub5_zh_sample_surp
wiki <- na.omit(wiki) #42482
length(wiki)

fig_data <-data.frame(Surprisal=c(random_non_cs, wiki),Grp=rep(c("Random Monolingual Zh","Monolingual H5 Zh"),times=c(22773, 42482)))
boxplot(Surprisal~Grp,data=fig_data, col=c("purple", "blue"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(mean_non_cs, wiki),Grp=rep(c("Mean Monolingual Zh","Monolingual H5 Zh"),times=c(22773, 42482)))
boxplot(Surprisal~Grp,data=fig_data, col=c("blue", "purple"), notch=TRUE)

t.test(random_non_cs, wiki)
t.test(mean_non_cs, wiki)

#####################################################################################
# comparing code-switched CS-1 eng to sample of monolingual eng-callhome: 
# surprisal; word length; word frequency

cs1_en_word_length <- cs_data$word_length_eng #6171
cs1_en_word_freq <- cs_data$first_cs_word_eng_freq #6171
cs1_en_surp_og <- cs_data$cs.word.en.ch.surprisal #6171
cs1_en_surp_wbw <- cs_data$cs.word.en.wbw.ch.surprisal #6171

stats <- read.csv(file = 'callhome_en_stats.csv')
wiki_en_word_length <- stats$lengths
wiki_en_word_length <- na.omit(wiki_en_word_length)
wiki_en_word_freq <- stats$frequencies
wiki_en_word_freq <- na.omit(wiki_en_word_freq)
wiki_en_surp <- other_data$callhome_en_sample_surp
wiki_en_surp <- na.omit(wiki_en_surp)

fig_data <-data.frame(Surprisal=c(cs1_en_surp_og, wiki_en_surp),Grp=rep(c("CS1 Eng Original","ML CallHome Eng"),times=c(6171, 38393)))
boxplot(Surprisal~Grp,data=fig_data, col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

fig_data <-data.frame(Surprisal=c(cs1_en_surp_wbw, wiki_en_surp),Grp=rep(c("CS1 Eng WBW","ML CallHome Eng"),times=c(6171, 38393)))
boxplot(Surprisal~Grp,data=fig_data, col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

fig_data <-data.frame(Lengths=c(cs1_en_word_length, wiki_en_word_length),Grp=rep(c("CS1 Eng","ML CallHome Eng"),times=c(6171, 34482)))
boxplot(Lengths~Grp,data=fig_data, col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

summary(cs1_en_word_length)
summary(wiki_en_word_length)

fig_data <-data.frame(Frequencies=c(cs1_en_word_freq, wiki_en_word_freq),Grp=rep(c("CS1 Eng","ML CallHome Eng"),times=c(6171, 34482)))
boxplot(Frequencies~Grp,data=fig_data, col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)


t.test(cs1_en_surp_og, wiki_en_surp)
t.test(cs1_en_surp_wbw, wiki_en_surp)
t.test(cs1_en_word_length, wiki_en_word_length)
t.test(cs1_en_word_freq, wiki_en_word_freq)

cs1_en_pos <- cs_data$first_cs_word_eng_pos
table(cs1_en_pos)
callhome_pos <- stats$POS
table(callhome_pos)


##############################################################################
# comparing "normalized" eng cs1 to "normalized" zh cs1

mean_eng <- mean(wiki_en_surp)
print(mean_eng)

mean_zh <- mean(wiki)
print(mean_zh)

new_cs_eng <- cs1_en_surp_og/mean_eng
head(cs1_en_surp_og)
head(new_cs_eng)

new_cs_zh <- cs1_zh_surp_og/mean_zh
head(cs1_zh_surp_og)
head(new_cs_zh)

mean_data <- data.frame(new_cs_eng, new_cs_zh)
boxplot(as.data.frame(mean_data), names = c("CS-1 Eng Original/Mean(ML CH Eng)", "CS-1 Zh Original/Mean(ML H5 Zh)"), ylab="Ratio of surprisals", col=c("magenta", "lightpink"), notch=TRUE)

t.test(new_cs_eng, new_cs_zh)

new_cs_eng <- cs1_en_surp_wbw/mean_eng
new_cs_zh <- cs1_zh_surp_wbw/mean_zh

mean_data <- data.frame(new_cs_eng, new_cs_zh)
boxplot(as.data.frame(mean_data), names = c("CS-1 Eng WBW/Mean(ML CV Eng)", "CS-1 Zh WBW/Mean(ML CV Zh)"), ylab="Ratio of surprisals", col=c("magenta", "lightpink"), notch=TRUE)

t.test(new_cs_eng, new_cs_zh)

new_cs_eng <- cs1_en_surp_og/mean_eng
new_cs_zh <- cs1_zh_surp_wbw/mean_zh

mean_data <- data.frame(new_cs_eng, new_cs_zh)
boxplot(as.data.frame(mean_data), names = c("CS-1 Eng Original/Mean(ML CV Eng)", "CS-1 Zh WBW/Mean(ML CV Zh)"), ylab="Ratio of surprisals", col=c("magenta", "lightpink"), notch=TRUE)

t.test(new_cs_eng, new_cs_zh)

new_cs_eng <- cs1_en_surp_wbw/mean_eng
new_cs_zh <- cs1_zh_surp_og/mean_zh

mean_data <- data.frame(new_cs_eng, new_cs_zh)
boxplot(as.data.frame(mean_data), names = c("CS-1 Eng WBW/Mean(ML CV Eng)", "CS-1 Zh Original/Mean(ML CV Zh)"), ylab="Ratio of surprisals", col=c("magenta", "lightpink"), notch=TRUE)

t.test(new_cs_eng, new_cs_zh)

summary(new_cs_eng)
summary(new_cs_zh)

####################################################################################

# checking distribution of sentence lengths, comparing code-switched sentences to monolingual ones
# to justify dropping sentence length from regressions (we see code-switches occurring in longer sentences)
# regressions: given that code-switches occur in longer sentences, do they occur later in those longer sentences?

cs_sentence_lengths <- cs_data$length_of_turn #6171
length(cs_sentence_lengths)
non_cs_sentence_lengths <- non_cs_data$length_of_turn #22773
length(non_cs_sentence_lengths)

fig_data <-data.frame(SentenceLengths=c(cs_sentence_lengths, non_cs_sentence_lengths),Grp=rep(c("CS","ML Zh"),times=c(6171, 22773)))
boxplot(SentenceLengths~Grp,data=fig_data, col=c("pink", "lightblue"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

t.test(cs_sentence_lengths, non_cs_sentence_lengths)
