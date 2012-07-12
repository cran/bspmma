\name{caprie.3grps}
\docType{data}
\alias{caprie.3grps}
\title{CAPRIE Study: Three Risk Groups}
\description{From the CAPRIE study comparing clopidogrel versus Aspirin,
  this dataset gives risk ratios and their SEs separately for patients
  who had stroke, heart attack (myocardial infarction or MI), and
  peripheral arterial disease (PAD).}
\usage{data(caprie.3grps)}
\format{A data frame with three rows, corresponding to the three risk groups.
  There are three columns: study (character, for the risk groups),
  psi.hat (numeric, the log odds ratio, and se.psi.hat (numeric,
  estimated SE of the log odds ratio).}
\source{CAPRIE Steering Committee (1996), A randomized, blinded trial of
clopidogrel versus aspirin in patients at risk of ischaemic events
(CAPRIE), \emph{Lancet}, 348, 1329--1339.

Burr and Doss (2005) state how the SEs for the log odds ratios for the
three risk groups are
obtained from data on p.\ 1334 of the CAPRIE article.}
\references{Burr, D. and Doss, H. (2005).  A Bayesian semi-parametric
  model for random effects meta analysis.  \emph{The
  Journal of the American Statistical Association},100,
  242--251.}

  
