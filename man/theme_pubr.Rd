% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_pubr.R
\name{theme_pubr}
\alias{labs_pubr}
\alias{theme_pubr}
\title{Publication ready theme}
\usage{
theme_pubr(base_size = 14, base_family = "")

labs_pubr(base_size = 14, base_family = "")
}
\arguments{
\item{base_size}{base font size}

\item{base_family}{base font family}
}
\description{
\itemize{
 \item \strong{theme_pubr()}: Create a publication ready theme
 \item \strong{labs_pubr()}: Format only plot labels to a publication ready style
}
}
\examples{
p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
   geom_point(aes(color = gear))

# Default plot
p

# Use theme_pubr()
p + theme_pubr()

# Format labels
p + labs_pubr()

}

