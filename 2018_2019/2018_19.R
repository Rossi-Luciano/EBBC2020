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
"journal","country","citation","collaboration","publication","academic","information","scientific","impact","patent",
"user","network","search","information","data","model","patent","journal","task","link",
"innovation","knowledge","journal","network","online","citation","topic","country","dynamic","impact",
"citation","index","author","publication","cited","journal","reference","scientific","field","impact"

), 
  value=c(
70,9,1,67,
128,63,10,58,
435,37,16,214,
93.78,70.33,70.33,70.33,58.61,58.61,58.61,58.61,46.89,46.89,
17.80,13.35,13.35,11.12,8.90,8.90,8.90,8.90,8.90,8.90,
3.60,3.60,3.00,3.00,2.40,2.40,2.40,2.40,2.40,1.80,
61.64,49.31,36.98,36.98,30.82,24.65,24.65,24.65,24.65,24.65

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


