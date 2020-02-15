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
"collaboration","indicator","journal","citation","author","network","patent","science","scientific","social",
"patent","citation","publication","technology","method","author","academic","wikipedia","university","field",
"index","ranking","journal","model","citation","information","search","user","data","scientific",
"citation","journal","network","cited","publication","country","author","science","number","information"

), 
  value=c(
99,16,19,33,
195,48,94,83,
426,39,53,215,
78.26,78.26,78.26,78.26,78.26,78.26,62.61,62.61,62.61,62.61,
12.56,10.05,10.05,10.05,10.05,10.05,10.05,10.05,10.05,10.05,
22.35,19.15,19.15,15.96,15.96,15.96,15.96,15.96,12.77,12.77,
49.96,43.72,37.47,31.23,31.23,31.23,31.23,24.98,24.98,24.98

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


