% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rcensT3.R
\name{rcensT3}
\alias{rcensT3}
\title{Generate Censoring Sample,Type III (Random)}
\usage{
rcensT3(
  rdistrX,
  pdistrC,
  rdistrC,
  param_X,
  param_C,
  n = 10000,
  theta = 0.5,
  n_mc = 10000,
  lambda_tol = c(1e-06, 10000),
  verbose = FALSE,
  right = TRUE
)
}
\arguments{
\item{rdistrX}{sample generator of distribution X. \cr
First argument number of samples, next arguments in param_X.}

\item{pdistrC}{function distribution of C. First argument probabilities, next arguments in param_C.}

\item{rdistrC}{sample generator of distribution C. \cr First argument number of samples, next arguments in param_C.}

\item{param_X}{list with parameters of rdistrX function.}

\item{param_C}{list with parameters of rdistrC function, one of these parameters \cr should be "lambda",
this wil be the searched parameter.}

\item{n}{number of sample to create.}

\item{theta}{Desired censoring percentage}

\item{n_mc}{number of sample use in Monte Carlo integration, greater n_mc more accuracy.}

\item{lambda_tol}{lowest and uppest value where live the search parameter lambda.}

\item{verbose}{if TRUE print a censoring percentage of new created database.}

\item{right}{if TRUE create right-censored data, else create left-censored}
}
\value{
A list with sample data information: \tabular{ll}{
   \code{lambda}\tab searched censoring distribution parameter.\cr
   \code{sample_censored} \tab vector of censored sample. \cr
   \tab \cr
   \code{sample_uncensored} \tab vector of uncensored sample (original). \cr
   \tab \cr
   \code{censored_indicator} \tab vector of 1 and 0 indicating whether the i-th sample is censored.  \cr
     \tab 1:= no censored, 0:= censored \cr
   \code{censored_time} \tab vector of censorship time. \cr
   \code{n_censored} \tab number of censored samples.  \cr
}
}
\description{
Generator of censored samples type III with right or left censoring,
 given a generator of samples of the distribution X (rdistrX) with
 parameters appended by the list param_X. Also accumulate function of distribution and generator sample
 of distribution C (censoring) with parameters appended by the list param_C
 In which, you can control the desired censorship percentage.
}
\examples{

#Example Exponential - Uniform


Data_T3 = rcensT3(rdistrX = rexp, pdistrC = punif, rdistrC = runif,
              param_X = list("rate" = 2),
             param_C = list("min" = 0, "max" = "lambda"),
            n = 1e02, theta = .9, right = TRUE)


Data_T3 = rcensT3(rdistrX = rexp, pdistrC = punif, rdistrC = runif,
                 param_X = list("rate" = 2),
                 param_C = list("min" = 0, "max" = "lambda"),
                 n = 1e02, theta = .1, right = FALSE)


## Example with plot in examples_plot/Example_rcensT3_plot.R

}
\seealso{
\code{\link{rcensT1}} for generate censorship sample type I.\cr
\code{\link{rcensT2}} for generate censorship sample type II \cr
\code{\link{rcensI}} for generate interval censoring sample
 with random length interval\cr
\code{\link{rcensIfix}} for generate interval censoring sample
 with fix length interval
}
\author{
Daniel Saavedra Morales
}
