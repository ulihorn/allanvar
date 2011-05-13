\name{allanvar-package}
\alias{allanvar-package}
\alias{allanvar}
\docType{package}
\title{
Allan Variance Package
}
\description{
Set of function to compute the Allan Variance of sensor output in order to perform sensor characterization of the most dominant stochastic errors underlying the signal.
}
\details{
\tabular{ll}{
Package: \tab allanvar\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-05-13\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
The Allan Variance method was developed by David Allan in 1966. Allan proposed a simple variance analysis method for the study of oscillator stability (Allan 1966). After that this method has been adopted by the inertial sensor community for the simplicity of the technique in comparatively to others techniques like the power spectral density in the frequency domain or the autocorrelation function. The Allan variance can provide directly information on the types and magnitude of various noise terms. Since the analogies to inertial sensors, this method has been adapted to random drift characterization of inertial sensors.In the 80's was publishes the first paper related to the use if the Allan variance with inertial sensors (Kochakian 1980). In 1983 Tehrani gave out the detailed deviation about the Allan variance noise terms expression from their rate noise power spectral density for the ring laser gyro (Tehrani 1983). In 2003, the Allan variance method was first applied in Micro Electrical Mechanical Sensor (MEMS) noise identification (Haiying and El-Sheimy 2003)  (El-Sheimy et. al. 2008) and is presented as a standard recommendation for IEEE (Institute of Electrical and Electronics Engineers, Inc.) since 1997 (IEEE Std 952-1997).

Following the Annex C in the IEEE recommendation (IEEE Std 952-1997), a number of specific noise terms can be identified using the Allan variance. Those noise terms are known to exist in inertial sensors. In this package the Allan Variance technique is developed in R in order to easilly identified the dominant stochastic noise processes. Since the Allan variance technique is a graphic method based on ploting the Allan standard deviation against the cluster time a plot utility is also available in this package.

To summarize, \code{Alla Variance Packages} provides with a set of functions to compute the Allan variance. The identification of the noise terms in the Allan variance is performed in a \eqn{log-log} graph of the Allan deviation against the cluster time \eqn{\tau}. Then, the package provides with a function \code{\link{plotav}} to visualize the results in a \eqn{log-log} graph. Afterwards, simple analyses are needed to calculate the noise coefficients. The reader can find abundant information in the literature concerning noise characterization using the Allan variance technique.
}
\author{
Javier Hidalgo Carrio
\email{javier.hidalgo_carrio@dfki.de}
}
\references{
Allan, D. W. (1966)
\emph{Statistics of Atomic Frequency Standards} Proceedings of IEEE, vol. 54, no. 2, pp. 221-230, Feb, 1966.

Allan, D.W. (1987)
\emph{Time and Frequency (Time-Domain) Characterization, Estimation,
and Prediction of Precision Clocks and Oscillators} IEEE Transportations on
Ultrasonics, Ferroelectrics, and Frequency Control, Vol. UFFC -34, no.6, pp.647-
654.

Haiying, Hou. and El-Sheimy, N. (2003)
\emph{Inertial Sensors Errors Modelling Using Allan
Variance} Best Presentation Winning Paper, The US Institute of Navigation, ION
GPS/GNSS 2003 Proceedings, pp. 2860-2867, Sep 9-12, Portland.

Hidalgo Carrio, J. (2010) \emph{Characterization and Modeling of Inertial Sensors for Rover Attitude Estimation} Escuela Tecnica Superior de Ingenieros Industriales, Jose Gutierrez Abascal, 2. 28006, Madrid (Spain), Nov/2010. Publisher: Automation and Robotics Section of the European Space Research and Technology Center (ESTEC) and Universidad Politecnica de Madrid.

El-Sheimy, N.; Haiying Hou.; Xiaoji, Niu (2008)
\emph{Analysis and Modeling of Inertial Sensors Using Allan Variance} IEEE Transaction on Instrumentation and Measurement.

IEEE Std 952-1997 \emph{IEEE Standard Specification Format Guide and Test Procedure for
Single Axis Interferometric Fiber Optic Gyros}.

Kochakian, C.R. (1980)
\emph{Time-Domain Uncertainty Charts (Green Charts): A Tool for
Validating the Design of IMU/Instrument Interfaces} Proceedings of the AIAA
Guidance and Control Conference, Aug. 11-13, 1980.

Papoulis, A and Unnikrisha,S (2002)
\emph{Probability, Random Variables and Stochastic Processes} Fourth Edition. McGraw-Hill Series in Electrical and Computer Engineering.

Tehrani, M. M. (1983) \emph{Ring Laser Gyro Data Analysis with Cluster Sampling
Technique} Proceedings of SPIE, vol. 412}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
\keyword{ package }

\examples{
#This example is also available under
#the command: demo(allanvar)

#Loading values
data(gyroz)

#Allan variance computation using avar
avgyroz <- avar(gyroz@.Data, frequency(gyroz))

#Allan variance computation using avarn
avngyroz <- avarn(gyroz@.Data, frequency(gyroz))

#Allan variance computation using avari
#Simple integration of the angular velocity
igyroz <- cumsum(gyroz@.Data * (1/frequency(gyroz)))
igyroz <- ts (igyroz, start=c(igyroz[1]), delta=(1/frequency(gyroz)))
avigyroz <- avari(igyroz@.Data, frequency(igyroz))

#Ploting all
plot (avgyroz$time,sqrt(avgyroz$av),log= "xy", xaxt="n" , yaxt="n", type="l", col="blue", xlab="", ylab="")
lines (avngyroz$time,sqrt(avngyroz$av), col="green", lwd=1)
lines (avigyroz$time,sqrt(avigyroz$av), col="red")
axis(1, c(0.001, 0.01, 0.1, 0, 1, 10, 100, 1000, 10000, 100000))
axis(2, c(0.00001, 0.0001, 0.001, 0.01, 0.1, 0, 1, 10, 100, 1000, 10000))
grid(equilogs=TRUE, lwd=1, col="orange")
title(main = "Allan variance Analysis Comparison", xlab = "Cluster Times (Sec)", ylab = "Allan Standard Deviation (rad/s)")

legend(10, 4e-03, c("GyroZ (avar)", "GyroZ(avarn)", "GyroZ(avari)"),  fill = c("blue", "green", "red"))

}
