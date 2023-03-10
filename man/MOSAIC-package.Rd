% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MOSAIC-package.R
\docType{package}
\name{MOSAIC-package}
\alias{MOSAIC}
\alias{MOSAIC-package}
\title{MOSAIC: MOSAIC Organises Segments of Ancestry In Chromosomes}
\description{
MOSAIC is a package for inferring ancestry segments and characterizing admixture events from dense genotype data. Admixture involves a number of genetically differentiated groups coming together; MOSAIC jointly infers the demographic history of the samples and properties of the admixing groups. The algorithm employs nested hidden Markov models to obtain highly accurate ancestry estimation along the genome for each admixed individual. It does not require any prior knowledge of the relationship between sub-groups of donor reference haplotypes and the unseen mixing ancestral populations which MOSAIC infers terms of conditional "copying probabilities".
}
\details{
MOSAIC is designed to run on the command line. 
Try "Rscript mosaic.R --help"
to see how to use MOSAIC. The only two arguments that must be provided are:
1. The name of the target admixed population 
2. The folder in which the data are stored (see below for details).
MOSAIC may also be used in an interactive R session. First load the package then use "run_mosaic(target,folder,chromosomes,A,n)"
where A is the number of unseen mixing groups and n is the number of target haplotypes. Specifying n larger than
the number of haplotypes in the target file results in running MOSAIC on all of them. A defaults to 2 and n to 1000.
There should be a folder with 4 types of input file:
1. phased haplotypes: "pop.genofile.chr" in the format #snps rows and #haps columns.
2. pop names: "sample.names" format unimportant apart from first column should have all the population names.
3. snp files: "snpfile.chr" #snps rowns and 6 columns of rsID, chr, position, distance, allele ?, allele ?. 
4. recombination map: "rates.chr" 3 rows of #sites, position, recombination rate.
Although this is an internal function, all the import will happen here
}
\examples{
# real data example
mosaic.result=run_mosaic("Moroccan","example_data/",18:22,2,2)
# simulated example
mosaic.result=run_mosaic("simulated","example_data/",18:22,2,2,c("English","Mandenka"))
}
\references{
"Fine-scale Inference of Ancestry Segments without Prior Knowledge of Admixing Groups" by Salter-Townshend, M. and Myers, S.R.; Genetics (2019): https://doi.org/10.1534/genetics.119.302139
}
\seealso{
Useful links:
\itemize{
  \item \url{https://maths.ucd.ie/~mst/MOSAIC/}
}

}
\keyword{internal}
