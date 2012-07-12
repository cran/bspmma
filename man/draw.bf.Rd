\name{draw.bf}
\alias{draw.bf}
\title{Plot Function for Bayes Factors}
\description{
This function plots the output from function bf.c.o.
}
\usage{
draw.bf(obj,line.lwd=2, ...)
}
\arguments{
  \item{obj}{is a list with two elements, the vectors x and y to be
  plotted in a scatterplot, which are produced by function \code{bf.c.o}.
  The first element is the values of \eqn{M} to go on the x-axis,
  and the second element is the Bayes factors calculated by
  \code{bf.c.o}.}
  \item{line.lwd}{graphical parameter; the relative thickness of the
    plotted line}
  \item{...}{additional graphical parameters for the overall plot}
 }  
    
