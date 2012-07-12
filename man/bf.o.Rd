\name{bf.o}
\alias{bf.o}
\title{Compute Bayes Factors for Comparing Values of the Dirichlet
  Precision Parameter in the Ordinary Dirichlet Model}
\description{
This function carries out the final step in computing Bayes factors for
comparing a sequence of values of the Dirichlet precision parameter
\eqn{M}{M} for the ordinary Dirichlet mixing model.
}
\usage{
bf.o(df=-99, from=.4, incr=.1, to, cc, mat.list)
}
\arguments{
  \item{df}{degrees of freedom for the \eqn{t}{t} distribution in the
    model; \eqn{df=-99} corresponds to a normal distribution.}
  \item{from}{is the starting value for the sequence of values of
    the precision parameter \eqn{M}{M} at which to compute
    the Bayes factor.}
  \item{incr}{is the amount by which to increment the values
    of \eqn{M}{M}.}
  \item{to}{is the ending value for the sequence of values
    of \eqn{M}{M}.}
  \item{cc}{is the vector of nine constants computed by \code{bf1}
    and \code{bf2} prior to this step in the algorithm.}
  \item{mat.list}{list of nine matrices of MCMC output produced by
    \code{bf1} for the final computation of the Bayes factors.}
 }  
 \details{
  This function carries out the fourth and final step in the computation
  of Bayes factors for the selection of \eqn{M}{M} in the ordinary
  Dirichlet mixing model.  In the current version of the package, the
  Bayes factors for \eqn{M}{M} are computed relative to
  the model with \eqn{M=4}{M=4}.  The sequence of steps implements a
  multiple-chain version of Equation (2.7) of Burr (2012); the details
  of the multiple-chain algorithm are given in Doss (2012).
  Previous steps are calls to \code{bf1}, \code{bf2}, and \code{bf1}
  again, in that order, as illustrated in the Examples section and in
  Burr (2012).
}
\value{
  A list with three named components, \code{Mnew}, \code{y}, and
  \code{yinfinity}, needed to produce the plot of Bayes factors via the
  function \code{draw.bf}.  The vector \code{Mnew} is the sequence of
  (finite) values of \eqn{M}.  The vector \code{y} is the estimates of
  the Bayes factors corresponding to the finite values of \code{Mnew},
  and the object \code{yinfinity} is the value of the Bayes factor for
  \eqn{M}{M} at infinity, that is, for the parametric model.  
}  
\references{
Burr, Deborah (2012).  \dQuote{bspmma:  An R package for Bayesian
  semi-parametric models for meta-analysis.}  \emph{Journal of
  Statistical Software} 50(4), 1--23.
  \url{http://www.jstatsoft.org/v50/i04/.}

Doss, Hani (2012).  \dQuote{Hyperparameter and model selection for
  nonparametric Bayes problems via Radon-Nikodym derivatives.}
\emph{Statistica Sinica} 22, 1--26.
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

## Compute and plot the Bayes factors
breast.bfo <- bf.o(to=20, cc=cc, mat.list=chain2.list) #51 secs
draw.bf(breast.bfo)
}
}
