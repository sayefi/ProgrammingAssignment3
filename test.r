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


x<-best("SC", "heart attack")
x

x<-best("NY", "pneumonia")
x

x<-best("AK", "pneumonia")
x

x<-rankhospital("NC", "heart attack", "worst")
x

x<-rankhospital("WA", "heart attack", 7)
x

x<-rankhospital("TX", "pneumonia", 10)
x

x<-rankhospital("NY", "heart attack", 7)
x

r <- rankall("heart attack", 4)

as.character(subset(r, state == "HI")$hospital)

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)




# length(hosData)
# rows(hosData)
# nrow(hosData)
