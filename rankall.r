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
     #str(result)
     result<-lapply(statewise,rank,num)
     
     
     hospital<-as.vector(do.call(rbind,result))
     n<-length(result)
     state<-as.vector(names(result[1:n]))
     
     resultDf<-as.data.frame(cbind(hospital,state))
     
     resultDf
     
     # res<-as.vector(do.call(rbind,result))
     # res[2,1]
     # str(res)
     # class(result)
     # 
     # 
     # resultDf<-data.frame()
     # 
     # i<-5
     # for(i in 1:n){
     #      hospital<-as.character(result[[i]][1])
     #      state<-as.character(names(result[i]))
     #      print(c(hospital,state))
     #      resultDf<-rbind(resultDf,c(hospital,state))
     # }
     # 
     # str(resultDf)
     # resultDf<-unlist(result)
     # 
     # 
     # str(resultDf)
     # v1<-as.vector(names(result[1:n]))
     # str(v1)
     # result[[1:n]][1]
     # 
     # v2<-as.character(result[seq(1,n,1)][1])
     # str(v2)
     # 
     # result[1:n][4]
     # resultD<-cbind(v1,v2)
     # 
     # resultD[2,1]
     # str(resultD)
     # 
     # names(v)<-"hospital"
     # 
     # resultDf<-cbind(as.character(result[1:n]),names(result[1:n]))
     # 
     # colnames(resultDf)<-c("hospital","state")
     # 
     # head(resultDf)
     # 
     # str(resultDf)
     # states<-names(result[1:n])
     # 
     # v<-result[1:n]
     # names(result[1])
     # as.character(result[1:n])
     # 
     # as.char(result[1])
     # 
     # str(v)
     # 
     # v<-rbind(result[[1:n]][1])
     # 
     # result[[5]][1]
     # 
     # resultDf<-data.frame(cbind(hospital<-result[[1:n]][1],state<-names(result[1:n])))
     # names(result[2])
     # result[[2]][1]
     # 
     # str(result)
     # 
     # v<-as.data.frame(result,stringsAsFactors=FALSE)
     # v<-t(v)
     # str(v)
     # 
     # 
     # result<-data.frame(lapply(result, type.convert), stringsAsFactors=FALSE)
     # result<-t(result)
     # result<-cbind(result,rownames(result))
     # colnames(result)<-c("hospital","state")
     # 
     # 
     # result
     
     # result$hospital
     # result[,result[,2]=="HI"]
     # 
     # result<-subset(result, state == "HI")
     # result[1,2]
     # 
     # 
     # names(result)
     # result
     # result$WI
     # list(result)
     # 
     # 
     # v<-as.vector(result)
     # v
     # resultD<-t(result)
     # resultD<-t(resultD)
     # str(resultD)
     # 
     # result$names
     # 
     # resultD<-data.frame(as.list(result))
     # 
     # 
     # resultD<-cbind(resultD,rownames(resultD))
     # colnames(resultD)<-c("hospital","state")
     # 
     # str(resultD)
     # resultD
     # 
     # resultD[state=="AK",]
     
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
