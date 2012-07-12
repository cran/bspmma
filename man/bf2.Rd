\name{bf2}
\alias{bf2}
\title{Compute Constants for Multi-Chain Algorithm to Compute
  Bayes Factors}
\description{
This function computes nine constants needed in the multi-chain
algorithm for Bayes factors comparing conditional and ordinary
Dirichlet mixing models, and for Bayes factors comparing Dirichlet
precision parameter (\eqn{M}{M}) values for the conditional model,
or for the ordinary model.
}
\usage{
bf2(chain.list)
}
\arguments{
  \item{chain.list}{is a list of nine matrices of MCMC output produced by
    function bf1}
 } 
\details{This function computes the constants needed for the
  denominator of the left-side of Eqn. (2.5) of Doss (2012).
  This is the step in which Radon-Nikodym derivatives are evaluated
  for each line of MCMC output and then averaged to estimate the
  constants.  The actual algorithm is a little more complicated than
  that to make use of output from multiple chains.  Nine constants are
  computed in this way.
 }
\value{A vector of nine constants which is needed in the next step
   of the computation of the Bayes factors.  
   Burr (2012) gives detailed explanations of the algorithm and
   illustrates the steps in the algorithm.
}   
\references{
 Burr, Deborah (2012).  \dQuote{bspmma:  An R package for Bayesian
   semi-parametric models for meta-analysis.}  \emph{Journal of
   Statistical Software} 50(4), 1--23.
   \url{http://www.jstatsoft.org/v50/i04/.}
 
 Doss, Hani (2012).  \dQuote{Hyperparameter and model selection for
 nonparametric Bayes problems via Radon-Nikodym derivatives.}
\emph{Statistica Sinica}, 22, 1--26.
}
\examples{
\dontrun{
## Get the two sets of chains saved from runs of bf1 from
## the breast cancer example in the help file for bf1.
load("breast-rdat-2lists-1000")

## Default values ncycles=2000, burnin=1000
##  CPU time is from a run of the R command system.time() on an
##  Intel $2.8$ GHz Q$9550$ running Linux.
cc <- bf2(chain1.list) #1.6 secs

## Perhaps save for another time.
save(cc,file="breast-rdat-constants",compress=TRUE)

## Next session
load("breast-rdat-constants")

}
}
    
