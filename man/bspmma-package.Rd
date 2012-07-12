\name{bspmma-package}
\Rdversion{1.1}
\alias{bspmma-package}
\alias{bspmma}
\docType{package}
\title{
bspmma: Bayesian Semiparametric Models for Meta-Analysis
}
\description{
  Two functions carry out Gibbs' sampler routines to estimate the posterior
  distributions from either a non-parametric Bayesian model for random
  effects meta-analysis, or from a semi-parametric model.  A group of
  three functions are used to compute Bayes factors to compare the two
  models.  Three sample datasets are included.  There are routines for
  graphing the posteriors and computing summary statistics.
}
\details{
\tabular{ll}{
Package: \tab bspmma\cr
Version: \tab 0.1-1\cr
Date: \tab 2012-07-12\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
Built: \tab R 2.9.2; ; 2012-07-13 19:04:37 UTC; unix\cr
}

Index:
\preformatted{
bf.c                    Compute Bayes Factors for Comparing Values of
                        the Dirichlet Precision Parameter in the
                        Conditional Dirichlet Model
bf.c.o                  Compute Bayes Factors for Conditional vs.
                        Ordinary Dirichlet Models
bf.o                    Compute Bayes Factors for Comparing Values of
                        the Dirichlet Precision Parameter in the
                        Ordinary Dirichlet Model
bf1                     Generate Chains for Computation of Bayes
                        Factors
bf2                     Compute Constants for Multi-Chain Algorithm to
                        Compute Bayes Factors
breast.17               Aspirin and Breast Cancer: 17 studies
bspmma-package          bspmma: Bayesian Semiparametric Models for
                        Meta-Analysis
caprie.3grps            CAPRIE Study: Three Risk Groups
ddtm.s                  Decontamination of the Digestive Tract
                        Mortality, Short Dataset
describe.post           Brief summary statistics of the posterior for
                        convenient comparison of several models
dirichlet.c             Mixture of Conditional Dirichlet Model
dirichlet.o             Mixture of Ordinary Dirichlet Model
draw.bf                 Plot Function for Bayes Factors
draw.post               Overlapping Plots of Posterior Distributions
                        for Several Models
print.dir.cond          printing method for objects of class dir.cond
print.dir.ord           printing method for objects of class dir.ord
}

The main functions are explained in \cite{Burr (2012)}, and are
illustrated on the datasets \code{breast.17} and \code{ddtm.s}.
The function \code{dirichlet.c} carries out the Markov chain Monte Carlo
(MCMC) algorithm to simulate data from the posterior distribution under
the conditional Dirichlet model described in \cite{Burr and Doss (2005)}.
The computation of Bayes factors is carried out in functions
\code{bf1}, \code{bf2}, \code{bf.c}, \code{bf.o}, and \code{bf.c.o},
which implement a multi-chain algorithm described in \cite{Doss (2012)}.
  
}
\author{Deborah Burr

Maintainer: Deborah Burr <burr@stat.ufl.edu>
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

\keyword{ package }
