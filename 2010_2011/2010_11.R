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
"information","journal","research","article","science","clustering","user","field","social","network",
"index","citation","publication","paper","journal","impact","indicator","field","number","author",
"journal","citation","network","collaboration","research","country","knowledge","paper","author","scientist",
"user","term","search","query","network","information","model","task","index","document"
), 
  value=c(
14,76,24,8,
144,62,42,113,
18,72,83,10,
28.8,23.04,17.28,17.28,17.28,14.40,14.40,14.40,14.40,14.40,
35.39,30.67,23.24,23.24,18.88,18.88,16.52,16.52,16.52,14.16,
23.27,17.9,16.11,16.11,14.32,14.32,12.53,12.53,10.74,10.74,
16.83,14.96,14.96,13.09,13.09,13.09,11.22,11.22,11.22,11.22

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


