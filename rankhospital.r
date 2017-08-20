## Fuction to rank hospitals for particular disease 

rankhospital<-function(state,outcome,num="best"){
     hosData<-read.csv("outcome-of-care-measures.csv",
                       na.strings = "Not Available", colClasses = "character")
     
     states<-as.factor(hosData$State)
     
     if(!(state %in% states))
          stop("invalid state")
     
     hosData<-hosData[hosData$State==state,]
     
     
     
     if(outcome=="heart attack"){
          impColumns<-colnames(hosData)[11]
     } else if (outcome=="heart failure"){
          impColumns<-colnames(hosData)[17]
     }else if (outcome=="pneumonia"){
          impColumns<-colnames(hosData)[23]
     }else stop("invalid outcome")
     
     impColumns<-c(colnames(hosData)[2],impColumns)
     
     hosData<-hosData[,impColumns]
     hosData[,2]<-as.numeric(hosData[,2])
     
     hosData<-hosData[complete.cases(hosData),]
     
     hosData<-hosData[order(hosData[,2],hosData[,1]),]
     
     head(hosData)
     
     if(num=="best"){
          output<-hosData[1,1]   
     } else if(num=="worst") {
          output<-hosData[nrow(hosData),1]
     } else if(num>nrow(hosData)) {
          output<-"NA"
     } else output<-hosData[num,1]
     
     
     
}