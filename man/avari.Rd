\name{avari}
\alias{avari}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Allan Variance (from integrated values).
}
\description{
The function \code{avari} computes the Allan Variance of a set of values with a given constant sampling frequency. The diferent with \code{avar} function is that the input values are the integral value of  sensor output (i.e: rate/acceleration). That means angle from gyros and velocity from accelerometers. In this version of the Allan variance computation the number and size of cluster n has been computed as in \code{\link{avar}} function \eqn{n=2^l, l=1,2,\ldots}(Allan 1987).
}
\usage{
avari(values, freq)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{values}{
  Integration of the calibrated sensor output (i.e: angel or velocity)
}
  \item{freq}{
  Sampling frequency rate in Hertz
}
}

\details{
The Allan variance can also be defined either in terms of the output rate as defined in \code{\link{avar}} by \eqn{\Omega(t)} or using  the output angle/velocity as this function does. Defining:

\deqn{\theta(t) = \int^t \Omega(t^{'})dt^{'}}

The lower integration limit is not specified as only angle differences are employed in the definition. Angle measurement are made at discrete times given by \eqn{t = nt_0, n = 1,2,\ldots, N}. The notation is simplify by writing \eqn{\theta_k = \theta (k t_0)}. The cluster average is now defined as: 

\eqn{\bar{\Omega}_k(\tau)= (\theta_{k+n} - \theta_k)/\tau} and \eqn{\bar{\Omega}_{k+1}(\tau)= (\theta_{k+2n} - \theta_{k+n})/(\tau)} 

The equivalent Allan Variance estimation is defined as:

\deqn{\theta^2(\tau) = 1/(2\tau^2 (N - 2n)) \sum_{k=1}^{N-2n} [\theta_{k+2n} - 2\theta_{k+n} + \theta_k ]^2}


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

El-Sheimy, N.; Haiying Hou.; Xiaoji, Niu (2008)
\emph{Analysis and Modeling of Inertial Sensors Using Allan Variance} IEEE Transaction on Instrumentation and Measurement.

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

#Allan variance computation using avari
#Simple integration of the angular velocity
igyroz <- cumsum(gyroz@.Data * (1/frequency(gyroz)))
igyroz <- ts (igyroz, start=c(igyroz[1]), delta=(1/frequency(gyroz)))
avigyroz <- avari(igyroz@.Data, frequency(igyroz))
plotav(avigyroz)
abline(1.0+log(avigyroz$time[1]), -1/2, col="green", lwd=4, lty=10)
abline(1.0+log(avigyroz$time[1]), 1/2, col="green", lwd=4, lty=10)
legend(0.11, 1e-03, c("Random Walk"))
legend(25, 1e-03, c("Rate Random Walk"))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
