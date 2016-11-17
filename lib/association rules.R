library(arules)
label5_r<-read.csv("/Users/yueqizhang/Documents/w5243 ads/project4/Project4_data/data/label5_yz.csv")
dellabel<-c(714,949,990,1111,1324,1374,1657,1704,2283)
label5_r<-label5_r[-dellabel,]
feature_r<-read.csv("/Users/yueqizhang/Documents/w5243 ads/project4/data/train_ar.csv")
delfeature<-237
feature_r<-feature_r[-delfeature,]
data_conb<-cbind(feature_r[,2:7],label5_r[,2])
colnames(data_conb)[7]<-"Topic"
data_conb[,1]<-as.factor(data_conb[,1])
data_conb[,2]<-as.factor(data_conb[,2])
data_conb[,3]<-as.factor(data_conb[,3])
data_conb[,4]<-as.factor(data_conb[,4])
data_conb[,5]<-as.factor(data_conb[,5])
data_conb[,6]<-as.factor(data_conb[,6])
data_conb[,7]<-as.factor(data_conb[,7])
data<-as(data_conb,"transactions")
rules<-apriori(data,parameter = list(support=0.01,confidence=0.6))
rulestopic1<-subset(rules,subset=rhs %in% "Topic=1")
inspect(head(rulestopic1,n=3,by="confidence"))
rulestopic2<-subset(rules,subset=rhs %in% "Topic=2")
rulestopic3<-subset(rules,subset=rhs %in% "Topic=3")
rulestopic4<-subset(rules,subset=rhs %in% "Topic=4")
rulestopic5<-subset(rules,subset=rhs %in% "Topic=5")