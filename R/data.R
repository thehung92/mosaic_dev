#' Example data for MOSAIC
#' 
#' This dataset contains genotype data on chromosome 18-22
#'   for English, French, Mandenka, Morocan and Yoruba.
#'   The details are as follows:
#' @name raw_exampleData
#' @aliases exampleData
#' @details 
#' This data is used in the examples of the help page
#' @format a genetic dataset with genofile, snpfile, sample files and rate file.
#'   It should be in the eigenstrat format. it's not. only 0,1 available
#'   url: https://reich.hms.harvard.edu/software/InputFileFormats
#' \describe{
#'   \item{genofile}{phased genofile with binary value 0-ref, 1-alt. keywords: .phgeno}
#'   \item{snpfile}{column header (6): snp_id, chr_num, gen_dist, phys_pos, ref, alt}
#'   \item{samplefile}{column header (7): FID, IID, within-fam ID of father, within-fam ID of mother, missing call frequency, gender, phenotype}
#'   \item{ratefile}{recombination rate file 3 rows: number of site, phys-pos, gen_dist}
#' }
NULL