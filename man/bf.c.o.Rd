\name{bf.c.o}
\alias{bf.c.o}
\title{Compute Bayes Factors for Conditional vs. Ordinary Dirichlet
Models}
\description{
This function carries out the final step in computing Bayes factors for
comparing conditional and ordinary Dirichlet mixing models, for a
sequence of Dirichlet precision parameters \eqn{M}{M}.
}
\usage{
bf.c.o(df=-99, from=.4, incr=.1, to, cc, mat.list)
}
\arguments{
  \item{df}{degrees of freedom for the \eqn{t}{t} distribution in the
    model; \eqn{df=-99} corresponds to a normal distribution.}
  \item{cc}{is the vector of nine constants computed by \code{bf1}
    and \code{bf2}.}
  \item{from}{is the starting value for the sequence of values of
    the precision parameter \eqn{M}{M} at which to compute
    the Bayes factor.}
  \item{to}{is the ending value for the sequence of values
    of \eqn{M}{M}.}
  \item{incr}{is the amount by which to increment the values
    of \eqn{M}{M}.}
  \item{mat.list}{list of nine matrices of MCMC output produced by
    \code{bf1} for the final computation of the Bayes factors.}
 }  
\details{
  This function carries out the fourth and final step in the computation
  of Bayes factors for the conditional vs. ordinary Dirichlet mixing
  models.  It implements a multiple-chain version of Equation (2.7) of
  Burr (2012); the details of the multiple-chain algorithm are given in
  Doss (2012).  Previous steps are two calls to \code{bf1} and a call to
  \code{bf2}, as illustrated in the Examples section and in Burr (2012).
}
\value{
  A list with two named components, \code{Mnew} and \code{y}.  The
  vector \code{Mnew} is the sequence of (finite) values of \eqn{M}.
  The vector \code{y} is the estimates of the Bayes factors
  corresponding to \code{Mnew}.
}  
\references{
Burr, Deborah (2012).  \dQuote{bspmma:  An R package for Bayesian
  semiparametric models for meta-analysis.}  \emph{Journal of
  Statistical Software} 50(4), 1--23.
  \url{http://www.jstatsoft.org/v50/i04/}.

Doss, Hani (2012).  \dQuote{Hyperparameter and model selection for
  nonparametric Bayes problems via Radon-Nikodym derivatives.}
\emph{Statistica Sinica}22, 1--26.
}
\examples{
\dontrun{
##  CPU times are from runs of the R command system.time() on an
##  Intel $2.8$ GHz Q$9550$ running Linux.
## Preliminary steps

data(breast.17) # the breast cancer dataset
breast.data <- as.matrix(breast.17) # put data in matrix object
chain1.list <- bf1(breast.data) # 40.5 secs
cc <- bf2(chain1.list) # 1.6 secs
## Next get a second set of 9 chains, with a different seed
chain2.list <- bf1(breast.data,seed=2) # 40.4 secs

## OR load the chains and constants saved earlier
load("breast-rdat-2lists-1000")
load("breast-rdat-2lists-1000")

## Compute and plot the Bayes factors
breast.bfco <- bf.c.o(to=20, cc=cc, mat.list=chain2.list) # 107 secs
draw.bf(breast.bfco)
}
}
