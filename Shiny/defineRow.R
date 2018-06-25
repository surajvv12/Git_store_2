frow1 <- fluidRow(
  valueBoxOutput("value1")
  ,valueBoxOutput("value2")
  ,valueBoxOutput("value3")
)

frow2 <- fluidRow(
  box(
    width = 4,
    title = "Adverse Event"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,plotOutput("revenuebyRegion1", width="100%", height="300px")
  ), 
  box(
    width = 4,
    title = "Disposition"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,plotOutput("revenuebyRegion2", width="100%", height="300px")
  ), 
  box(
    width = 4,
    title = "Age"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,tableOutput("age_table"),
    tableOutput("age_group_table")
  ),
  box(
    width = 4,
    title = "Ethnicity"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,tableOutput("ethnic_table")
  ),
  box(
    width = 4,
    title = "Race"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,tableOutput("race_table")
  ),
  box(
    width = 4,
    title = "Prior Systemic Therapy"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,tableOutput("prtrgr1_table")
  ),
  box(
    width = 4,
    title = "Baseline ECOG"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,tableOutput("ecoggr_table")
  ),
  box(
    width = 4,
    title = "Dose Level Group"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,tableOutput("dosegr_table")
  ),
  box(
    width = 4,
    title = "Mono/Combo Therapy"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,tableOutput("trt01gr1_table")
  )
)

aerow <- fluidRow(
  box(
    width = 12,
    title = "Adverse Event Listing (Use Sidebar on the Right for Filter)"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,dataTableOutput("aelisting")
    
  )
)
aesumm <- fluidRow(
  box(
    width = 9,
    title = "AE Summary by SOC/PT/Toxicity Grade (Use Sidebar on the Right for Filter)"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,verbatimTextOutput("aesummary")
    
  ),
  box(
    width = 3,
    title = "Filter"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,verbatimTextOutput("filterae")
    
  )
)
aetime <- fluidRow(
  box(
    width = 9,
    title = "AE timeline (Use Sidebar on the Right for Filter)"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,verbatimTextOutput("aetimeline")
    
  ),
  box(
    width = 3,
    title = "Filter"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,verbatimTextOutput("filterae1")
    
  )
)
lblist <- fluidRow(
  box(
    width = 12,
    title = "Lab Listing (Use Sidebar on the Right for Filter)"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,dataTableOutput("lblisting")
    
  )
)
lbgraph <- fluidRow(
  box(
    width = 9,
    title = "Lab Graph (Use Sidebar on the Right for Filter)"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,verbatimTextOutput("lbsummary")
    
  ),
  box(
    width = 3,
    title = "Filter"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,verbatimTextOutput("filterlb")
    
  )
)


