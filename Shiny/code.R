
library(sas7bdat)

data1<-read.sas7bdat(file = "Data/data1.sas7bdat",debug=FALSE)
data2<-read.sas7bdat(file = "Data/data2.sas7bdat",debug=FALSE)

#

usubjid<-as.data.frame(table(data2$USUBJID))
usubjid<-as.character(usubjid$Var1)

studyid<-as.data.frame(table(data2$STUDYID))
studyid<-as.character(studyid$Var1)

race<-as.data.frame(table(data2$RACE))
race<-as.character(race$Var1)

age<-as.data.frame(table(data2$AGEGR1))
age<-as.character(age$Var1)

trt01a<-as.data.frame(table(data2$TRT01A))
trt01a<-as.character(trt01a$Var1)

tr01gr1<-as.data.frame(table(data2$TRT01GR1))
tr01gr1<-as.character(tr01gr1$Var1)

tro1pg1<-as.data.frame(table(data2$TR01PG1))
tro1pg1<-as.character(tro1pg1$Var1)

data_cr<-subset(data1,data1$EOT01GR1== "")


mean_Age<-mean(data1$AGE)
SD_age<-sd(data1$AGE)

age_table<-as.data.frame(rbind(mean_Age,SD_age))
colnames(age_table)<-c("Age Stats")

age_group<-as.data.frame(table(data1$AGE_GR))



colnames(age_group)<-c("Age_group","Count")

age_group<-mutate(age_group,
                  
                  Group_percent=100*(Count/nrow(data1))
                  )

prop.table(age_group,margin = 2)

data1$AGE_GR<-NA
data1$AGE_GR[data1$AGE<65]<-"<65"
data1$AGE_GR[data1$AGE>= 65 & data1$AGE <= 75]<-"65 - <=75"
data1$AGE_GR[data1$AGE > 75]<-">75"
