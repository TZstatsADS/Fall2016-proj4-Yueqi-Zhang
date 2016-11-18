# read the label and test #
setwd("/Users/yueqizhang/Documents/w5243 ads/project4/Fall2016-proj4-Yueqi-Zhang/data")
prob_yq<-read.csv("topics_prop_output.csv")
prob_test<-read.csv("topic_test_rf.csv")

name=prob_yq[,2]
name<-as.character(name)

prob_yq<-as.matrix(prob_yq[,-c(1,2)])
prob_test<-as.matrix(prob_test[,-1])

result<-prob_test%*%t(prob_yq)
colnames(result)=name

for (i in 1:nrow(result)){
  result[i,]=rank(-result[i,])
}

#write.csv(result,file=paste(data_output_path, "result.csv", sep=""))
setwd("/Users/yueqizhang/Documents/w5243 ads/project4/Fall2016-proj4-Yueqi-Zhang/output")
write.csv(result,file="rank.csv")

View(result)