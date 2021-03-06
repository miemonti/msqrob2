% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/msqrob-framework.R
\docType{class}
\name{StatModel-class}
\alias{StatModel-class}
\alias{.StatModel}
\alias{show,StatModel-method}
\alias{StatModel}
\title{The StatModel class for msqrob}
\usage{
\S4method{show}{StatModel}(object)

StatModel(
  type = "fitError",
  params = list(),
  varPosterior = NA_real_,
  dfPosterior = NA_real_
)
}
\description{
The \code{StatModel} class contains a statistical model as applied on a
feature.

Models are created by the dedicated user-level functions
(\code{msqrob()}, \code{mqrobAggregate()}) or manually, using the
\code{StatModel()} constructor. In the former case, each quantitative
feature is assigned its statistical model and the models are stored
as a variable in a \code{DataFrame} object, as illustred in the example
below.
}
\section{Slots}{

\describe{
\item{\code{type}}{\code{character(1)} defining type of the used model. Default
is \code{"fitError"}, i.e. a error model. Other include \code{"lm"},
\code{"rlm"}, ...}

\item{\code{params}}{A \code{list()} containing information of the used model.}

\item{\code{varPosterior}}{\code{numeric()} of posterior variance.}

\item{\code{dfPosterior}}{\code{numeric()} of posterior degrees of freedom.}
}}

\examples{
## A fully specified dummy model
myModel <- StatModel(type = "rlm",
                     params = list(x = 3, y = 7, b = 4),
                     varPosterior = c(0.1, 0.2, 0.3),
                     dfPosterior = c(6, 7, 8))
myModel
myModel@params


## A collection of models stored as a variable in a DataFrame
mod1 <- StatModel(type = "rlm")
mod2 <- StatModel(type = "lm")
df <- DataFrame(x = 1:2)
df$mods <- c(mod1, mod2)
df
}
\author{
Oliver M. Crook, Laurent Gatto, Lieven Clement
}
