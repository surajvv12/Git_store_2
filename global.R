# load the required packages
library(shiny)
require(shinydashboard)
library(ggplot2)
library(dplyr)
library(sas7bdat)
library(DT)


#Read the data from SAS datasets

first_data<-read.sas7bdat(file = "Data/data1.sas7bdat",debug=FALSE)
data2<-read.sas7bdat(file = "Data/data2.sas7bdat",debug=FALSE)



#Generate Global filter values from datasets















source("defineRow.R")
source("dependency.R")