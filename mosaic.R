# script to run all code required to fit MOSAIC. Reads in data, initialises, performs thin->phase->EM cycles and outputs results.
# example usage: Rscript mosaic.R SanKhomani HGDP/ 4 1 60 16
require(MOSAIC)
######################## first set some options ###############################
# important things to set
shargs<-commandArgs(trailingOnly=TRUE) # read in arguments from the command line; 
target=shargs[1]  # e.g. Moroccan
datasource=shargs[2]; # e.g. example_data/ ; note the / at the end is crucial
L=as.integer(shargs[3]) # number of admixing groups
firstind<-as.integer(shargs[4]); # which target individual to start from. If NUMA=2 then only this ind is run
NUMA=as.integer(shargs[5]) # total number of target admixed haplotypes 

MC=as.integer(shargs[6]) # optional number of cores to use for parallelized code; will grab half of all available if not supplied
chrnos=1:22 # which chromosomes to run on

chrnos=22:22;firstind=1;NUMA=2;L=2;datasource="example_data/";target="Moroccan";ANC=NULL
chrnos=20:22;firstind=1;NUMA=2;L=2;datasource="HGDP/";target="simulated";RPE=0.0;ANC=T;

nchrno=length(chrnos) # number of chromosomes for these target haplotypes
ffpath="/dev/shm/" # location of fast-files

# the rest are mostly used in debugging, etc
if (!exists("ANC")) ANC=NULL; # no a-priori knowledge of which panels to use for which ancestries
verbose=T # print certain statements of progress as algorithm runs?
EM=T # run EM algorithm?
doMu=T # update copying matrix parameters?
doPI=T # update ancestry switching parameters parameters?
dorho=T # update recombination w/in same ancestry parameters? 
dotheta=T # update error / mutation parameters?
PLOT=F

ans=run_mosaic(ANC,chrnos,datasource,doMu,doPI,dorho,dotheta,EM,ffpath,firstind,
	       L,MC,nchrno,NUMA,PLOT,target,verbose) # this includes saving results to disk
