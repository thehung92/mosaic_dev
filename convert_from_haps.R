#!/usr/bin/env Rscript
# packages
packages <- c("tidyverse",
              "argparse")
# load library quietly and stop if library can not be loaded
for (package in packages) {
  if (suppressPackageStartupMessages(require(package, character.only=TRUE))) {
  } else {
    stop("install required packages before running script")
  }
}
# parse arg from command line
parser <- ArgumentParser(description="script to convert shapeit2 .haps files to MOSAIC input files")
parser$add_argument("-i", "--inHaps", nargs=1,
                    help="path to input file (.haps)")
parser$add_argument("--inSample", nargs=1,
                    help="path to input sample details file (.sample)")
parser$add_argument("--chr", nargs=1,
                    help="select 1 chromosome to convert")
parser$add_argument("--outStem", nargs=1,
                    help="prefix of outputfile .haps (before chr num)")
parser$add_argument("--outTip", nargs=1,
                    help="suffix of outputfile .haps (after chr num)")
parser$add_argument("-O", "--outDir", nargs=1,
                    help="path to output directory")
# use arg in the main function
# debug with the following line:
args <- parser$parse_args(c("--inHaps", "/Users/hung/Tools/mega2/mega2_v6.0.0_src/example/test_output/study_haps.haps",
                            "--inSample", "/Users/hung/Tools/mega2/mega2_v6.0.0_src/example/test_output/study_haps.sample",
                            "--chr", "5",
                            "--outStem", "study_haps",
                            # "--outTip", "",
                            "-O", "output"
                            ))
args <- parser$parse_args()
# load args in the global env
inHaps <- args$inHaps
inSample <- args$inSample
chr <- args$chr
outStem <- args$outStem
outTip <- args$outTip
outDir <- args$outDir
# reads in .haps files (one per chromosome) and outputs MOSAIC haps files (one per population per chromosome)
# require(argparser, quiet=TRUE) 
# m.args=arg_parser("script to convert shapeit2 .haps files to MOSAIC input files")
######################## required arguments ###############################
# m.args=add_argument(m.args, "inHaps", help="full path to .haps and inSample info datasets", type="character")
# m.args=add_argument(m.args, "chr", help="which chromosome to convert", type="integer")
# m.args=add_argument(m.args, "outStem", help="part of .haps filename before chr", type="character")
# m.args=add_argument(m.args, "outTip", help="part of .haps filename after chr", type="character")
# m.args=add_argument(m.args, "inSample", help="name of file with details on inSample", type="character")
# m.args=add_argument(m.args, "outDir", help="full path to folder to store output", type="character")
# argv=parse_args(m.args)
# inHaps=argv$inHaps 
# chr=argv$chr 
# hapsfile=paste0(argv$outStem,chr,args$outTip)
# inds.data=argv$inSample 
# outDir=argv$outDir 
df.inHaps <- read.table(inHaps)
# df.inHaps=read.table(paste0(inHaps,hapsfile))
S=nrow(df.inHaps)
NN=ncol(df.inHaps)
locs=df.inHaps[,3]
rsids=df.inHaps[,2]

# now read in population information # plink add a redundant line, filter it out
df.inSample <- read.table(inSample,header=TRUE) %>%
  filter(ID_2!="0")
# now reduce to parts we need
pops <- as.character(unique(df.inSample[,1]))
keep=rep(TRUE,nrow(df.inSample)); # remove none to start
keep=which(keep)
df.inSample=df.inSample[keep,]
write.table(df.inSample[,c(1,2,3)],
            file=paste0(outDir,"/sample.names"),
            row.names=FALSE,col.names=FALSE,quote=FALSE)
hap.pops=rep(df.inSample[,1],each=2)
# create list to store populations
for (i in 1:length(pops)) {
 y=df.inHaps[,5+which(hap.pops==pops[i])]
 write.table(y,
             file=paste0(outDir,"/",pops[i],"genofile.",chr),
             sep="",col.names=FALSE,row.names=FALSE)
}
# create matrix of snps for which we have haplotypes
snps=matrix(NA, S, 6) # same size as hapmix files, most will be left blank here
snps[,1]=as.character(rsids)
snps[,2]=chr
snps[,4]=locs
write.table(snps,
            file=paste0(outDir,"/","snpfile.", chr),
            quote=FALSE,col.names=FALSE,row.names=FALSE) 


