library(networkD3)
library(dplyr)
 
# A connection data frame is a list of flows with intensity for each flow
links <- data.frame(
  source=c(
"JOI","JOI","JOI","JOI",
"JASIST","JASIST","JASIST","JASIST",
"SCIENTOMETRICS","SCIENTOMETRICS","SCIENTOMETRICS","SCIENTOMETRICS",
"T0","T0","T0","T0","T0","T0","T0","T0","T0","T0",
"T1","T1","T1","T1","T1","T1","T1","T1","T1","T1",
"T2","T2","T2","T2","T2","T2","T2","T2","T2","T2",
"T3","T3","T3","T3","T3","T3","T3","T3","T3","T3"
), 
  target=c(
"T0","T1","T2","T3",
"T0","T1","T2","T3",
"T0","T1","T2","T3",
"citation","index","information","author","scientific","method","publication","collaboration","network","science",
"journal","citation","impact","publication","factor","author","science","field","discipline","query",
"index","country","network","citation","patent","journal","publication","collaboration","technology","international",
"patent","university","journal","information","citation","social","model","performance","ranking","science"



), 
  value=c(
71,43,26,25,
199,68,22,82,
93,90,72,69,
43.81,43.81,43.81,37.55,37.55,31.29,31.29,31.29,31.29,31.29,
37.69,28.27,18.84,18.84,18.84,15.70,15.70,15.70,15.70,15.70,
18.18,14.55,14.55,12.73,10.91,10.91,10.91,9.09,9.09,9.09,
25.60,22.40,19.20,19.20,19.20,16.00,16.00,12.80,12.80,12.80

)
  )
 
# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes <- data.frame(
  name=c(as.character(links$source), 
  as.character(links$target)) %>% unique()
)
 
# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1
 
# Make the Network
p <- sankeyNetwork(Links = links, Nodes = nodes,
              Source = "IDsource", Target = "IDtarget",
              Value = "value", NodeID = "name", 
              sinksRight=FALSE, fontSize = 30, nodeWidth = 50, nodePadding=10)
p



