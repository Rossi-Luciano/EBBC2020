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
"search","user","information","citation","journal","ranking","publication","method","article","query",
"network","citation","information","journal","science","paper","author","model","article","authorship",
"index","journal","citation","impact","patent","performance","paper","publication","author","network",
"collaboration","country","university","journal","article","publication","institution","author","scientific","citation"


), 
  value=c(
58,29,46,28,
239,53,23,59,
254,92,52,293,
70.32,70.32,70.32,58.6,46.88,46.88,46.88,46.88,46.88,46.88,
24.8,21.7,18.6,18.6,15.5,15.5,15.5,15.5,15.5,12.4,
16.64,14.56,14.56,12.48,10.4,10.4,10.4,10.4,10.4,10.4,
48.3,41.4,41.4,41.4,41.4,34.5,34.5,34.5,34.5,27.6
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


