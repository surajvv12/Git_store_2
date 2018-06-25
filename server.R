# create the server functions for the dashboard  
server <- function(input, output) { 
  
  
  output$USUBJID_UI<-renderUI({
    
    usubjid<-as.data.frame(table(first_data$USUBJID))
    usubjid<-as.character(usubjid$Var1)
    usubjid<-c("All IDS",usubjid)
    
    selectInput("usubjid","Filter by USUBJID",choices = usubjid)
    
    
  })
  
  first_filter_data<-reactive({
    
    
    usubjid<-as.character(input$usubjid)
    
    if(usubjid=="All IDS")
      
    {
      
      first_filter_data<-first_data
    }
    
    else{
      
      first_filter_data<-subset(first_data,first_data$USUBJID==usubjid)
      
    }
    
    return(first_filter_data)
    
    
  })
  
  
  output$STUDYID_UI<-renderUI({
    
    
    first_filter_data<-first_filter_data()
    
    studyid<-as.data.frame(table(first_filter_data$STUDYID))
    studyid<-as.character(studyid$Var1)
    studyid<-c("All ID's",studyid)
    
    selectInput("studyid","Filter by STUDYID",choices = studyid)
    
  })
  
  
  
  
  
  
  second_filter_data<-reactive({
    
    first_filter_data<-first_filter_data()
    
    studyid<-as.character(input$studyid)
    
    if(studyid=="All ID's")
    {
      
      second_filter_data<-first_filter_data
      
    }
    
    else{
      
      second_filter_data<-subset(first_filter_data,first_filter_data$STUDYID==studyid)
      
    }
    
    return(second_filter_data)
  })
  
  
  output$RACE_UI<-renderUI({
    
    second_filter_data<-second_filter_data()
    
    race<-as.data.frame(table(second_filter_data$RACE))
    race<-as.character(race$Var1)
    race<-c("All",race)
    
    selectInput("race","Filter by RACE",choices = race)
    
    
  })
  
  
  third_filter_data<-reactive({
    
    second_filter_data<- second_filter_data()
    
    race<-as.character(input$race)
    
    if(race=="All")
    {
      
      third_filter_data<-second_filter_data
    }
    
    else{
      
      third_filter_data<-subset(second_filter_data,second_filter_data$RACE==race)
    }
    
    
    return(third_filter_data)
  })
  
  
  output$TRT01A_UI<-renderUI({
    
    third_filter_data<-third_filter_data()
    
    trt01a<-as.data.frame(table(third_filter_data$TRT01A))
    trt01a<-as.character(trt01a$Var1)
    trt01a<-c("All",trt01a)
    
    
    selectInput("trt01a","Filter by TRT01A",choices = trt01a)
    
    
    
  })
  
  
  fourth_filter_data<-reactive({
    
    third_filter_data<-third_filter_data()
    
    trt01a<-as.character(input$trt01a)
    
    if(trt01a=="All")
    {
      
      fourth_filter_data<-third_filter_data
      
    }
    
    else{
      
      
      fourth_filter_data<-subset(third_filter_data,third_filter_data$TRT01A==trt01a)
      
    }
    
    return(fourth_filter_data)
    

    
  })
  
  
  output$TRT01GR1_UI<-renderUI({
    
    fourth_filter_data<-fourth_filter_data()
    
    tr01gr1<-as.data.frame(table(fourth_filter_data$TRT01GR1))
    tr01gr1<-as.character(tr01gr1$Var1)
    tr01gr1<-c("All",tr01gr1)
    
    
    selectInput("tr01gr1","Filter by TRT01GR1",choices = tr01gr1)
    
    
    
    
  })
  
  
  fifth_filter_data<-reactive({
    
    fourth_filter_data<-fourth_filter_data()
    
    tr01gr1<-as.character(input$tr01gr1)

    
    if(tr01gr1=="All")
    {
      
      fifth_filter_data<-fourth_filter_data
    }
    
    else{
      
      
      fifth_filter_data<-subset(fourth_filter_data,fourth_filter_data$TRT01GR1==tr01gr1)
      
      
    }
    
    return(fifth_filter_data)
  })
    
  
  output$TR01PG1_UI<-renderUI({
    
    fifth_filter_data<-fifth_filter_data()
    
    tro1pg1<-as.data.frame(table(fifth_filter_data$TR01PG1))
    tro1pg1<-as.character(tro1pg1$Var1)
    tro1pg1<-c("All",tro1pg1)
    
    
    selectInput("tro1pg1","Filter by TR01PG1",choices = tro1pg1)
    
    
  })
  
  sixth_filter_data<-reactive({
    
    
    fifth_filter_data<-fifth_filter_data()
    
    tro1pg1<-as.character(input$tro1pg1)
    
    if(tro1pg1=="All")
    {
      
      sixth_filter_data<-fifth_filter_data
    }
    
    else{
      
      sixth_filter_data<-subset(fifth_filter_data,fifth_filter_data$TR01PG1==tr01gr1)
    }
    
    return(sixth_filter_data)
    
    
  })
  
  output$AGE_UI<-renderUI({
    
    
    sixth_filter_data<-sixth_filter_data()
    
    age<-as.data.frame(table(sixth_filter_data$AGE))
    age<-as.character(age$Var1)
    age<-c("All Age",age)
    
    selectInput("age","Filter by AGE",choices = age)
    
  })
  
  seventh_filter_data<-reactive({
    
    sixth_filter_data<-sixth_filter_data()
    
    age<-as.character(input$age)
    
    if(age=="All")
    {
      
      seventh_filter_data<-sixth_filter_data
    }
    
    else{
      
      seventh_filter_data<-subset(sixth_filter_data,sixth_filter_data$AGE==age)
      
    }
    
    return(seventh_filter_data)
    
    
    
  })
  
  
    
    
  
  #creating the valueBoxOutput content
  output$value1 <- renderValueBox({
    
    data1<-first_data
    
    value1<-nrow(data1)
    
    valueBox(
      formatC(value1, format="d", big.mark=',')#sales.account$value
      ,paste('Total Safety Population:')
      ,icon = icon("stats",lib='glyphicon')
      ,color = "purple")
    
    
  })
  
  output$value2 <- renderValueBox({
    
    data1<-first_data
    
    data_cr<-subset(data1,data1$EOT01GR1== "")
    
    value2<-nrow(data_cr)
    
    valueBox(
      formatC(value2, format="d", big.mark=',')
      ,'Subject Still on Treatment'
      ,icon = icon("gbp",lib='glyphicon')
      ,color = "green")
    
  })
  
  output$value3 <- renderValueBox({
    
    data1<-first_data
    
    data_cr<-data1[which(data1$EOT01GR != "" & data1$EOT01GR!="Completed"),]
    value3<-nrow(data_cr)
    
    valueBox(
      formatC(value3, format="d", big.mark=',') #prof.prod$value
      ,paste('Subject discontinued due to AE')  
      ,icon = icon("menu-hamburger",lib='glyphicon')
      ,color = "yellow")
    
  })
  
  
  output$age_table<-renderTable({
    
    data1<-first_data
    
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
    
    data1<-first_data
    
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
    
    data1<-first_data
    
    ethnic_count<-as.data.frame(table(data1$ETHNIC))
    
    colnames(ethnic_count)<-c("Ethnicity","Count")
    
    ethnic_count<-mutate(ethnic_count,
                      
                      Count_percent=100*(Count/nrow(data1))
    )
    
    
    return(ethnic_count)
    
  })
  
  
  output$race_table<-renderTable({
    
    data1<-first_data
    
    race_count<-as.data.frame(table(data1$RACE))
    
    colnames(race_count)<-c("Race","Count")
    
    race_count<-mutate(race_count,
                         
                         Count_percent=100*(Count/nrow(data1))
    )
    
    return(race_count)
    
  })
  
  output$prtrgr1_table<-renderTable({
    
    
    data1<-first_data
    
    prtrgr1_count<-as.data.frame(table(data1$PRTRTGR1))
    
    colnames(prtrgr1_count)<-c("Group","Count")
    
    prtrgr1_count<-mutate(prtrgr1_count,
                       
                       Count_percent=100*(Count/nrow(data1))
    )
    
    return(prtrgr1_count)
    
  })
  
  output$ecoggr_table<-renderTable({
    
    data1<-first_data
    
    ecoggr_count<-as.data.frame(table(data1$ECOGGR1))
    
    colnames(ecoggr_count)<-c("Group","Count")
    
    ecoggr_count<-mutate(ecoggr_count,
                          
                          Count_percent=100*(Count/nrow(data1))
    )
    
    return(ecoggr_count)
    
  })
  
  output$dosegr_table<-renderTable({
    
    
    
    data1<-first_data
    
    dosegr_count<-as.data.frame(table(data1$DOSEGR1))
    
    colnames(dosegr_count)<-c("Group","Count")
    
    dosegr_count<-mutate(dosegr_count,
                         
                         Count_percent=100*(Count/nrow(data1))
    )
    
    return(dosegr_count)
    
  })
  
  
  output$trt01gr1_table<-renderTable({
    
    data1<-first_data
    
    trt01gr1_count<-as.data.frame(table(data1$TRT01GR1))
    
    colnames(trt01gr1_count)<-c("Group","Count")
    
    trt01gr1_count<-mutate(trt01gr1_count,
                         
                         Count_percent=100*(Count/nrow(data1))
    )
    
    return(trt01gr1_count)
    
  })
  
  output$e0t01gr1_table1<-renderTable({
    
    
    data1<-first_data
    
    data1$et_group<-NA
    
    data1$et_group <- ifelse(data1$EOT01GR1== "", "Subjects Continuing Drug[2]",
                                  ifelse(data1$EOT01GR1 =="Completed" , "Subjects Completed Study Drug[2]","Subjects Discontinued Study Drug [2]"  )) 
    
    et_group_count<-as.data.frame(table(data1$et_group))
    
    colnames(et_group_count)<-c("Group","Count")
    
    et_group_count<-mutate(et_group_count,
                           
                           Count_percent=100*(Count/nrow(data1))
                           
                           
    )
    
    return(et_group_count)
    
    
  })
  
  
  output$e0t01gr1_table2<-renderTable({
    
    data1<-first_data
    data2<-data1[which(data1$EOT01GR != "" & data1$EOT01GR!="Completed"),]
    
    et_group_count2<-as.data.frame(table(data2$EOT01GR1))
    
    colnames(et_group_count2)<-c("Reason","Count")
    
    et_group_count2<-subset(et_group_count2,et_group_count2$Count>0)
    
    
    
    et_group_count2<-mutate(et_group_count2,
                           
                           Count_percent=100*(Count/nrow(data2)))
    
    
    return(et_group_count2)
    
  })
  
  
  
  output$aelisting<-DT::renderDataTable({
    
    
    
    DT::datatable(data2,extensions = c('Buttons', 'Scroller'), options = list(
      dom = 'Bfrtip',
      deferRender = TRUE,
      scrollY = 500,
      scroller = TRUE,
      buttons = c('copy', 'csv', 'excel', 'pdf', 'print')
    ))
    
  })
}