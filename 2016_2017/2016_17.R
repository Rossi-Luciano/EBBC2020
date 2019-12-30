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
"citation","journal","user","article","search","network","data","publication","ranking","information",
"journal","information","tweet","twitter","university","user","performance","model","article","patent",
"patent","collaboration","journal","author","citation","country","network","paper","scientific","number",
"citation","index","author","publication","science","journal","paper","cited","network","field"




), 
  value=c(
33,2,21,111,
195,54,32,134,
143,32,186,363,
41.2,41.2,41.2,41.2,41.2,32.96,32.96,32.96,32.96,32.96,
10.2,10.2,10.2,8.16,8.16,8.16,8.16,8.16,8.16,8.16,
32.13,27.54,27.54,27.54,22.95,22.95,22.95,18.36,18.36,18.36,
80.29,68.82,68.82,57.35,57.35,57.35,57.35,57.35,57.35,45.88
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
              sinksRight=FALSE, fontSize = 16, nodeWidth = 50)
p


