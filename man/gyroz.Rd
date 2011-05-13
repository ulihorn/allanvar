\name{gyroz}
\alias{gyroz}
\docType{data}
\title{Gyro sensor output for one-axis simulated gyroscope}
\description{
  This dataset is an object of class "ts" (time series) with sensor output at a specifid
  frequency.
}
\usage{data(gyroz)}
\source{
  Simulated gyro using R software. It is not from a real sensor but it has a clear Random Walk and 
  Rate Random Walk with a small dataset.
}
\examples{
data(gyroz)
frequency(gyroz)
plot(gyroz)
}
\keyword{datasets}
