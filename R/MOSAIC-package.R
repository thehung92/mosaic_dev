#' @keywords internal
#' @details
#' MOSAIC is designed to run on the command line. 
#' Try "Rscript mosaic.R --help"
#' to see how to use MOSAIC. The only two arguments that must be provided are:
#' 1. The name of the target admixed population 
#' 2. The folder in which the data are stored (see below for details).
#' MOSAIC may also be used in an interactive R session. First load the package then use "run_mosaic(target,folder,chromosomes,A,n)"
#' where A is the number of unseen mixing groups and n is the number of target haplotypes. Specifying n larger than
#' the number of haplotypes in the target file results in running MOSAIC on all of them. A defaults to 2 and n to 1000.
#' There should be a folder with 4 types of input file:
#' 1. phased haplotypes: "pop.genofile.chr" in the format #snps rows and #haps columns.
#' 2. pop names: "sample.names" format unimportant apart from first column should have all the population names.
#' 3. snp files: "snpfile.chr" #snps rowns and 6 columns of rsID, chr, position, distance, allele ?, allele ?. 
#' 4. recombination map: "rates.chr" 3 rows of #sites, position, recombination rate.
#' Although this is an internal function, all the import will happen here
#' @useDynLib MOSAIC, .registration=TRUE
#' @exportPattern "^[[:alpha:]]+"
#' @importFrom Rcpp evalCpp
#' @importFrom parallel detectCores
#' @importFrom doParallel registerDoParallel
#' @importFrom foreach foreach 
#' @importFrom foreach '%dopar%' 
#' @importFrom ff ff 
#' @importFrom ff delete 
#' @importFrom compiler cmpfun 
#' @importFrom cluster fanny 
#' @importFrom maps map 
#' @importFrom bit clone 
#' @importFrom combinat permn 
#' @importFrom LaF laf_open_fwf 
#' @importFrom grDevices col2rgb dev.off pdf rgb 
#' @importFrom graphics abline arrows axTicks axis barplot hist layout legend lines locator mtext par points polygon text 
#' @importFrom stats cor cutree dist hclust optim plogis prcomp qlogis quantile rbinom rexp rgamma runif sd 
#' @importFrom utils read.delim read.table setTxtProgressBar tail txtProgressBar write.table
#' @references "Fine-scale Inference of Ancestry Segments without Prior Knowledge of Admixing Groups" by Salter-Townshend, M. and Myers, S.R.; Genetics (2019): https://doi.org/10.1534/genetics.119.302139
#' @examples
#' # real data example
#' mosaic.result=run_mosaic("Moroccan","example_data/",18:22,2,2)
#' # simulated example
#' mosaic.result=run_mosaic("simulated","example_data/",18:22,2,2,c("English","Mandenka"))
"_PACKAGE"
## usethis namespace: start
## usethis namespace: end
NULL
