# create the server functions for the dashboard  
server <- function(input, output) { 
  
  
  first_filter_data<-reactive({
    
    
    if(usubjid=="All IDS")
      
    {
      
      first_filter_data<-first_data
    }
    
    else{
      
      first_filter_data<-subset(first_data,first_data$USUBJID==usubjid)
      
    }
    
    return(first_filter_data)
    
    
  })
  
  
  
  second_filter_data<-reactive({
    
    first_filter_data<-first_filter_data()
    
    if(studyid=="All ID's")
    {
      
      second_filter_data<-first_filter_data
      
    }
    
    else{
      
      second_filter_data<-subset(first_filter_data,first_filter_data$STUDYID==studyid)
      
    }
    
    return(second_filter_data)
  })
  
  
  third_filter_data<-reactive({
    
    second_filter_data<- second_filter_data()
    
    if(race=="All")
    {
      
      third_filter_data<-second_filter_data
    }
    
    else{
      
      third_filter_data<-subset(second_filter_data,second_filter_data$RACE==race)
    }
    
    
    return(third_filter_data)
  })
  
  
  fourth_filter_data<-reactive({
    
    third_filter_data<-third_filter_data()
    
    if(age=="All Age")
    {
      
      fourth_filter_data<-third_filter_data
      
    }
    
    else{
      
      
      fourth_filter_data<-subset(third_filter_data,third_filter_data$AGE==age)
      
    }
    
    return(fourth_filter_data)
    
    
    
  })
  
  
  fifth_filter_data<-reactive({
    
    fourth_filter_data<-fourth_filter_data()

    
    if(trt01a=="All")
    {
      
      fifth_filter_data<-fourth_filter_data
    }
    
    else{
      
      
      fifth_filter_data<-subset(fourth_filter_data,fourth_filter_data$TRT01A==trt01a)
      
      
    }
    
    return(fifth_filter_data)
  })
    
  
  sixth_filter_data<-reactive({
    
    
    fifth_filter_data<-fifth_filter_data()
    
    if(tr01gr1=="All")
    {
      
      sixth_filter_data<-fifth_filter_data
    }
    
    else{
      
      sixth_filter_data<-subset(fifth_filter_data,fifth_filter_data$TRT01GR1==tr01gr1)
    }
    
    return(sixth_filter_data)
    
    
  })
  
  seventh_filter_data<-reactive({
    
    sixth_filter_data<-sixth_filter_data()
    
    if(tro1pg1=="All")
    {
      
      seventh_filter_data<-sixth_filter_data
    }
    
    else{
      
      seventh_filter_data<-subset(sixth_filter_data,sixth_filter_data$TR01PG1==tro1pg1)
      
    }
    
    return(seventh_filter_data)
    
    
    
  })
  
  
    
    
  
  #creating the valueBoxOutput content
  output$value1 <- renderValueBox({
    
    data1<-seventh_filter_data()
    
    value1<-nrow(data1)
    
    valueBox(
      formatC(value1, format="d", big.mark=',')#sales.account$value
      ,paste('Total Safety Population:')
      ,icon = icon("stats",lib='glyphicon')
      ,color = "purple")
    
    
  })
  
  output$value2 <- renderValueBox({
    
    data1<-seventh_filter_data()
    
    data_cr<-subset(data1,data1$EOT01GR1== "")
    
    value2<-nrow(data_cr)
    
    valueBox(
      formatC(value2, format="d", big.mark=',')
      ,'Subject Still on Treatment'
      ,icon = icon("gbp",lib='glyphicon')
      ,color = "green")
    
  })
  
  output$value3 <- renderValueBox({
    
    data1<-seventh_filter_data()
    
    data_cr<-subset(data1,data1$EOT01GR1== "Adverse Event")
    value3<-nrow(data_cr)
    
    valueBox(
      formatC(value3, format="d", big.mark=',') #prof.prod$value
      ,paste('Subject discontinued due to AE')  
      ,icon = icon("menu-hamburger",lib='glyphicon')
      ,color = "yellow")
    
  })
  
  
  output$age_table<-renderTable({
    
    data1<-seventh_filter_data()
    
    Mean_age<-mean(data1$AGE)
    Median_age<-median(data1$AGE)
    SD_age<-sd(data1$AGE)
    Min_age<-min(data1$AGE)
    Max_age<-max(data1$AGE)
    
    age_table<-as.data.frame(rbind(Mean_age,Median_age,SD_age,Min_age,Max_age))
    colnames(age_table)<-c("Age Stats")
    
    return(age_table)
    
    
  },rownames = TRUE)
  
  
  output$age_group_table<-renderTable({
    
    data1<-seventh_filter_data()
    
    data1$AGE_GR<-NA
    data1$AGE_GR[data1$AGE<65]<-"<65"
    data1$AGE_GR[data1$AGE>= 65 & data1$AGE <= 75]<-"65 - <=75"
    data1$AGE_GR[data1$AGE > 75]<-">75"
    
    age_group<-as.data.frame(table(data1$AGE_GR))
    
    colnames(age_group)<-c("Age_group","Count")
    
    age_group<-mutate(age_group,
                      
                      Group_percent=100*(Count/nrow(data1))
    )
    
    
    return(age_group)
    
    
  })
  
  output$ethnic_table<-renderTable({
    
    data1<-seventh_filter_data()
    
    ethnic_count<-as.data.frame(table(data1$ETHNIC))
    
    colnames(ethnic_count)<-c("Ethnicity","Count")
    
    ethnic_count<-mutate(ethnic_count,
                      
                      Count_percent=100*(Count/nrow(data1))
    )
    
    
    return(ethnic_count)
    
  })
  
  
  output$race_table<-renderTable({
    
    data1<-seventh_filter_data()
    
    race_count<-as.data.frame(table(data1$RACE))
    
    colnames(race_count)<-c("Race","Count")
    
    race_count<-mutate(race_count,
                         
                         Count_percent=100*(Count/nrow(data1))
    )
    
    return(race_count)
    
  })
  
  output$prtrgr1_table<-renderTable({
    
    
    data1<-seventh_filter_data()
    
    prtrgr1_count<-as.data.frame(table(data1$PRTRTGR1))
    
    colnames(prtrgr1_count)<-c("Group","Count")
    
    prtrgr1_count<-mutate(prtrgr1_count,
                       
                       Count_percent=100*(Count/nrow(data1))
    )
    
    return(prtrgr1_count)
    
  })
  
  output$ecoggr_table<-renderTable({
    
    data1<-seventh_filter_data()
    
    ecoggr_count<-as.data.frame(table(data1$ECOGGR1))
    
    colnames(ecoggr_count)<-c("Group","Count")
    
    ecoggr_count<-mutate(ecoggr_count,
                          
                          Count_percent=100*(Count/nrow(data1))
    )
    
    return(ecoggr_count)
    
  })
  
  output$dosegr_table<-renderTable({
    
    
    
    data1<-seventh_filter_data()
    
    dosegr_count<-as.data.frame(table(data1$DOSEGR1))
    
    colnames(dosegr_count)<-c("Group","Count")
    
    dosegr_count<-mutate(dosegr_count,
                         
                         Count_percent=100*(Count/nrow(data1))
    )
    
    return(dosegr_count)
    
  })
  
  
  output$trt01gr1_table<-renderTable({
    
    data1<-seventh_filter_data()
    
    trt01gr1_count<-as.data.frame(table(data1$TRT01GR1))
    
    colnames(trt01gr1_count)<-c("Group","Count")
    
    trt01gr1_count<-mutate(trt01gr1_count,
                         
                         Count_percent=100*(Count/nrow(data1))
    )
    
    return(trt01gr1_count)
    
  })
}