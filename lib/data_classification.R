############################################################
############################################################
######                 classification                 ######
############################################################
# suppose we have our "feature matrix" with dimension 2350 * features
# and we have our "clusters", which is obtained based on topic clustering
# then we have a label (cluster) for each data point (music)
# random forest
# now we will use random forest to do multiple classification
setwd("G:/Columbia/STAT GR5243/project04")
music_feature<-read.csv("train.csv")
music_label<-read.csv("label_k10.csv")
music_feature<-music_feature[-237,]
music_feature<-music_feature[,-c(1,2)]
music_label<-music_label[-c(714,949,990,1111,1324,1374,1657,1704,2283),]
music_label<-factor(music_label[,2])
set.seed(123)
train_sample<-sample(1:2340,2000)
music_feature_train<-music_feature[train_sample,]
music_label_train<-music_label[train_sample]
music_feature_test<-music_feature[-train_sample,]
library(randomForest)
music_rf<-randomForest(music_feature_train,music_label_train,importance=T,proximity=T)
music_rf_pre<-predict(music_rf,music_feature_test,type="vote",norm.votes=T)
# knn
# now we will use knn to do multiple classification
library(caret)
music_knn<-knn3(music_feature_train,music_label_train,k=10)
music_knn_pre<-predict(music_knn,music_feature_test)