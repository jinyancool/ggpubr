% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggdotplot.R
\name{ggdotplot}
\alias{ggdotplot}
\title{Dot plot}
\usage{
ggdotplot(data, x, y, color = "black", fill = "lightgray", palette = NULL,
  size = 1, select = NULL, order = NULL, add = "mean_se",
  add.params = list(), error.plot = "pointrange", ggtheme = theme_pubr(),
  ...)
}
\arguments{
\item{data}{a data frame}

\item{x, y}{x and y variables for drawing.}

\item{color, fill}{outline and fill colors.}

\item{palette}{the color palette to be used for coloring or filling by
groups. Allowed values include "grey" for grey color palettes; brewer
palettes e.g. "RdBu", "Blues", ...; or custom color palette e.g. c("blue",
"red"); and scientific journal palettes from ggsci R package, e.g.: "npg", "aaas", "lancet", "jco",
"ucscgb", "uchicago", "simpsons" and "rickandmorty".}

\item{size}{change the size of points and outlines.}

\item{select}{character vector specifying which items to display.}

\item{order}{character vector specifying the order of items.}

\item{add}{character vector for adding another plot element (e.g.: dot plot
or error bars). Allowed values are one or the combination of: "none",
"dotplot", "jitter", "boxplot", "mean", "mean_se", "mean_sd", "mean_ci",
"mean_range", "median", "median_iqr", "median_mad", "median_range"; see
?desc_statby for more details.}

\item{add.params}{parameters (color, shape, size, fill, linetype) for the
argument 'add'; e.g.: add.params = list(color = "red").}

\item{error.plot}{plot type used to visualize error. Allowed values are one
of c("pointrange", "linerange", "crossbar", "errorbar", "upper_errorbar",
"lower_errorbar", "upper_pointrange", "lower_pointrange",
"upper_linerange", "lower_linerange"). Default value is "pointrange" or "errorbar". Used
only when add != "none" and add contains one "mean_*" or "med_*" where "*"
= sd, se, ....}

\item{ggtheme}{function, ggplot2 theme name. Default value is theme_pubr().
Allowed values include ggplot2 official themes: theme_gray(), theme_bw(),
theme_minimal(), theme_classic(), theme_void(), ....}

\item{...}{other arguments to be passed to geom_dotplot.}
}
\description{
Create a dot plot.
}
\details{
The plot can be easily customized using the function ggpar(). Read
  ?ggpar for changing: \itemize{ \item main title and axis labels: main,
  xlab, ylab \item axis limits: xlim, ylim (e.g.: ylim = c(0, 30)) \item axis
  scales: xscale, yscale (e.g.: yscale = "log2") \item color palettes:
  palette = "Dark2" or palette = c("gray", "blue", "red") \item legend title,
  labels and position: legend = "right" \item plot orientation : orientation
  = c("vertical", "horizontal", "reverse") }
}
\examples{
# Load data
data("ToothGrowth")
df <- ToothGrowth

# Basic plot with summary statistics : mean_sd
# +++++++++++++++++++++++++++
ggdotplot(df, x = "dose", y = "len",
   add = "mean_sd")

# Change error.plot to "crossbar"
ggdotplot(df, x = "dose", y = "len",
 add = "mean_sd", add.params = list(width = 0.5),
 error.plot = "crossbar")


# Add box plot
ggdotplot(df, x = "dose", y = "len",
 add = "boxplot")

# Add violin + mean_sd
ggdotplot(df, x = "dose", y = "len",
 add = c("violin", "mean_sd"))


# Change colors
# +++++++++++++++++++++++++++
# Change fill and outline colors by groups: dose
# Use custom color palette
 ggdotplot(df, "dose", "len",
     add = "boxplot",
      color = "dose", fill = "dose",
      palette = c("#00AFBB", "#E7B800", "#FC4E07"))


# Plot with multiple groups
# +++++++++++++++++++++
# Change color by a second group : "supp"
ggdotplot(df, "dose", "len", fill = "supp", color = "supp",
    palette = c("#00AFBB", "#E7B800"))


}
\seealso{
\code{\link{ggpar}}
}

