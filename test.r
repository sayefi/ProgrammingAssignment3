source("best.r")
x<-best("TX","heart attack")
x


x<-best("TX","heart failure")
x


x<-best("MD","heart attack")
x

x<-best("MD","pneumonia")
x


x<-best("BB","heart attack")
x


x<-best("NY","hert failure")
x


source("rankhospital.r")
x<-rankhospital("TX","heart failure",4)
x

x<-rankhospital("MD","heart attack","worst")
x

x<-rankhospital("MN","heart attack",5000)
x

hosData<-read.csv("outcome-of-care-measures.csv",
                  na.strings = "Not Available", colClasses = "character")



source("rankall.r")

head(rankall("heart attack",20),10)
tail(rankall("pneumonia","worst"),3)

tail(rankall("heart failure","worst"),10)

length(hosData)
rows(hosData)
nrow(hosData)
