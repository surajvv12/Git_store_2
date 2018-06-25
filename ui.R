#head(recommendation)
dm <- dropdownMenu(type="messages")
mm <- dropdownMenu(type="notifications",
                   messageItem(
                     from = "User1",
                     icon = icon("life-ring"),
                     message = "Last Updated on 14JUN2018"))
tm <- dropdownMenu(type = "tasks", badgeStatus = "success",
                   taskItem(value = 90, color = "green",
                            "AE/LB/CM/EX Listings"
                   ),
                   taskItem(value = 20, color = "aqua",
                            "Global Filter"
                   ),
                   taskItem(value = 75, color = "yellow",
                            "Safety Summary"
                   )
)
#Dashboard header carrying the title of the dashboard
header <- dashboardHeader(title = "Testing 123", titleWidth = "250px", mm, tm)  

#Sidebar content of the dashboard
sidebar <- dashboardSidebar(
  width = 250,
  sidebarMenu(
    sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                      label = "Work in Progress"),
    
    menuItem("Overview", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Adverse Event", tabName = "ae", icon = icon("log-in",lib='glyphicon'),
             menuItem("AE Listing", tabName = "aelist", icon = icon("log-in",lib='glyphicon')),
             menuItem("AE Summary", tabName = "aesumm", icon = icon("log-in",lib='glyphicon')),
             menuItem("AE Timeline", tabName = "aetime", icon = icon("log-in",lib='glyphicon'))
    ),
    menuItem("Lab Data", tabName = "lb", icon = icon("log-in",lib='glyphicon'),
             menuItem("Lab Graph", tabName = "lbfigure", icon = icon("log-in",lib='glyphicon'))
    ),
  
  menuItem("Global Filter", tabName = "global", icon = icon("log-in",lib='glyphicon'),
           badgeLabel = "New", badgeColor = "green")
),

uiOutput("USUBJID_UI"),
uiOutput("STUDYID_UI"),
uiOutput("RACE_UI"),
uiOutput("TRT01A_UI"),
uiOutput("TRT01GR1_UI"),
uiOutput("TR01PG1_UI"),
uiOutput("AGE_UI")



    
   
)

# combine the two fluid rows to make the body
body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  tabItems(
    
    tabItem("global", 
            fluidRow(
              
            )
    ),
    
    
    
    tabItem("dashboard", 
            fluidRow(
              frow1
            ),
            fluidRow(
              frow2
            )
    ),
    tabItem("aelist",
            fluidRow(
              aerow
            )
    ),
    tabItem("aesumm",
            fluidRow(
              aesumm
            )
    ),
    tabItem("aetime",
            fluidRow(
              aetime
            )
    ),
    tabItem("lbfigure",
            fluidRow(
              lbgraph
            )
    )
  )
)
#completing the ui part with dashboardPage
ui <- dashboardPage(title = 'Safety Patient Profile (R Shiny)', header, sidebar, body, skin='green')