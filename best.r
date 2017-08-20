## Fuction to return best hospital for particular disease 

best<-function(state,outcome){
     hosData<-read.csv("outcome-of-care-measures.csv",
                       na.strings = "Not Available", colClasses = "character")
     
     states<-as.factor(hosData$State)
     
     if(!(state %in% states))
          stop("invalid state")
     
     hosData<-hosData[data$State==state,]
     
     
     
     if(outcome=="heart attack"){
          impColumns<-colnames(hosData)[11]
     } else if (outcome=="heart failure"){
          impColumns<-colnames(hosData)[17]
     }else if (outcome=="pneumonia"){
          impColumns<-colnames(hosData)[23]
     }else stop("invalid outcome")
     
     impColumns<-c(impColumns, colnames(hosData)[2])
     
     hosData<-hosData[,impColumns]
     hosData[,1]<-as.numeric(hosData[,1])
   
     hosData<-hosData[order(hosData),]
     
     head(hosData)
     
     output<-hosData[1,2]
     
     
}