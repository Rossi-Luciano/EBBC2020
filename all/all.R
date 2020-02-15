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
"journal","citation","author","science","publication","network","field","index","scientific","information",
"index","patent","citation","ranking","indicator","search","journal","publication","author","university",
"collaboration","network","country","publication","china","international","index","journal","citation","science",
"patent","country","journal","university","citation","technology","network","publication","china","scientific"

), 
  value=c(
320,274,69,105,
1026,587,59,117,
1181,470,393,592,
344.59,344.59,287.16,229.73,229.73,229.73,229.73,229.73,229.73,172.30,
204.77,170.64,170.64,136.51,136.51,102.38,102.38,102.38,102.38,102.38,
95.69,53.16,53.16,53.16,53.16,42.53,42.53,42.53,42.53,42.53,
118.71,101.75,101.75,84.79,67.83,67.83,67.83,67.83,67.83,67.83
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


