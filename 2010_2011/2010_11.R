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
"journal","citation","ranking","user","index","indicator","network","image","field","publication",
"collaboration","scientific","network","science","bibliometric","country","knowledge","researcher","output","field",
"index","citation","network","information","publication","impact","collaboration","time","community","method",
"patent","citation","information","search","distribution","journal","model","user","network","self"
), 
  value=c(
50,26,35,14,
182,26,60,96,
56,52,33,42,
60.00,36.00,32.00,24.00,24.00,24.00,24.00,24.00,20.00,20.00,
14.05,11.24,11.24,11.24,11.24,9.84,9.84,8.43,8.43,8.43,
32.45,14.42,10.82,10.82,10.82,10.82,10.82,9.01,9.01,9.01,
23.09,21.16,19.24,17.32,15.39,13.47,11.54,11.54,9.62,9.62

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


