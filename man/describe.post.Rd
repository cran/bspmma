\name{describe.post}
\alias{describe.post}
\title{Brief summary statistics of the posterior for convenient
  comparison of several models}
\description{
  Compute, print posterior means and posterior P(odds ratio < 1) for
  the individual study parameters and hyperparameters of the model.
}
\usage{
describe.post(mcout,burnin=1000)
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
    estimates.}
}  
\value{
List with two named components, means.table and probs.table, returned
invisibly.
} 
\examples{
\dontrun{
## Set up the data.

data(breast.17) # the breast cancer dataset
breast.data <- as.matrix(breast.17) # put data in matrix object

## Generate at least two chains, from models which are the same except
## for different \eqn{M} values.

set.seed(1) # initialize the seed at 1 
breast.c1 <- dirichlet.c(breast.data, ncycles=4000, M=5)
breast.c2 <- dirichlet.c(breast.data,ncycles=4000, M=1000)

## Create list object.
breast.c1c2 <- list("5"=breast.c1$chain, "1000"= breast.c2$chain)

## Decide on some number of initial runs to omit from the analysis.
describe.post(breast.c1c2, burnin=100)
}
}
