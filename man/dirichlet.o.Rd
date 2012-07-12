\name{dirichlet.o}
\alias{dirichlet.o}
\title{Mixture of Ordinary Dirichlet Model}
\description{MCMC generation of posterior distributions for the
  usual (unconditional) Dirichlet mixing distribution model, using
  an \eqn{m+1}-cycle Gibbs sampler}
\usage{
dirichlet.o(data, ncycles=10, M=1,d=c(.1,.1,0,1000),
            start=NULL,K=100)
}
\arguments{
  \item{data}{is a two-column matrix with a row for each study
    in the meta-analysis.  The first column is the log of estimate
    of relative risk, often a log(odds ratio).  The second column is
    the true or estimated standard error of the log(odds ratio).}
  \item{ncycles}{is the number of cycles of the Markov chain.}
  \item{M}{is the precision parameter of the Dirichlet process prior.}
  \item{d}{is a vector of length four with the values of the
    hyperparameters, in order, the location and scale of the Gamma
    inverse prior, mean and variance multiplier for the normal prior
    on mu.}
  \item{start}{is an optional vector containing starting values for the
  parameters, \eqn{\psi_i, i=1, \ldots, m} where \eqn{m} is the number of
  studies in the meta-analysis, \eqn{\mu}{mu} and \eqn{\tau}{tau}.}  
  \item{K}{is the number of summands to include when one uses
    Sethuraman's (1994) representation for getting the parameter
    \eqn{\eta =} mean(\eqn{F}).  If you do not intend to use this
    parameter, then take \eqn{K} small, say \eqn{K=10}.}
}
\details{
  This function generates MCMC output for the posterior distribution for
  the parameters \eqn{\psi_i, i=1,...,m} where \eqn{m} is the number of
  studies in the meta-analysis, \eqn{\mu}{mu}, \eqn{\tau}, and \eqn{\eta}
  in the ordinary Dirichlet mixing model for random-effects
  meta-analysis.  Notation is taken from \cite{Burr (2012)},
  Model \eqn{2} and \eqn{3}.

  The MCMC algorithm for estimating the posterior under this model is
  given in \cite{Burr and Doss (2005)}.  The chain is a
  \eqn{(m+1)}-cycle Gibbs sampler which cycles through
  the vector of \eqn{\psi_i}'s and the triple \eqn{\mu}{mu}, \eqn{\tau},
  \eqn{\eta}, and the main part of the computational burden is in the
  first part of the cycle, the generation of the vector of
  \eqn{\psi_i}'s.
}  
\value{
  \item{call}{the call that resulted in this object}
  \item{ncycles}{the number of cycles in the Markov chain}
  \item{M}{the value of the precision parameter for the conditional
    Dirichlet model}
  \item{prior}{the vector length four of hyperparameters}
  \item{chain}{A matrix with \code{ncycles} \eqn{+1} rows and
    \eqn{m+3} columns, where \eqn{m} is the number of studies in the
    meta-analysis.  The rows hold output from the Markov chain runs
    (the first row is the initial values).  Columns \eqn{1} through
    \eqn{m} hold the individual study parameters, the \eqn{\psi_i}'s.
    The next two columns hold the mean and standard deviation
    parameters of the centering normal distribution of the Dirichlet
    prior, \eqn{\mu}{mu} and \eqn{\tau}, and the final column holds
    the parameter \eqn{\eta}.  In the ordinary Dirichlet mixing model,
    the parameter \eqn{\mu}{mu} does not equal the mean of the
    distribution \eqn{F} of the \eqn{\psi_i}'s; we denote this
    mean \eqn{\eta} and estimate it by Sethuraman's (1994) method.}
  \item{start.user}{logical, TRUE if the user supplied initial values of
    the parameter vector, FALSE if input argument \code{start} was not
    specified by the user.}
  \item{start}{vector of initial parameter values, whether default or
    user-supplied}
}  
\references{
Burr, Deborah (2012).  \dQuote{bspmma:  An R package for Bayesian
  semi-parametric models for meta-analysis.}  \emph{Journal of
  Statistical Software} 50(4), 1--23.
  \url{http://www.jstatsoft.org/v50/i04/.}
  
Burr, D. and Doss, H. (2005).  \dQuote{A Bayesian semiparametric model
for random-effects meta-analysis.}  \emph{Journal of the American
Statistical Association 100} 242--251.
  
  
Sethuraman, J. (1994).  \dQuote{A constructive definition of Dirichlet
priors.}  \emph{Statistica Sinica 4}, 639--650.
}
\examples{
\dontrun{
data(breast.17) # the dataset
breast.data <- as.matrix(breast.17) # put data in matrix object
set.seed(1) # initialize the seed at 1 
diro <- dirichlet.o(breast.data, ncycles=4000, M=5)

## a short description of the model and Markov chain
print(diro1)

## the last mcmc cycle
diro$mcmc[4001,]
}
}

  
    
