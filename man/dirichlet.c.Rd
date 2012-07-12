\name{dirichlet.c}
\alias{dirichlet.c}
\title{Mixture of Conditional Dirichlet Model}
\description{MCMC generation of posterior distributions for the
  conditional Dirichlet mixing distribution model, using
  \eqn{m+1}-cycle Gibbs sampler}
\usage{
dirichlet.c(data, ncycles=10, M=1,d=c(.1,.1,0,1000),
            start=NULL)
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
    on \eqn{\mu}{mu}.}
  \item{start}{is an optional vector containing starting values for the
  parameters, \eqn{\psi_i, i=1, \ldots, m} where \eqn{m} is the number of
  studies in the meta-analysis, \eqn{\mu}{mu} and \eqn{\tau}{tau}.}
}  
\details{
  This function generates MCMC output for the posterior distribution for
  the parameters \eqn{\psi_i, i=1, \ldots, m}
  where \eqn{m} is the number of
  studies in the meta-analysis, \eqn{\mu}{mu} and \eqn{\tau}{tau},
  in the conditional Dirichlet mixing model for random-effects
  meta-analysis.  Notation is taken from \cite{Burr (2012)},
  Model \eqn{4}.

  The MCMC algorithm for estimating the posterior under this model is
  given in \cite{Burr and Doss (2005)}.  The chain is a
  \eqn{(m+1)}-cycle Gibbs sampler which cycles through
  the vector of \eqn{\psi_i}'s and the pair \eqn{\mu}{mu},
  \eqn{\tau}{tau}, and
  the main part of the computational burden is in the first part of the
  cycle, the generation of the vector of \eqn{\psi_i}'s.

  If starting values are not specified via the argument \code{start},
  the default values are used, which are based on the data.  The study
  estimates are the starting values for the \eqn{\psi_i, i=1, \ldots,m},
  and the mean and standard deviation of the study estimates are the
  starting values for \eqn{\mu}{mu} and \eqn{\tau}{tau}, respectively.
  
}  
\value{
  \item{call}{the call that resulted in this object}
  \item{ncycles}{the number of cycles in the Markov chain}
  \item{M}{the value of the precision parameter for the conditional
    Dirichlet model}
  \item{prior}{the vector length four of hyperparameters}
  \item{chain}{A matrix with \code{ncycles} \eqn{+1} rows and \eqn{m+2}
    columns, where \eqn{m} is the number of studies in the meta-analysis.
    The rows hold output from the Markov chain runs (the first row is
    the initial values).   Columns \eqn{1} through \eqn{m} hold the
    individual study parameters, the \eqn{\psi_i}'s.  The final two
    columns hold the mean and standard deviation parameters of the
    centering normal distribution of the Dirichlet prior, \eqn{\mu}{mu}
    and \eqn{\tau}{tau}.}
  \item{start.user}{logical, TRUE if the user supplied initial values of
    the parameter vector, FALSE if input argument \code{start} was not
    specified by the user.}
  \item{start}{vector of initial parameter values used in the MCMC
    algorithm, whether this was the default or was user-supplied}
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
set.seed(1) # initialize the seed at 1 for test purposes
breast.c1 <- dirichlet.c(breast.data, ncycles=4000, M=5)
breast.c2 <- dirichlet.c(breast.data,ncycles=4000, M=1000)
}
}
