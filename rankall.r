## Fuction to rank hospitals for particular disease 

rankall<-function(outcome,num="best"){
     
     hosData<-read.csv("outcome-of-care-measures.csv",
                       na.strings = "Not Available", colClasses = "character")
     
     
     
     
     if(outcome=="heart attack"){
          impColumns<-colnames(hosData)[11]
     } else if (outcome=="heart failure"){
          impColumns<-colnames(hosData)[17]
     }else if (outcome=="pneumonia"){
          impColumns<-colnames(hosData)[23]
     }else stop("invalid outcome")
     
     
     
     
     impColumns<-c(colnames(hosData)[7], colnames(hosData)[2],impColumns)
     
     hosData<-hosData[,impColumns]
     hosData[,3]<-as.numeric(hosData[,3])
     colnames(hosData)<-c("State","Hospital","outcome")
     hosData<-hosData[complete.cases(hosData),]
     hosData<-hosData[order(hosData$State,hosData$outcome,hosData$Hospital),]
     statewise<-split(hosData,hosData$State)
     result<-data.frame()
     ##colnames(result)<-c("state","hospital")
     str(result)
     result<-sapply(statewise,rank,num)
     
     resultD<-t(result)
     resultD<-t(resultD)
     resultD<-cbind(resultD,rownames(resultD))
     colnames(resultD)<-c("hospital","state")
     
     resultD
     
     # r<-rownames(result)
     # head(result,10)
     # 
     # resultD<-result[,1]
     # 
     # 
     # 
     # statewise
     # source("rankhospital.r")
     # result<-sapply(split(hosData,hosData$State),rank,num=num)
     # 
     # result[,1,1]
     # 
     # 
     # 
     # hosData<-hosData[order(hosData[,2],hosData[,1]),]
     # 
     # head(hosData)
     # 
     
}


rank<-function(df,num)
{
     if(num=="best"){
          result<-c(df[1,2])   
     } else if(num=="worst") {
          result<-c(df[nrow(df),2])
     } else if(num>nrow(df)) {
          result<-"NA"
     } else result<-c(df[num,2])
     
}