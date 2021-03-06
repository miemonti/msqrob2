% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/msqrobQB.R
\name{msqrobQB,SummarizedExperiment-method}
\alias{msqrobQB,SummarizedExperiment-method}
\alias{msqrobQB}
\alias{msqrobQB,Features-method}
\title{Function to fit msqrob models to peptide counts using glm}
\usage{
\S4method{msqrobQB}{SummarizedExperiment}(
  object,
  formula,
  modelColumnName = "msqrobQbModels",
  overwrite = FALSE,
  priorCount = 0.1,
  binomialBound = TRUE
)
}
\arguments{
\item{object}{\code{SummarizedExperiment} or \code{Features} instance}

\item{formula}{Model formula. The model is built based on the
covariates in the data object.}

\item{modelColumnName}{\code{character} to indicate the variable name that is used
to store the msqrob models in the rowData of the SummarizedExperiment
instance or of the assay of the Features instance. Default is "msqrobModels".}

\item{overwrite}{\code{boolean(1)} to indicate if the column in the rowData has to
be overwritten if the modelColumnName already exists. Default is FALSE.}

\item{priorCount}{A 'numeric(1)', which is a prior count to be added to the observations to shrink
the estimated log-fold-changes towards zero. Default is 0.1.}

\item{binomialBound:}{logical, if ‘TRUE’ then the quasibinomial variance estimator will
be never smaller than 1 (no underdispersion). Default is TRUE.}
}
\value{
SummarizedExperiment or Features instance
}
\description{
Low-level function for parameter estimation with msqrob
by modeling peptide counts using quasibinomial glm
}
\examples{

# Load example data
# The data are a Feature object with containing
# a SummarizedExperiment named "peptide" with MaxQuant peptide intensities
# The data are a subset of spike-in the human-ecoli study
# The variable condition in the colData of the Feature object
# contains information on the spike in condition a-e (from low to high)
data(pe)

# Aggregate by counting how many peptide we observe for each protein
pe<-aggregateFeatures(pe,i="peptide",fcol="Proteins",name="protein")

# Fit MSqrob model to peptide counts using a quasi-binomial model
# For summarized SummarizedExperiment
se <- pe[["protein"]]
se
colData(se) <- colData(pe)
se <- msqrobQB(se,formula=~condition)
getCoef(rowData(se)$msqrobQbModels[[1]])

# For features object
pe <- msqrobQB(pe,i="protein",formula=~condition)

}
\author{
Lieven Clement
}
