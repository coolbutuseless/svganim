% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create-anim-motion.R
\name{create_anim_motion}
\alias{create_anim_motion}
\title{Create simple animation of motion-along-a-path}
\usage{
create_anim_motion(duration = 4, xs, ys, repeatCount = "indefinite", ...)
}
\arguments{
\item{duration}{time for full motion (seconds). default: 4}

\item{xs, ys}{numeric vectors of x and y points on the path}

\item{repeatCount}{default: 'indefinite'}

\item{...}{other arguments passed to \code{minisvg::stag$animateMotion()}}
}
\value{
minisvg SVGElement
}
\description{
Create simple animation of motion-along-a-path
}
\examples{
\dontrun{
# Create an SVG document
library(minisvg)
doc    <- minisvg::svg_doc()

# Create the animation
motion <- create_anim_motion(
  xs = c(20, 20, 80, 80),
  ys=c(20, 80, 80, 20)
)

# Create a rectangle with the animation
rect   <- stag$rect(
  x      = "10\%",
  y      = "10\%",
  width  = "30\%",
  height = "30\%",
  fill   = "lightblue",
  stroke = 'black',
  motion
)

# Add this rectangle to the document, show the SVG text, then render it
doc$append(rect)
doc$show()
}

}
