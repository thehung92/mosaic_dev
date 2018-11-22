#!/usr/bin/env Rscript
# reads in .haps files (one per chromosome) and outputs MOSAIC haps files (one per population per chromosome)
require(argparser, quiet=TRUE) 
m.args=arg_parser("script to convert shapeit2 .haps output to MOSAIC input type 1")
######################## required arguments ###############################
m.args=add_argument(m.args, "pathin", help="full path to .haps and samples info datasets", type="character")
m.args=add_argument(m.args, "chrno", help="which chromosome to convert", type="integer")
m.args=add_argument(m.args, "haps_stem", help="part of .haps filename before chrno", type="character")
m.args=add_argument(m.args, "haps_end", help="part of .haps filename after chrno", type="character")
m.args=add_argument(m.args, "samples", help="name of file with details on samples", type="character")
m.args=add_argument(m.args, "pathout", help="full path to folder to store output", type="character")
argv=parse_args(m.args)
pathin=argv$pathin 
chrno=argv$chrno 
hapsfile=paste0(argv$haps_stem,chrno,argv$haps_end)
inds.data=argv$samples 
pathout=argv$pathout 

shapeithaps=read.table(paste0(pathin,hapsfile))
S=nrow(shapeithaps)
NN=ncol(shapeithaps)
locs=shapeithaps[,3]

# now read in population information
allpops=read.table(paste0(pathin,inds.data),header=TRUE)[-1,] # note the first two lines are removed here
# now reduce to parts we need
pops=as.character(unique(allpops[,1]))
keep=rep(T,nrow(allpops)); # remove none to start
keep=which(keep)
allpops=allpops[keep,]
write.table(allpops[,c(1,2,3)],file=paste0(pathout,"sample.names"),row.names=F,col.names=F,quote=F)
hap.pops=rep(allpops[,1],each=2)

# create list to store populations
for (i in 1:length(pops)) {
 y=shapeithaps[,5+which(hap.pops==pops[i])]
 write.table(y,file=paste0(pathout,pops[i],"genofile.",chrno),sep="",col.names=F,row.names=F)
}
# create matrix of snps for which we have haplotypes
snps=matrix(NaN, S, 6) # same size as hapmix files, most will be left blank here
snps[,2]=chrno
snps[,4]=locs
write.table(snps, file=paste0(pathout,"snpfile.", chrno)) 

