\name{draw.post}
\alias{draw.post}
\title{Overlapping Plots of Posterior Distributions for Several Models}
\description{
  Draw overlapping kernel density estimates of the posterior
  distributions of the parameters of the conditional or ordinary
  Dirichlet model, where the posteriors arise from different values
  of the Dirichlet precision parameter \eqn{M}.
}
\usage{
draw.post(mcout,burnin=1000,ind.par=NULL,adjust=1,...)
}
\arguments{
  \item{mcout}{is a list.  Each item in the list is a matrix of MCMC
    output, corresponding to different values of \eqn{M}, the precision
    parameter of the Dirichlet model.  If the matrices are output
    from \code{dirichlet.c}, each matrix has \eqn{ncycles} \eqn{+1}
    rows and \eqn{m+2} columns, where
    \eqn{m} is the number of studies in the meta-analysis and
    \eqn{ncycles} is the number of runs of the Markov chain.
    The matrix output from the ordinary Dirichlet model function
    \code{dirichlet.o} is similar but has an additional column.  The
    rows hold output from separate Markov chain runs (the first row is
    the initial values.)  Columns \eqn{1}{1} through \eqn{m} hold the
    individual study parameters, the \eqn{\psi_i}'s.  The next two
    columns hold the mean and standard deviation parameters of the
    centering normal distribution of the Dirichlet prior,
    \eqn{\mu}{mu} and \eqn{\tau}{tau}.  In the case of the ordinary
    Dirichlet model, an additional column is added to hold the values
    of \eqn{\eta}{eta}.}
  \item{burnin}{is the number of initial chains to omit from the
    estimates, must be no larger than \eqn{ncycles - 10}.}
  \item{ind.par}{an integer vector, containing indices of which columns
    of \code{mcout} to include in the plots.  By default, only the
    posterior density estimates for the hyperparameters \eqn{\mu}{mu}
    and \eqn{\tau}{{tau}, and for the ordinary Dirichlet---
    \eqn{\eta}{eta}---are produced.}}
  \item{adjust}{is the bin width argument for the call to the R base
    package function density.}
  \item{...}{additional arguments to plot may be supplied.}
 } 
\examples{
\dontrun{
## Conditional Dirichlet model

## Set up the breast cancer dataset.

data(breast.17) 
breast.data <- as.matrix(breast.17) # Data must be a matrix object.

##  Generate at least two chains, from models which are the same except
## for different \eqn{M}{M} values.

set.seed(1) # initialize the seed at 1 for test purposes
breast.c1 <- dirichlet.c(breast.data, ncycles=4000, M=5)
breast.c2 <- dirichlet.c(breast.data,ncycles=4000, M=1000)

##  Create list object.

breast.c1c2 <- list("5"=breast.c1$chain, "1000"= breast.c2$chain)

##  Decide on some number of initial runs to omit from the analysis.

draw.post(breast.c1c2, burnin=100) # plots for hyperparameters only
}
}
