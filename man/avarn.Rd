\name{avarn}
\alias{avarn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Allan Variance (incremental cluster size by unit).
}
\description{
The function \code{avarn} computes the Allan Variance of a set of values with a given constant sampling frequency. The input has to be the output rate/acceleration from the sensors. In this version of the Allan variance computation the number and size of cluster n has been computed as the maximum number of cluster into N recorded values, which is ceil [(N-1)/2].
}
\usage{
avarn(values, freq)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{values}{
  Calibrated sensor output (i.e: angular velocity or acceleration)
}
  \item{freq}{
  Sampling frequency rate in Hertz
}
}
\details{
It computes the Allan variance in the same way that \code{avar} function. The difference is that the number of cluster time and size are selected as the maximum number of cluster into N recorded values. However, Papoulis et.al recommend to estimate the amplitude of different noise components defined as in \code{avar} function. Therefore is recommended to use the \code{\link{avar}} in most of the cases, considering also computational cost.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Return an object of class \code{\link{data.frame}} containing the Allan Variance computation with the following fields:
\item{time}{Value of the cluster time.}
\item{av}{The Allan variance value: variance among clusters of same size.}
\item{error}{Error on the estimation: Uncertainty of the value.}

}
\references{
Allan, D. W. (1966)
\emph{Statistics of Atomic Frequency Standards} Proceedings of IEEE, vol. 54, no. 2, pp. 221-230, Feb, 1966.

IEEE Std 952-1997 \emph{IEEE Standard Specification Format Guide and Test Procedure for
Single Axis Interferometric Fiber Optic Gyros}.

Papoulis, A and Unnikrisha,S (2002)
\emph{Probability, Random Variables and Stochastic Processes} Fourth Edition. McGraw Hill Series in electrical and Computer Engineering.

}
\author{
Javier Hidalgo Carrio <javier.hidalgo_carrio@dfki.de>

}
%\note{
%A&R Group, DFKI, CAR-CSIC
%}


%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
#Load data 
data(gyroz)

#Allan variance computation using avarn
avngyroz <- avarn(gyroz@.Data, frequency(gyroz))
plotav(avngyroz)
abline(1.0+log(avngyroz$time[1]), -1/2, col="green", lwd=4, lty=10)
abline(1.0+log(avngyroz$time[1]), 1/2, col="green", lwd=4, lty=10)
legend(0.11, 1e-03, c("Random Walk"))
legend(25, 1e-03, c("Rate Random Walk"))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
