\name{plotav}
\alias{plotav}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Allan Variance plot 
}
\description{
This function plot the Allan variance graph. That is the Allan deviation \eqn{\sigma(\tau)} against the cluster time \eqn{\tau}
}
\usage{
plotav(avdf)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{avdf}{
  \code{data.frame} with the results after calculating the Allan variance using \code{\link{avar}}, \code{\link{avarn}} or \code{\link{avari}}
}
}
\details{
\code{plotav} has been developed in order to plot the Allan variance estimation in an easy way but for sure other plot functions and stronger R graphics capabilities could also be used in order to visualize the slopes.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Allan variance plot: Log-Log plot of the standard deviation \eqn{\sigma(\tau)} against the cluster times.
}
\references{
IEEE Std 952-1997 \emph{IEEE Standard Specification Format Guide and Test Procedure for
Single Axis Interferometric Fiber Optic Gyros}.
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

#Allan variance computation using avar
avgyroz <- avar(gyroz@.Data, frequency(gyroz))
plotav(avgyroz)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
