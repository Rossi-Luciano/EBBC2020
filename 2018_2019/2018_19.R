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
"collaboration","country","patent","journal","citation","publication","network","information","scientific","science",
"index","knowledge","citation","method","review","paper","model","approach","information","word",
"citation","user","link","task","model","funding","topic","metric","language","patent",
"journal","citation","article","author","paper","publication","country","index","scientific","information"

), 
  value=c(
57,17,2,71,
102,75,24,54,
295,95,15,283,
52.38,52.38,52.38,43.65,43.65,43.65,43.65,43.65,43.65,34.92,
23.34,23.34,23.34,19.45,19.45,15.56,15.56,15.56,15.56,15.56,
5.22,5.22,4.35,4.35,4.35,3.48,3.48,3.48,3.48,3.48,
58.24,58.24,43.68,36.4,36.4,36.4,36.4,36.4,36.4,29.12
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


