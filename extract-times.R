# simple code to read timetree and extract dates at all nodes
require(ape)

tr<-read.tree("TTOL\ v5.1\ Species\ Tree\ -\ Internal\ NCBI\ ID\ Labelled.nwk")
tr$node.label<-gsub("'","",tr$node.label)
coo<-as.data.frame(plotPhyloCoor(tr)) #extract coordinates of the tree if it were to be plotted. Note that the coordinates are in the same unit as branch length in the tree. Very convenient.
present<-present<-max(coo$xx)
times<-present-coo$xx
tab<-data.frame(node=tr$node.label, age=times[(Ntip(tr)+1):(Ntip(tr)+Nnode(tr))])
tab<-tab[tab$node!='',]

write.csv(tab, file="timetreetimes.csv", row.names=FALSE, quote=FALSE)
