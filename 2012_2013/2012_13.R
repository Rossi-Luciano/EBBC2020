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
"citation","index","field","university","information","patent","author","collaboration","research","publication",
"journal","peer","information","review","science","technology","discipline","country","citation","knowledge",
"network","citation","feature","research","cited","publication","topic","social","article","journal",
"index","journal","citation","network","research","indicator","paper","publication","impact","author"



), 
  value=c(
107,14,6,34,
237,63,34,34,
248,26,10,38,
84.56,73.99,63.42,52.85,52.85,52.85,52.85,52.85,52.85,52.85,
16.6,11.62,11.62,9.96,9.96,9.96,8.3,8.3,8.3,8.3,
7.04,7.04,6.16,4.4,4.4,4.4,4.4,4.4,4.4,3.52,
16.3,14.67,13.04,9.78,9.78,9.78,8.15,8.15,8.15,8.15
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


