#set.seed(0); x <- rnorm(500)
setwd("/Users/Debasmita/Desktop/code-switching/csv's (and numbers)")
library(MASS)
library(astrolibR)

cs_data <- read.csv(file = "redoing_cs_data.csv")
head(cs_data)
non_cs_data <- read.csv(file = "non_cs_sentences_full.csv")
head(non_cs_data)

calvillo_cs_data <- read.csv(file = "redoing_cs_data_with_calvillo_ngram_surp_zh.csv")
calvillo_non_cs_data <- read.csv(file = "non_cs_sentences_full_with_calvillo_ngram_surp_zh.csv")

# comparing "code-switch" points in code-switched data versus non-code-switched data
code_switched_cs_surp <- cs_data$ngram_surp_zh
code_switched_non_cs_surp <- non_cs_data$ngram_surp_zh

c1 <- rgb(173,216,230,max = 255, alpha = 80, names = "lt.blue")
c2 <- rgb(255,192,203, max = 255, alpha = 80, names = "lt.pink")
c3 <- rgb(255, 255, 0, max=255, alpha = 80, names = "lt.yellow")

x <- code_switched_cs_surp
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(code_switched_cs_surp, col = c2, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", add = TRUE)

x <- code_switched_non_cs_surp
fit2 <- fitdistr(x, "normal")
class(fit2)
para2 <- fit2$estimate
hist(code_switched_non_cs_surp, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, para2[1], para2[2]), col = "lightblue", add = TRUE)

legend("topleft", c("CS CS-1", "Non-CS CS-1"), fill=c("lightpink", "lightblue"))

###############################################################################

# comparing "code-switch" points in calvillo code-switched data versus calvillo non-code-switched data
code_switched_cs_surp <- calvillo_cs_data$ngram_surp_zh
code_switched_non_cs_surp <- calvillo_non_cs_data$ngram_surp_zh

c1 <- rgb(173,216,230,max = 255, alpha = 80, names = "lt.blue")
c2 <- rgb(255,192,203, max = 255, alpha = 80, names = "lt.pink")
c3 <- rgb(255, 255, 0, max=255, alpha = 80, names = "lt.yellow")

x <- code_switched_cs_surp
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(code_switched_cs_surp, col = c2, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", add = TRUE)

x <- code_switched_non_cs_surp
fit2 <- fitdistr(x, "normal")
class(fit2)
para2 <- fit2$estimate
hist(code_switched_non_cs_surp, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, para2[1], para2[2]), col = "lightblue", add = TRUE)

legend("topright", c("Calvillo CS CS-1", "Calvillo Non-CS CS-1"), fill=c("lightpink", "lightblue"))

###############################################################################

other_data <- read.csv(file = "surprisals_for_distribution_analysis.csv")
A <- other_data$non_cs_sentences_surps
A <- na.omit(A)
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

# comparing non-code-switched sents to sample of monolingual zh-wiki
x <- A
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(A, col = c3, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "yellow", add = TRUE)

x <- wiki
fitwiki <- fitdistr(x, "normal")
class(fitwiki)
parawiki <- fitwiki$estimate
hist(wiki, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, parawiki[1], parawiki[2]), col = "lightpink", add = TRUE)

legend("topleft", c("Non-CS", "Monolingual Zh"), fill=c("yellow", "lightpink"))

# comparing non-code-switched points before and after code-switch points in code-switched sents 
# to non-code-switch points in non-code-switched sents 
# later, comparisons to code-switch points in code-switched and non-code-switched sents 
x <- A
fitA <- fitdistr(x, "normal")
class(fitA)
paraA <- fitA$estimate
hist(A, col = c3, prob = TRUE)
curve(dnorm(x, paraA[1], paraA[2]), col = "yellow", add = TRUE)

x <- B
fitB <- fitdistr(x, "normal")
class(fitB)
paraB <- fitB$estimate
hist(B, col = c2, prob = TRUE, add=TRUE)
curve(dnorm(x, paraB[1], paraB[2]), col = "lightpink", add = TRUE)

x <- D
fitD <- fitdistr(x, "normal")
class(fitD)
paraD <- fitD$estimate
hist(D, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, paraD[1], paraD[2]), col = "lightblue", add = TRUE)

x <- code_switched_non_cs_surp
fit2 <- fitdistr(x, "normal")
class(fit2)
para2 <- fit2$estimate
hist(code_switched_non_cs_surp, col = "lightgreen", prob = TRUE, add=TRUE)
curve(dnorm(x, para2[1], para2[2]), col = "lightgreen", add = TRUE)

x <- code_switched_cs_surp
fit1 <- fitdistr(x, "normal")
class(fit1)
para1 <- fit1$estimate
hist(code_switched_cs_surp, col = "red", prob = TRUE, add=TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "red", add = TRUE)

legend("topleft", c("Non-CS", "CS Pre-CS-1", "CS Post-CS-2", "Non-CS CS-1", "CS CS-1"), fill=c("yellow", "lightpink", "lightblue", "lightgreen", "red"))

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
hist(code_switched_cs_surp, col = c2, prob = TRUE)
curve(dnorm(x, para1[1], para1[2]), col = "lightpink", add = TRUE)

x <- pre
fitpre <- fitdistr(x, "normal")
class(fitpre)
parapre <- fitpre$estimate
hist(pre, col = c3, prob = TRUE, add=TRUE)
curve(dnorm(x, parapre[1], parapre[2]), col = "yellow", add = TRUE)

x <- C
fitC <- fitdistr(x, "normal")
class(fitC)
paraC <- fitC$estimate
hist(C, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, paraC[1], paraC[2]), col = "lightblue", add = TRUE)

x <- pre_cs2
fitpre_cs2 <- fitdistr(x, "normal")
class(fitpre_cs2)
parapre_cs2 <- fitpre_cs2$estimate
hist(pre_cs2, col = c1, prob = TRUE, add=TRUE)
curve(dnorm(x, parapre_cs2[1], parapre_cs2[2]), col = "lightgreen", add = TRUE)

legend("topleft", c("CS CS-1", "CS Pre-CS-1-Word", "CS CS-2", "CS Pre-CS-2-Word (eng)"), fill=c("lightpink", "yellow", "lightblue", "lightgreen"))

##############################################################################

# comparing CS-1 stats to CS-2 stats

cs1_data <- read.csv(file = "redoing_cs_data.csv")
cs2_data <- read.csv(file="full_cs_back_data.csv")

cs1 <- cs1_data[c("cs_word_pos_zh","cs_word_length_zh","zh_word_index", "word_freq_zh")]
cs2 <- cs2_data[c("cs_word_pos_zh","cs_word_length_zh","zh_word_index", "word_freq_zh")]

head(cs1)
head(cs2)

summary(cs1)
summary(cs2)

diff <- cs2$zh_word_index - cs1$zh_word_index

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

#library(fitdistrplus)
#FIT <- fitdist(x, "norm")
#class(FIT)
#plot(FIT)
