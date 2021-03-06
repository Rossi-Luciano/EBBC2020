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
"journal","citation","publication","ranking","information","impact","science","patent","author","user",
"country","collaboration","network","author","user","method","distribution","citation","query","journal",
"information","patent","author","network","collaboration","index","graph","method","indicator","citation",
"network","collaboration","citation","index","publication","journal","patent","information","science","researcher"


), 
  value=c(
65,14,8,77,
200,36,24,115,
293,86,11,304,
89.28,78.12,55.80,55.80,55.80,44.64,44.64,44.64,44.64,44.64,
20.92,15.69,13.08,13.08,13.08,13.08,13.08,13.08,10.46,10.46,
4.89,4.89,4.89,4.89,3.91,3.91,3.91,3.91,3.91,3.91,
58.35,58.35,58.35,58.35,48.63,48.63,48.63,38.90,38.90,38.90

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


