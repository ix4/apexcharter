% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apex-utils.R
\name{ax_plotOptions}
\alias{ax_plotOptions}
\title{Specific options for chart}
\usage{
ax_plotOptions(
  ax,
  bar = NULL,
  heatmap = NULL,
  radialBar = NULL,
  pie = NULL,
  bubble = NULL,
  ...
)
}
\arguments{
\item{ax}{A \code{apexcharts} \code{htmlwidget} object.}

\item{bar}{See \code{\link{bar_opts}}.}

\item{heatmap}{See \code{\link{heatmap_opts}}.}

\item{radialBar}{See \code{\link{radialBar_opts}}.}

\item{pie}{See \code{\link{pie_opts}}.}

\item{bubble}{See \code{\link{bubble_opts}}.}

\item{...}{Additional parameters.}
}
\value{
A \code{apexcharts} \code{htmlwidget} object.
}
\description{
Specific options for chart
}
\examples{
data("diamonds", package = "ggplot2")

# Stack bar type
apex(
  data = diamonds,
  mapping = aes(x = cut)
) \%>\%
  ax_plotOptions(
    bar = bar_opts(endingShape = "rounded", columnWidth = "10\%")
  )

# Pie
apex(
  data = diamonds,
  mapping = aes(x = cut), 
  type = "pie"
) \%>\%
  ax_plotOptions(
    pie = pie_opts(customScale = 0.5)
  )


# Radial
apexchart() \%>\% 
  ax_chart(type = "radialBar") \%>\% 
  ax_plotOptions(
    radialBar = radialBar_opts(
      hollow = list(size = "70\%")
    )
  ) \%>\% 
  ax_series(70) \%>\% 
  ax_labels("Indicator")
}
