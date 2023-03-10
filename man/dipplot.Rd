% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_funcs.R
\name{dipplot}
\alias{dipplot}
\title{Plot local ancestry for a specific chromosome}
\usage{
dipplot(
  ch,
  ind,
  x,
  A,
  probs,
  ylab,
  mlab = paste("Individual", ind),
  xlab = "",
  cexa = 1,
  colvec = c("#E69F00", "#56B4E9", "#009E73", "#CC79A7", "#D55E00", "#F0E442", "#0072B2",
    "#999999")
)
}
\arguments{
\item{ch}{}

\item{ind}{}

\item{x}{}

\item{A}{}

\item{probs}{}

\item{ylab}{}

\item{mlab}{}

\item{xlab}{}

\item{cexa}{}

\item{colvec}{}
}
\value{
base R graphic device
}
\description{
plot a whole chromosome of 1 individual
}
\examples{
chr=1
ind=2
dipplot(chr,ind,g.loc[[chr]],ind,localanc,xlab=paste("Position on Chromosome",chrnos[chr]),ylab="") mp=axTicks(1,axp=round(c(min(g.loc[[chr]]),max(g.loc[[chr]]),5)))
axis(1,at=mp,labels=signif(mp,3))
}
