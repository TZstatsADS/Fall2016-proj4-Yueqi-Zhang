source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
library(topicmodels)
library(NLP)
library(tm)
load("~/Documents/w5243 ads/project4/Project4_data/lyr.RData")
del<-c(2,3,6:30)
lyr_n<-lyr[,-del]
setwd("/Users/yueqizhang/Documents/w5243 ads/project4/Project4_data/data")

lyrics<-string_convert(lyr_n)
Vlyrics<-c()
for (i in 1:2350){
  Vlyrics<-c(Vlyrics,lyrics[[1]][i])
}
Vlyrics<-Vlyrics[-237]
Vlyrics<-VCorpus(VectorSource(Vlyrics))
Vlyrics<-tm_map(Vlyrics,stripWhitespace)
Vlyrics<-tm_map(Vlyrics,removeWords,stopwords("english"))
#Vlyrics<-tm_map(Vlyrics,stemDocument)
dtm<-DocumentTermMatrix(Vlyrics,control = list(weight=weightTfIdf))

#topicmodels, 5 topics
k1<-5
control_LDA_VEM<-list(estimate.alpha=TRUE, alpha=50/k,estimate.beta=TRUE,verbose=0,prefix=tempfile(),save=0,keep=0,seed=as.integer(Sys.time()),nstart=1,best=TRUE,var=list(iter.max=500,tol=10^-6),em=list(iter.max=1000,tol=10^-4),initialize="random")
result5<-LDA(dtm,k=k1,method="VEM",control=list(seed=2010))
label5<-topics(result5,1)
rank5<-terms(result5,100)
write.csv(label5,file = "label5_yz.csv")
write.csv(rank5,file= "termsrank5_yz.csv")
# get proportion of terms
adjustprob5<-adjust_prob(lyr,label5,num_words = 5000)
write.csv(adjustprob5,file="adjustprob5.csv")


# topicmodel, 10 topics
k2<-10
control_LDA_VEM<-list(estimate.alpha=TRUE, alpha=50/k,estimate.beta=TRUE,verbose=0,prefix=tempfile(),save=0,keep=0,seed=as.integer(Sys.time()),nstart=1,best=TRUE,var=list(iter.max=500,tol=10^-6),em=list(iter.max=1000,tol=10^-4),initialize="random")
result10<-LDA(dtm,k=k2,method="VEM",control=list(seed=2010))
label10<-topics(result10,1)
rank10<-terms(result10,100)
write.csv(label10,file = "label10_yz.csv")
write.csv(rank10,file= "termsrank10_yz.csv")
# get proportion of terms
adjustprob10<-adjust_prob(lyr,label10,num_words = 5000)
write.csv(adjustprob10,file="adjustprob10.csv")

#topicmodels, 20 topics
k3<-20
control_LDA_VEM<-list(estimate.alpha=TRUE, alpha=50/k3,estimate.beta=TRUE,verbose=0,prefix=tempfile(),save=0,keep=0,seed=as.integer(Sys.time()),nstart=1,best=TRUE,var=list(iter.max=500,tol=10^-6),em=list(iter.max=1000,tol=10^-4),initialize="random")
result20<-LDA(dtm,k=k3,method="VEM",control=list(seed=2010))
label20<-topics(result20,1)
rank20<-terms(result20,100)
write.csv(label20,file = "label20_yz_tfidf.csv")
write.csv(rank20,file= "termsrank20_yz_tfidf.csv")
# get proportion of terms
adjustprob20<-adjust_prob(lyr,label20,num_words = 5000)
write.csv(adjustprob20,file="adjustprob20_yz.csv")





