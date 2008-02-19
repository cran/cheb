\name{chebR}
\alias{chebR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{chebR}
\description{
  Discrete Linear Chebyshev Approximation
}
\usage{
chebR(a, b, tol = 1e-15, relerr = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{ matrix with left-hand sides }
  \item{b}{ vector with right-hand sides }
  \item{tol}{ a small positive tolerance }
  \item{relerr}{ relative error }
}
\details{
R Interface to the CHEB code by Barrodale and Philips for
Discrete Linear Chebyshev Approximation. Computes the Chebyshev
solution to an overdetermined system of linear equations.

relerr is a real variable which on entry must have the value
0.0 if a Chebyshev solution is required. If relerr
is positive, the subroutine calculates an
approximate solution with relerr as an upper bound
on the relative error of its largest residual.
}
\value{
  A list with the following components: 

  \item{coefs }{ regression coefficients}
  \item{resids }{ signed residuals }
  \item{rank }{ rank of coefficient matrix}
  \item{iter }{ number of simplex iterations performed }
  \item{ocode }{ error code: ocode=0 for a probably non-unique
solution, ocode=1
for a unique solution, ocode=2 for premature termination
due to rounding errors }
}
\references{ I. Barrodale and C. Philips. Algorithm 495 – Solutions of an Overdetermined System of Linear Equations 
in the Chebyshev Norm. ACM Transactions on Mathematical Software, 1:264–270, 1975.d}
\author{ Jan de Leeuw }
\examples{
a<-matrix(rnorm(20),10,2)
b<-rnorm(10)
chebR(a,b)
## The function is currently defined as
function(a,b,tol=1e-15,relerr=0.0) {
m<-nrow(a); n<-ncol(a); ndim<-n+3; mdim<-m+1
if (n > m) stop("number of equations exceeds number of unknowns")
aa<-matrix(0,ndim,mdim); bb<-rep(0,mdim); xx<-rep(0,ndim)
aa[1:n,1:m]<-t(a); bb[1:m]<-b
rlist<-.Fortran("cheb",as.integer(m),as.integer(n),as.integer(m+1),as.integer(n+3),
	as.single(aa),bb=as.single(bb),as.single(tol),as.single(relerr),xx=as.single(xx),
	rank=as.integer(0),resmax=as.single(0.0),iter=as.integer(0),ocode=as.integer(0))
return(list(coefs=rlist$xx[1:n],resids=rlist$bb[1:m],rank=rlist$rank,iter=rlist$iter,ocode=rlist$ocode))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ optimize }
\keyword{ regression }% __ONLY ONE__ keyword per line
