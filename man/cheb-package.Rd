\name{cheb-package}
\alias{cheb-package}
\alias{cheb}
\docType{package}
\title{
Discrete Linear Chebyshev Approximation
}
\description{
R Interface to the CHEB code by Barrodale and Philips for
Discrete Linear Chebyshev Approximation. Computes the Chebyshev
solution to an overdetermined system of linear equations.
}
\details{
\tabular{ll}{
Package: \tab cheb\cr
Type: \tab Package\cr
Version: \tab 0.2\cr
Date: \tab 2008-02-19\cr
License: \tab GPL-3\cr
}
The package contains a single function chebR, which takes as
its arguments a matrix of predictors and a vector of outcomes.}
\author{
Jan de Leeuw

Maintainer: Jan de Leeuw <deleeuw@stat.ucla.edu>
}
\references{
I. Barrodale and C. Philips. Algorithm 495 – Solutions of an Overdetermined System of Linear Equations 
in the Chebyshev Norm. ACM Transactions on Mathematical Software, 1:264–270, 1975.
}
\keyword{ package }
\seealso{
}
\examples{
a<-matrix(rnorm(20),10,2)
b<-rnorm(10)
chebR(a,b)
}
