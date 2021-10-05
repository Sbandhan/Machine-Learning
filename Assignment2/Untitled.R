library(dplyr)
library(caret)
library(class)
library(kknn)
library(ISLR)
library(FNN)
library(gmodels)
library(dummies)

UnBank<-read.csv("UniversalBank.csv")

# Removing ID and ZIPCODE attributes
ub<-UnBank[,c(-1,-5)]
str(ub)

Education_dummy_model<-dummy(UnBank$Education)
tmp<-cbind(ub,Education_dummy_model)
head(tmp)

withBank <-tmp[c(-6)] #removing education column as we have created dummies
head(withBank)
replace(withBank$Experience, withBank$Experience < 0, 0)

gene_neg = withBank[which(withBank$Experience < 0, )]
