\name{avar}
\alias{avar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Allan Variance (cluster size as a power of 2).
}
\description{
The function \code{avar} computes the Allan Variance of a set of values with a given constant sampling frequency. The input has to be the output rate/acceleration from the sensors. In this version of the Allan variance computation the number and size of cluster has been computed as a power of 2 n=2^l, l=1,2,3,...(Allan 1987) which is convenient to estimate the amplitude of different noise components.
}
\usage{
avar(values, freq)
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
Considering a number \eqn{N} of outputs from the sensor at a constant time interval of  \eqn{t_0}. \eqn{n} groups of consecutive data points could be formed \eqn{(n<N/2)}, each member of the groups is a cluster. Associated with each cluster is a time \eqn{\tau}, which is equal \eqn{t_0, 2t_0, 3t_0 \ldots nt_0}. Taking the instantaneous output of the inertial sensors (i.e. angular velocity) here denoted by \eqn{\Omega(t)}, the cluster average is:


\deqn{\bar{\Omega}_k(\tau)= 1/\tau \int_{t_k}^{t_{k+1}} \Omega(t)dt}

Where \eqn{\bar{\Omega}(t)} represents the cluster average value of the output rate for a cluster which starts from the \eqn{kth} data point and contains \eqn{n} data points depending on the length of \eqn{\tau}. The definition of the subsequent cluster average is as following, where \eqn{t_{k+1}= t_k + \tau}

\deqn{\bar{\Omega}_{k+1}(\tau)= 1/\tau \int_{t_{k+1}}^{t_{k+1}+\tau} \Omega(t)dt}

The interesting value for the Allan variance analysis is the difference for each of two adjacent clusters.

\deqn{\varepsilon_{k+1,k} = \bar{\Omega}_{k+1}(\tau) - \bar{\Omega}_k(\tau)}

For each cluster of time \eqn{\tau}, the ensemble of defined  of the previous formula forms a set of random variables. The important information is the variance of \eqn{\varepsilon_s} over all the clusters of the same size that can be formed from the entire data. Then the Alla Variance of the length \eqn{\tau}, is defined as

\deqn{ \theta^2(\tau)= 1/(2(N-2n)) \sum_{k=1}^{N-2n} [ \bar{\Omega}_{k+1}(t) - \bar{\Omega}_k(t)]^2}

Obviously, for any finite number of data points (\eqn{N}), a finite numbers of cluster of a fixed length (\eqn{\tau}) can be formed. Hence \eqn{\theta^2(\tau)} represents an estimation of the real variance. The quality of estimate depends on the number of independent clusters of a fixed length that can be formed. Defining the parameters as the percentage error in estimating the Allan standard deviation of the cluster due to the finiteness of the number of clusters gives

\deqn{\zeta_{AV} =  (\sigma(\tau,M) - \sigma(\tau))/(\sigma(\tau))}

where \eqn{\sigma(\tau,M)} denotes the estimate of the Allan standard deviation obtained from \eqn{M} independent clusters, \eqn{\sigma(\tau,M)} approaches its theoretical value \eqn{\sigma(\tau)} in the limit of \eqn{M} approaching infinity. A lengthy and straightforward calculation shows the percentage error, the formula has been used in the error of the estimation of the Allan Variance and it is equal to :

\deqn{\sigma(\zeta_{AV}) =  1/(\sqrt{2(N/n-1)})}

Where \eqn{N} is the total number of data points in the entire data set and \eqn{n} is the number of data points contained in the cluster. The equation shows that the error of the estimation is short when the length of the cluster is small as the number of independent cluster performed is large.

Characterization of stochastic errors requires identifying its PSD function. There is a unique relationship between the Allan variance (time-domain) and the PSD (frequency-domain) of the random process defined by

\deqn{\sigma^2(\tau) =  4 \int_{0}^{\infty}S_\Omega(f)(\sin^4(\pi f \tau))/((\pi f \tau)^2)df}

Where \eqn{S_\Omega(f)} is the two-side PSD of the random process.


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


%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
#Load data 
data(gyroz)

#Allan variance computation using avar
avgyroz <- avar(gyroz@.Data, frequency(gyroz))
plotav(avgyroz)
abline(1.0+log(avgyroz$time[1]), -1/2, col="green", lwd=4, lty=10)
abline(1.0+log(avgyroz$time[1]), 1/2, col="green", lwd=4, lty=10)
legend(0.11, 1e-03, c("Random Walk"))
legend(25, 1e-03, c("Rate Random Walk"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
