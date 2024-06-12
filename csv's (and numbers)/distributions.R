#loading data
setwd("/Users/Debasmita/Desktop/code-switching/csv's (and numbers)")
library(MASS)
library(astrolibR)

cs_data <- read.csv(file = "redoing_cs_data.csv")
head(cs_data)
non_cs_data <- read.csv(file = "non_cs_sentences_full.csv")
head(non_cs_data)

calvillo_cs_data <- read.csv(file = "redoing_cs_data_with_calvillo_ngram_surp_zh.csv")
calvillo_non_cs_data <- read.csv(file = "non_cs_sentences_full_with_calvillo_ngram_surp_zh.csv")

other_data <- read.csv(file = "surprisals_for_distribution_analysis.csv")
A <- other_data$non_cs_sentences_surps
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
#restricted sets analysis for jml

restricted_text <- read.csv("restricted_sets_jml.csv")
restricted_text_eng <- restricted_text$eng_text
restricted_text_eng <- na.omit(restricted_text_eng)
restricted_text_zh <- restricted_text$zh_text
restricted_text_zh <- na.omit(restricted_text_zh)

cs_text_eng <- cs_data$ngram_surp_eng
cs_text_eng <- na.omit(cs_text_eng)
cs_text_zh <- cs_data$ngram_surp_zh
cs_text_zh <- na.omit(cs_text_zh)

fig_data <-data.frame(Surprisal=c(restricted_text_eng, cs_text_eng),Grp=rep(c("Restricted Non-CS Eng","CS CS1 Eng"),times=c(length(restricted_text_eng), length(cs_text_eng))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(restricted_text_zh, cs_text_zh),Grp=rep(c("Restricted Non-CS Zh","CS CS1 Zh"),times=c(length(restricted_text_zh), length(cs_text_zh))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue"), notch=TRUE)

#################################################################################
#restricted AND grouped sets analysis for jml

restricted_text <- read.csv("restricted_sets_jml.csv")
restricted_text_eng <- restricted_text$grouped_eng_non_cs_text
restricted_text_eng <- na.omit(restricted_text_eng)
restricted_text_zh <- restricted_text$grouped_zh_non_cs_text
restricted_text_zh <- na.omit(restricted_text_zh)

cs_text_eng <- restricted_text$grouped_eng_cs_text
cs_text_eng <- na.omit(cs_text_eng)
cs_text_zh <- restricted_text$grouped_zh_cs_text
cs_text_zh <- na.omit(cs_text_zh)

fig_data <-data.frame(Surprisal=c(restricted_text_eng, cs_text_eng),Grp=rep(c("Restricted Non-CS Eng","CS CS1 Eng"),times=c(length(restricted_text_eng), length(cs_text_eng))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue"), notch=TRUE)

fig_data <-data.frame(Surprisal=c(restricted_text_zh, cs_text_zh),Grp=rep(c("Restricted Non-CS Zh","CS CS1 Zh"),times=c(length(restricted_text_zh), length(cs_text_zh))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue"), notch=TRUE)

#################################################################################

# comparing "code-switch" points in code-switched data versus non-code-switched data
code_switched_cs_surp <- cs_data$ngram_surp_zh
head(code_switched_cs_surp)
code_switched_non_cs_surp <- non_cs_data$ngram_surp_zh
head(code_switched_non_cs_surp)

c1 <- rgb(173,216,230,max = 255, alpha = 80, names = "lt.blue")
c2 <- rgb(255,192,203, max = 255, alpha = 80, names = "lt.pink")
c3 <- rgb(255, 255, 0, max=255, alpha = 80, names = "lt.yellow")

x <- code_switched_cs_surp
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(code_switched_cs_surp, border = FALSE, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", lwd = 2, add = TRUE)

x <- code_switched_non_cs_surp
fit2 <- fitdistr(x, "normal")
class(fit2)
para2 <- fit2$estimate
#hist(code_switched_non_cs_surp, border = FALSE, prob = TRUE, add=TRUE)
curve(dnorm(x, para2[1], para2[2]), col = "lightblue", lwd = 2, add = TRUE)

x <- A
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
#hist(A, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "blue", lwd = 2, add = TRUE)

legend("topleft", c("CS CS-1", "Non-CS CS-1", "Non-CS"), fill=c("lightpink", "lightblue", "blue"))

length(code_switched_cs_surp)
length(code_switched_non_cs_surp)
length(A)

fig_data <-data.frame(Surprisal=c(code_switched_cs_surp, code_switched_non_cs_surp, A),Grp=rep(c("CS CS1","Non-CS CS1", "Non-CS"),times=c(1476, 1476,13777)))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "blue", "lightblue"), notch=TRUE)

t.test(code_switched_cs_surp, code_switched_non_cs_surp)
t.test(code_switched_cs_surp, A)
t.test(code_switched_non_cs_surp, A)

###############################################################################

# comparing "code-switch" points in calvillo code-switched data versus calvillo non-code-switched data
#code_switched_cs_surp <- calvillo_cs_data$ngram_surp_zh
#code_switched_non_cs_surp <- calvillo_non_cs_data$ngram_surp_zh
#calvillo_non_cs_1 <- other_data$calvillo_non_cs_1
#calvillo_non_cs_1 <- na.omit(calvillo_non_cs_1)

#c1 <- rgb(173,216,230,max = 255, alpha = 80, names = "lt.blue")
#c2 <- rgb(255,192,203, max = 255, alpha = 80, names = "lt.pink")
#c3 <- rgb(255, 255, 0, max=255, alpha = 80, names = "lt.yellow")

#x <- code_switched_cs_surp
#fit1 <- fitdistr(x, "normal")
#class(fit1)
#para1 <- fit1$estimate
#hist(code_switched_cs_surp, border=FALSE, prob = TRUE)
#curve(dnorm(x, para1[1], para1[2]), col = "lightpink", add = TRUE)

#x <- code_switched_non_cs_surp
#fit2 <- fitdistr(x, "normal")
#class(fit2)
#para2 <- fit2$estimate
#hist(code_switched_non_cs_surp, col = c1, prob = TRUE, add=TRUE)
#curve(dnorm(x, para2[1], para2[2]), col = "lightblue", add = TRUE)

#x <- calvillo_non_cs_1
#fit2 <- fitdistr(x, "normal")
#class(fit2)
#para2 <- fit2$estimate
#hist(calvillo_non_cs_1, col = c1, prob = TRUE, add=TRUE)
#curve(dnorm(x, para2[1], para2[2]), col = "blue", add = TRUE)

#legend("topright", c("Cal. CS CS-1", "Cal. Non-CS CS-1", "Cal. Non-CS Non-CS-1"), fill=c("lightpink", "lightblue", "blue"))

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
gt_after_cs <- other_data$google_trans_after_cs_surp
gt_after_cs <- na.omit(gt_after_cs)
fy_after_cs <- other_data$fanyi_trans_after_cs_surp
fy_after_cs <- na.omit(fy_after_cs)

code_switched_cs_surp <- cs_data$ngram_surp_zh
code_switched_non_cs_surp <- non_cs_data$ngram_surp_zh

# comparing non-code-switched sents to sample of monolingual zh-wiki
x <- A
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(A, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "blue", lwd = 2, add = TRUE)

x <- wiki
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(wiki, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "purple", lwd = 2, add = TRUE)

legend("topright", c("Non-CS", "Monolingual Zh"), fill=c("blue", "purple"))

length(A)
length(wiki)
fig_data <-data.frame(Surprisal=c(A, wiki),Grp=rep(c("Non-CS","Monolingual (zh)"),times=c(13777, 136481)))
boxplot(Surprisal~Grp,data=fig_data, col=c("purple", "blue"), notch=TRUE)

t.test(A, wiki)

###############################################################################
# comparing region after code-switch between machine and human translations

fig_data <-data.frame(Surprisal=c(D, gt_after_cs, fy_after_cs),Grp=rep(c("Human: Post-CS","GT: Post-CS", "FY: Post-CS"),times=c(length(D), length(gt_after_cs), length(fy_after_cs))))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "purple", "blue"))

##################################################################################

# comparing code-switched CS-1 zh to sample of monolingual zh-wiki

x <- code_switched_cs_surp
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(code_switched_cs_surp, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "lightpink", lwd = 2, add = TRUE)

x <- wiki
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(wiki, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "purple", lwd = 2, add = TRUE)

legend("topleft", c("CS CS-1 Zh", "Monolingual Zh"), fill=c("lightpink", "purple"))

t.test(code_switched_cs_surp, wiki)

length(wiki)
fig_data <-data.frame(Surprisal=c(code_switched_cs_surp, wiki),Grp=rep(c("CS CS1 (zh)","Monolingual (zh)"),times=c(1476, 136481)))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "purple"))

#####################################################################################

# comparing code-switched CS-1 eng to sample of monolingual eng-wiki

x <- na.omit(other_data$ngram_surp_eng)
length(x)
head(x)
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(cs_data$ngram_surp_eng, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "magenta", lwd = 2, add = TRUE)

x <- wiki_eng
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(wiki_eng, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "purple", lwd = 2, add = TRUE)

legend("bottomleft", c("CS CS-1 Eng", "Monolingual Eng"), fill=c("magenta", "purple"))

t.test(cs_data$ngram_surp_eng, wiki_eng)

length(na.omit(other_data$ngram_surp_eng))
length(wiki_eng)

fig_data <-data.frame(Surprisal=c(cs_data$ngram_surp_eng, wiki_eng),Grp=rep(c("CS1 Eng","ML Eng"),times=c(1476, 241211)))
boxplot(Surprisal~Grp,data=fig_data, col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

fig_data <-data.frame(Surprisal=c(cs_data$ngram_surp_eng, google_translated_cs_eng, wiki_eng),Grp=rep(c("FY CS1 Eng","GT CS1 Eng", "ML Eng"),times=c(1476, 1476, 241211)))
boxplot(Surprisal~Grp,data=fig_data, col=c("magenta", "white", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

jargon_df <- read.csv('jargon_terms.csv')
jargon_surp_eng <- jargon_df$ngram_surp_eng

fig_data <-data.frame(Surprisal=c(jargon_surp_eng, wiki_eng),Grp=rep(c("Jargon Eng","ML Eng"),times=c(379, 241211)))
boxplot(Surprisal~Grp,data=fig_data, col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

fig_data <-data.frame(Surprisal=c(cs_data$ngram_surp_eng, jargon_surp_eng, wiki_eng),Grp=rep(c("CS1 Eng", "Jargon Eng","ML Eng"),times=c(1476, 379, 241211)))
boxplot(Surprisal~Grp,data=fig_data, col=c("magenta", "white", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

##############################

mean_eng <- mean(wiki_eng)
print(mean_eng)

mean_zh <- mean(wiki)
print(mean_zh)

new_cs_eng <- cs_data$ngram_surp_eng/mean_eng
head(cs_data$ngram_surp_eng)
head(new_cs_eng)

new_cs_zh <- cs_data$ngram_surp_zh/mean_zh
head(calvillo_cs_data$ngram_surp_zh)
head(new_cs_zh)

gt_cs_eng <- google_translated_cs_eng/mean_eng

x <- new_cs_zh
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(new_cs_zh, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "purple", lwd = 2, add=TRUE)

x <- new_cs_eng
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(new_cs_eng, border = FALSE, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "magenta", lwd = 2, add = TRUE)

legend("topleft", c("CS-1 Eng/Mean(ML Eng)", "CS-1 Zh/Mean(ML Zh)"), fill=c("magenta", "purple"))

#mean_data <- data.frame(new_cs_eng, new_cs_zh)
#boxplot(as.data.frame(mean_data), names = c("CS-1 Eng/Mean(ML Eng)", "CS-1 Zh/Mean(ML Zh)"), ylab="Ratio of surprisals", col=c("magenta", "lightpink"), notch=TRUE)

mean_data <- data.frame(new_cs_eng, gt_cs_eng, new_cs_zh)
boxplot(as.data.frame(mean_data), names = c("FY CS-1 Eng/Mean(ML Eng)", "GT CS-1 Eng/Mean(ML Eng)", "CS-1 Zh/Mean(ML Zh)"), ylab="Ratio of surprisals", col=c("magenta", "white", "lightpink"), notch=TRUE)

summary(new_cs_eng)
summary(new_cs_zh)

####################################################################################

# type analysis 

mean_eng <- mean(wiki_eng)
print(mean_eng)

mean_zh <- mean(wiki)
print(mean_zh)

new_cs_eng <- types_eng/mean_eng
new_cs_zh <- types_zh/mean_zh

x <- new_cs_eng
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(A, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "magenta", lwd = 2, add=TRUE)

x <- new_cs_zh
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(new_cs_zh, border = FALSE, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "purple", lwd = 2, add = TRUE)

legend("topright", c("Types CS-1 Eng/Mean(ML Eng)", "Types CS-1 Zh/Mean(ML Zh)"), fill=c("magenta", "purple"))

mean_data <-data.frame(X=c(new_cs_eng,new_cs_zh),Grp=rep(c("Ratio Eng","Ratio Zh"),times=c(414,538)))
#mean_data <- data.frame(new_cs_eng, new_cs_zh)
#boxplot(as.data.frame(mean_data))
boxplot(X~Grp,data=mean_data)

summary(new_cs_eng)
summary(new_cs_zh)

##################################

mean_eng <- mean(wiki_eng)
print(mean_eng)

mean_zh <- mean(A)
print(mean_zh)

new_cs_eng <- types_eng/mean_eng
new_cs_zh <- types_zh/mean_zh

x <- new_cs_eng
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(A, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "magenta", lwd = 2, add=TRUE)

x <- new_cs_zh
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(new_cs_zh, border = FALSE, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "purple", lwd = 2, add = TRUE)

legend("topright", c("Types CS-1 Eng/Mean(ML Eng)", "Types CS-1 Zh/Mean(Non-CS-1)"), fill=c("magenta", "purple"))

mean_data <-data.frame(X=c(new_cs_eng,new_cs_zh),Grp=rep(c("Ratio Eng","Ratio Zh"),times=c(414,538)))
#mean_data <- data.frame(new_cs_eng, new_cs_zh)
#boxplot(as.data.frame(mean_data))
boxplot(X~Grp,data=mean_data)

summary(new_cs_eng)
summary(new_cs_zh)

########################

mean_eng <- mean(wiki_eng)
print(mean_eng)

mean_zh <- mean(calvillo_non_cs_1)
print(mean_zh)

new_cs_eng <- types_eng/mean_eng
new_cs_zh <- types_zh/mean_zh

x <- new_cs_eng
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(A, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "magenta", lwd = 2, add=TRUE)

x <- new_cs_zh
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(new_cs_zh, border = FALSE, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "purple", lwd = 2, add = TRUE)

legend("topright", c("Types CS-1 Eng/Mean(ML Eng)", "Types CS-1 Zh/Mean(Cal. Non-CS-1)"), fill=c("magenta", "purple"))

mean_data <-data.frame(X=c(new_cs_eng,new_cs_zh),Grp=rep(c("Ratio Eng","Ratio Zh"),times=c(414,538)))
#mean_data <- data.frame(new_cs_eng, new_cs_zh)
#boxplot(as.data.frame(mean_data))
boxplot(X~Grp,data=mean_data)

summary(new_cs_eng)
summary(new_cs_zh)

################################

mean_eng <- mean(wiki_eng)
print(mean_eng)

mean_zh <- mean(calvillo_non_cs_1)
print(mean_zh)

new_cs_eng <- types_eng/mean_eng
new_cs_zh <- calvillo_cs_data$ngram_surp_zh/mean_zh

x <- new_cs_eng
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(A, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "magenta", lwd = 2, add=TRUE)

x <- new_cs_zh
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
#hist(new_cs_zh, border = FALSE, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "purple", lwd = 2, add = TRUE)

legend("topright", c("Types CS-1 Eng/Mean(ML Eng)", "Cal. CS-1 Zh/Mean(Cal. Non-CS-1)"), fill=c("magenta", "purple"))

mean_data <-data.frame(X=c(new_cs_eng,new_cs_zh),Grp=rep(c("Ratio Eng","Ratio Zh"),times=c(414,1476)))
#mean_data <- data.frame(new_cs_eng, new_cs_zh)
#boxplot(as.data.frame(mean_data))
boxplot(X~Grp,data=mean_data)

summary(new_cs_eng)
summary(new_cs_zh)

# comparing non-code-switched points before and after code-switch points in code-switched sents 
# to non-code-switch points in non-code-switched sents 
# later, comparisons to code-switch points in code-switched and non-code-switched sents 

x <- code_switched_cs_surp
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(code_switched_cs_surp, border=FALSE, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", lwd = 2, add = TRUE)

x <- code_switched_non_cs_surp
fit2 <- fitdistr(x, "normal")
class(fit2)
para2 <- fit2$estimate
#hist(code_switched_non_cs_surp, col = "lightgreen", prob = TRUE, add=TRUE)
curve(dnorm(x, para2[1], para2[2]), col = "lightblue", lwd = 2, add = TRUE)

x <- A
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
#hist(A, border = FALSE, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "blue", lwd = 2, add = TRUE)

x <- B
fitB <- fitdistr(x, "normal")
class(fitB)
paraB <- fitB$estimate
#hist(B, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, paraB[1], paraB[2]), col = "lightgreen", lwd = 2, add = TRUE)

#x <- D
#fitD <- fitdistr(x, "normal")
#class(fitD)
#paraD <- fitD$estimate
##hist(D, col = c1, prob = TRUE, add=TRUE)
#curve(dnorm(x, paraD[1], paraD[2]), col = "red", lwd = 2, add = TRUE)

legend("topright", c("Non-CS", "CS Pre-CS-1", "Non-CS CS-1", "CS CS-1"), fill=c("blue", "lightgreen", "lightblue", "lightpink"))

length(B)
length(D)
length(C)

fig_data <-data.frame(Surprisal=c(code_switched_cs_surp, code_switched_non_cs_surp, A, B, C, D),Grp=rep(c("CS CS1","Non-CS CS1", "Non-CS", "Pre-CS", "CS CS2", "Post-CS"),times=c(1476, 1476,13777,6235, 1128, 7542)))
fig_data$Grp <- factor(fig_data$Grp, levels=c("Non-CS", "Non-CS CS1", "CS CS1", "Pre-CS", "CS CS2", "Post-CS"))
boxplot(Surprisal~Grp,data=fig_data, col=c("blue","lightblue", "lightpink","lightgreen", "orange", "red"), notch=TRUE)

length(A)
fig_data <-data.frame(Surprisal=c(A, code_switched_non_cs_surp, code_switched_cs_surp, C),Grp=rep(c("Non-CS", "Non-CS CS1", "CS CS1", "CS CS2"),times=c(13777,1476,1476,1128)))
fig_data$Grp <- factor(fig_data$Grp, levels=c("Non-CS", "Non-CS CS1", "CS CS1", "CS CS2"))
#fig_data <- factor(fig_data , levels=c("Non-CS", "Non-CS CS1", "CS CS1", "Pre-CS", "CS CS2", "Post-CS"))
boxplot(Surprisal~Grp,data=fig_data, col=c("blue","lightblue", "lightpink", "orange"), notch=TRUE)

t.test(A, D)
t.test(A, B)
t.test(B, D)
t.test(C, code_switched_cs_surp)
t.test(A, code_switched_cs_surp)
#########################################################################

# comparing code-switch back point (cs-2) to code-switch point in code-switched sents
x <- code_switched_cs_surp
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(code_switched_cs_surp, col = c2, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", add = TRUE)

x <- C
fitC <- fitdistr(x, "normal")
class(fitC)
paraC <- fitC$estimate
hist(C, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, paraC[1], paraC[2]), col = "lightblue", add = TRUE)

legend("topleft", c("CS CS-1", "CS CS-2"), fill=c("lightpink", "lightblue"))
#############################################################################

# comparing code-switch back point (cs-2) to "code-switch" point in non-code-switched sents

x <- code_switched_non_cs_surp
fit2 <- fitdistr(x, "normal")
class(fit2)
para2 <- fit2$estimate
hist(code_switched_non_cs_surp, col = c2, prob = TRUE)
curve(dnorm(x, para2[1], para2[2]), col = "lightpink", add = TRUE)

x <- C
fitC <- fitdistr(x, "normal")
class(fitC)
paraC <- fitC$estimate
hist(C, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, paraC[1], paraC[2]), col = "lightblue", add = TRUE)

legend("topleft", c("Non-CS CS-1", "CS CS-2"), fill=c("lightpink", "lightblue"))
##############################################################################

# surprisal of the word before the code-switched word in code-switched sentences

x <- code_switched_cs_surp
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(code_switched_cs_surp, border = FALSE, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", lwd = 2, add = TRUE)

x <- pre
fitpre <- fitdistr(x, "normal")
class(fitpre)
parapre <- fitpre$estimate
#hist(pre, col = c3, prob = TRUE, add=TRUE)
curve(dnorm(x, parapre[1], parapre[2]), col = "darkgreen", lwd = 2, add = TRUE)

x <- C
fitC <- fitdistr(x, "normal")
class(fitC)
paraC <- fitC$estimate
#hist(C, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, paraC[1], paraC[2]), col = "orange", lwd = 2, add = TRUE)

#x <- pre_cs2
#fitpre_cs2 <- fitdistr(x, "normal")
#class(fitpre_cs2)
#parapre_cs2 <- fitpre_cs2$estimate
#hist(pre_cs2, col = c1, prob = TRUE, add=TRUE)
#curve(dnorm(x, parapre_cs2[1], parapre_cs2[2]), col = "lightgreen", add = TRUE)

legend("topleft", c("CS CS-1", "CS Pre-CS-1-Word", "CS CS-2"), fill=c("lightpink", "darkgreen", "orange"))

length(pre)
length(C)

fig_data <-data.frame(Surprisal=c(code_switched_cs_surp, pre, C),Grp=rep(c("CS CS1","CS Pre-CS Word", "CS CS2"),times=c(1476, 1184,1128)))
boxplot(Surprisal~Grp,data=fig_data, col=c("lightpink", "orange", "darkgreen"))

t.test(pre, code_switched_cs_surp)
t.test(pre, C)
##############################################################################

# comparing CS-1 stats to CS-2 stats

cs1_data <- read.csv(file = "redoing_cs_data.csv")
cs2_data <- read.csv(file="full_cs_back_data.csv")

cs1 <- cs1_data[c("cs_word_pos_zh","cs_word_length_zh","zh_word_index", "word_freq_zh")]
cs2_old <- cs2_data[c("cs_word_pos_zh","cs_word_length_zh","zh_word_index", "word_freq_zh")]
cs2 <- cs2_old[!(cs2_old$cs_word_length_zh>=5),]

head(cs1)
head(cs2)

summary(cs1)
summary(cs2)

diff <- cs2$zh_word_index - cs1$zh_word_index
summary(diff)

x <- cs1$zh_word_index
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(cs1$zh_word_index, col = c2, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", add = TRUE)

x <- diff
fit2 <- fitdistr(x, "normal")
class(fit2)
para2 <- fit2$estimate
hist(diff, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, para2[1], para2[2]), col = "lightblue", add = TRUE)

legend("topright", c("CS-1 Index in Sentence", "Length of CS Span in Sentence"), fill=c("lightpink", "lightblue"))

t.test(cs1$cs_word_length_zh, cs2$cs_word_length_zh)
t.test(cs1$word_freq_zh, cs2$word_freq_zh)

##############################################################################
# retrying cs2 - cs1 differences

differences <- read.csv("cs2-cs1 distances.csv")
distances <- differences$distance

x <- distances
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
#hist(distances, col = c2, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "pink", add = TRUE)

fig_data <-data.frame(Surprisal=c(distances),Grp=rep(c("CS2-CS1"),times=c(1128)))
boxplot(Surprisal~Grp,data=fig_data, col=c("orange"))

fig_data <-data.frame(Index=c(cs1$zh_word_index, cs2$zh_word_index, distances),Grp=rep(c("CS CS1","CS CS2", "CS CS2 - CS CS1"),times=c(1476, 1123,1128)))
boxplot(Index~Grp,data=fig_data, col=c("lightpink", "orange", "darkgreen"))

fig_data <-data.frame(Position=c(differences$cs1_index, differences$cs2_index, distances),Grp=rep(c("CS CS1","CS CS2", "CS CS2 - CS CS1"),times=c(1128, 1128,1128)))
boxplot(Position~Grp,data=fig_data, col=c("lightpink", "orange", "darkgreen"), notch=TRUE)

summary(differences$cs1_index)
summary(distances)

##############################################################################

# boxplot and histogram for length

lengths <- read.csv(file = 'comparing_length_cs1_wiki_only.csv')
head(lengths)

boxplot(as.data.frame(lengths), names = c("CS1 Eng", "ML Eng"), ylab="Length of word", col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

lengths <- read.csv(file = 'comparing_length_jargon_wiki_only.csv')
head(lengths)

boxplot(as.data.frame(lengths), names = c("Jargon Eng", "ML Eng"), ylab="Length of word", col=c("magenta", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

lengths <- read.csv(file = 'comparing_length_cs1_jargon_wiki.csv')
boxplot(as.data.frame(lengths), names = c("CS1 Eng", "Jargon Eng", "ML Eng"), ylab="Length of word", col=c("magenta", "white", "purple"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)


t.test(lengths$CS.1.Eng, lengths$Wiki.Eng)
#t.test(lengths$CS.1.Eng, lengths$CS.2.Eng)
eng <- na.omit(lengths$CS.1.Eng)
length(eng)

x <- lengths$Wiki.Eng
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(lengths$Wiki.Eng, col = c3, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "yellow", add = TRUE)

x <- lengths$CS.1.Eng
x <- na.omit(x)
fitB <- fitdistr(x, "normal")
class(fitB)
paraB <- fitB$estimate
hist(lengths$CS.1.Eng, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, paraB[1], paraB[2]), col = "lightpink", add = TRUE)

x <- lengths$CS.2.Eng
x <- na.omit(x)
fitD <- fitdistr(x, "normal")
class(fitD)
paraD <- fitD$estimate
hist(lengths$CS.2.Eng, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, paraD[1], paraD[2]), col = "lightblue", add = TRUE)

legend("topright", c("Monolingual Eng", "CS-1 Eng", "CS-2 Eng"), fill=c("yellow", "lightpink", "lightblue"))
##############################################################################

# boxplot for frequency

frequencies <- read.csv(file = 'comparing_frequency.csv')
head(frequencies)

boxplot(as.data.frame(frequencies), names=c("CS-1 Eng", "CS-2 Eng", "ML Eng", "CS-1 Zh", "CS-2 Zh"),
        ylab = "Frequency of word")


eng_frequencies <- read.csv(file = 'comparing_frequencies_eng_cs1_wiki_only.csv')
head(eng_frequencies)

boxplot(as.data.frame(eng_frequencies), names=c("CS-1 Eng", "ML Eng"),
        ylab = "Frequency of word", col=c("magenta", "purple"))

eng_cs <- eng_frequencies$CS.1.Eng
eng_cs <- na.omit(eng_cs)
eng_ml <- eng_frequencies$Monolingual.Eng
eng_ml <- na.omit(eng_ml)
length(eng_cs)
length(eng_ml)

fig_data <-data.frame(Freq=c(eng_cs, eng_ml),Grp=rep(c("CS1 Eng","ML Eng"),times=c(1097, 5000)))
boxplot(Freq~Grp,data=fig_data, col=c("magenta", "purple"), ylab = "Frequency of word", notch=TRUE, boxwex=0.5, cex.lab = 1.3, cex.axis = 1.2)
t.test(eng_cs, eng_ml)


jargon_frequencies <- read.csv(file = 'comparing_frequencies_eng_jargon_wiki_only.csv')
head(jargon_frequencies)

boxplot(as.data.frame(jargon_frequencies), names=c("Jargon Eng", "ML Eng"),
        ylab = "Frequency of word", col=c("magenta", "purple"))



eng_jargon <- jargon_frequencies$Jargon.Eng
eng_jargon <- na.omit(eng_jargon)
eng_ml <- jargon_frequencies$Monolingual.Eng
eng_ml <- na.omit(eng_ml)
length(eng_jargon)
length(eng_ml)

fig_data <-data.frame(Freq=c(eng_jargon, eng_ml),Grp=rep(c("Jargon Eng","ML Eng"),times=c(379, 5000)))
boxplot(Freq~Grp,data=fig_data, col=c("magenta", "purple"), ylab = "Frequency of word", notch=TRUE, boxwex=0.5, cex.lab = 1.3, cex.axis = 1.2)
t.test(eng_jargon, eng_ml)

fig_data <-data.frame(Freq=c(eng_cs, eng_jargon, eng_ml),Grp=rep(c("CS1 Eng", "Jargon Eng","ML Eng"),times=c(1097, 379, 5000)))
boxplot(Freq~Grp,data=fig_data, col=c("magenta", "white", "purple"), ylab = "Frequency of word", notch=TRUE, boxwex=0.5, cex.lab = 1.3, cex.axis = 1.2)


unique_frequencies <- read.csv(file = 'without_duplicates_frequencies.csv')
head(unique_frequencies)
eng_cs <- unique_frequencies$CS.1.Eng
eng_cs <- na.omit(eng_cs)
eng_ml <- unique_frequencies$Monolingual.Eng
eng_ml <- na.omit(eng_ml)

length(eng_cs)
length(eng_ml)

fig_data <-data.frame(Freq=c(eng_cs, eng_ml),Grp=rep(c("CS1 Eng","ML Eng"),times=c(402, 1654)))
boxplot(Freq~Grp,data=fig_data, col=c("magenta", "purple"), ylab = "Frequency of word", notch=TRUE)

t.test(eng_cs, eng_ml)

t.test(frequencies$CS.2.Eng, frequencies$Monolingual.Eng)
t.test(frequencies$CS.1.Eng, frequencies$CS.2.Eng)
t.test(frequencies$CS.1.Eng, frequencies$Monolingual.Eng)
t.test(frequencies$CS.1.Zh, frequencies$CS.2.Zh)

x <- frequencies$Monolingual.Eng
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(frequencies$Monolingual.Eng, col = c3, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "yellow", add = TRUE)

x <- frequencies$CS.1.Eng
x <- na.omit(x)
fitB <- fitdistr(x, "normal")
class(fitB)
paraB <- fitB$estimate
hist(frequencies$CS.1.Eng, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, paraB[1], paraB[2]), col = "lightpink", add = TRUE)

x <- frequencies$CS.2.Eng
x <- na.omit(x)
fitD <- fitdistr(x, "normal")
class(fitD)
paraD <- fitD$estimate
hist(frequencies$CS.2.Eng, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, paraD[1], paraD[2]), col = "lightblue", add = TRUE)

legend("topright", c("Monolingual Eng", "CS-1 Eng", "CS-2 Eng"), fill=c("yellow", "lightpink", "lightblue"))

##############################################################################
# checking distribution of sentence lengths, comparing code-switched sentences to monolingual ones
# to justify dropping sentence length from regressions (we see code-switches occurring in longer sentences)
# regressions: given that code-switches occur in longer sentences, do they occur later in those longer sentences?

cs_sentence_lengths <- cs_data$sentence_length_zh
length(cs_sentence_lengths)
non_cs_sentence_lengths <- non_cs_data$sentence_length_zh
length(non_cs_sentence_lengths)

fig_data <-data.frame(SentenceLengths=c(cs_sentence_lengths, non_cs_sentence_lengths),Grp=rep(c("CS","Non-CS"),times=c(1476, 1476)))
boxplot(SentenceLengths~Grp,data=fig_data, col=c("pink", "lightblue"), notch=TRUE, boxwex=0.5, cex.lab=1.3, cex.axis=1.2)

t.test(cs_sentence_lengths, non_cs_sentence_lengths)
