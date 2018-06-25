# load the required packages
library(shiny)
require(shinydashboard)
library(ggplot2)
library(dplyr)
library(sas7bdat)


#Read the data from SAS datasets

first_data<-read.sas7bdat(file = "Data/data1.sas7bdat",debug=FALSE)
data2<-read.sas7bdat(file = "Data/data2.sas7bdat",debug=FALSE)



#Generate Global filter values from datasets

usubjid<-as.data.frame(table(first_data$USUBJID))
usubjid<-as.character(usubjid$Var1)
usubjid<-c("All IDS",usubjid)

studyid<-as.data.frame(table(first_data$STUDYID))
studyid<-as.character(studyid$Var1)
studyid<-c("All ID's",studyid)

race<-as.data.frame(table(first_data$RACE))
race<-as.character(race$Var1)
race<-c("All",race)

age<-as.data.frame(table(first_data$AGE))
age<-as.character(age$Var1)
age<-c("All Age",age)

trt01a<-as.data.frame(table(first_data$TRT01A))
trt01a<-as.character(trt01a$Var1)
trt01a<-c("All",trt01a)

tr01gr1<-as.data.frame(table(first_data$TRT01GR1))
tr01gr1<-as.character(tr01gr1$Var1)
tr01gr1<-c("All",tr01gr1)

tro1pg1<-as.data.frame(table(first_data$TR01PG1))
tro1pg1<-as.character(tro1pg1$Var1)
tro1pg1<-c("All",tro1pg1)

source("defineRow.R")
source("dependency.R")