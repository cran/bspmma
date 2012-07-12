\name{bf1}
\alias{bf1}
\title{Generate Chains for Computation of Bayes Factors}
\description{
Generate nine matrices of MCMC output under the ordinary Dirichlet
model, for nine fixed values of the precision parameter \eqn{M}{M}.
This MCMC output is needed for computing Bayes factors.
}
\usage{
bf1(data,seed=1,ncycles=2000,d=c(.1,.1,0,1000),K=10,burnin=1000)
}
\arguments{
  \item{data}{is a two-column matrix with a row for each study
    in the meta-analysis.  The first column is the log of estimate
    of relative risk, often a log(odds ratio).  The second column is
    the true or estimated standard error of the log(odds ratio).}
  \item{seed}{is the value of the seed for starting the random number
    generator, which will be used before each of the nine calls to the
    function \code{dirichlet.o}.}
  \item{ncycles}{is the number of cycles of the Markov chain.}
  \item{d}{is a vector of length four with the values of the
    hyperparameters, in order, the location and scale of the Gamma
    inverse prior, mean and variance multiplier for the normal prior
    on \eqn{\mu}{mu}.}
  \item{K}{is the number of summands to include when one uses
    Sethuraman's (1994) representation for getting the parameter
    \eqn{\eta =}{eta =} mean(\eqn{F}{F}).  If you do not intend
    to use this parameter, then take \eqn{K}{K} small, say
    \eqn{K=10}{K=10}.}  
  \item{burnin}{is the number of Markov chain cycles to drop.}
}
\details{\cite{Doss (2012)} describes a method for estimating Bayes
  factors for many \eqn{M}{M} values in a Dirichlet mixing model;
  the method requires judicious selection of multiple hyperparameter
  points at which to estimate the posterior distribution by MCMC under
  the ordinary Dirichlet model.  The function \code{bf1} is used for
  estimating Bayes factors for conditional vs.\ ordinary Dirichlet
  models, and for comparing values of \eqn{M}{M} in the conditional
  model or in the ordinary model, for a range of the precision parameter
  \eqn{M}{M} which cover the range of values of interest in most
  practical problems.  The function \code{bf1} generates the MCMC
  output for a hard-wired selection of hyperparameters which work
  well to give low-variance estimates of Bayes factors of interest
  in practice.  Chains are generated for nine values of the Dirichlet
  precision parameter \eqn{M}{M}:
  \eqn{.25, .5, 1, 2, 4, 8, 16, 32}{.25, .5, 1, 2, 4, 8, 16, 32},
  and \eqn{64}{64}.
  The rest of the Dirichlet model is specified by the parameters of the
  normal/inverse Gamma prior, which by default are 
  \eqn{\vec{d} = (.1,.1,0,1000)}{d = (.1,.1,0,1000)}.  
}
\value{List with nine matrix components.  Each matrix has
  \eqn{nr}{nr} rows and \eqn{nc}{nc} columns, where
  \eqn{nr=}{nr=} \code{ncycles} \eqn{-}{-} \code{burnin},
  \eqn{nc=}{nc=} (number of studies) \eqn{+ 4}{+4} for the row label,
  the individual study parameter values, and the three overall
  parameters, \eqn{\mu}{mu}, \eqn{\tau}{tau}, and \eqn{\eta}{eta}.
}  
\references{
Doss, Hani (2012).  \dQuote{Hyperparameter and model selection for
  nonparametric Bayes problems via Radon-Nikodym derivatives.}
\emph{Statistica Sinica}, 22, 1--26.
  
Sethuraman, J. (1994).  \dQuote{A constructive definition of Dirichlet
priors.} \emph{Statistica Sinica 4}, 639--650.
}  
\examples{
\dontrun{
## Set up the data.

data(breast.17) # the breast cancer dataset
breast.data <- as.matrix(breast.17) # put data in matrix object

## Default values ncycles=2000, burnin=1000, seed=1
##  CPU time is given from a run of the R command system.time() on an
##  Intel $2.8$ GHz Q$9550$ running Linux
chain1.list <- bf1(breast.data) # 40.5 secs
## Next get a second set of 9 chains, with a different seed 
chain2.list <- bf2(breast.data, seed=2) # 40.4 secs

## Perhaps save for another time.
save(chain1.list,chain2.list,file="breast-rdat-2lists-1000",compress=TRUE)

## later session
load("breast-rdat-2lists-1000")

}
}

