#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Create a simple pulsing animation in which the width of the line varies
#'
#' @param duration time for full cycle (seconds). default: 4
#' @param size1,size2 the minimum and maximum size of the strokes
#' @param repeatCount default: 'indefinite'
#' @param ... other arguments passed to \code{minisvg::stag$animate()}
#'
#' @return minisvg SVGElement
#'
#' @import minisvg
#' @export
#'
#' @examples
#' \dontrun{
#' # Create an SVG document
#' library(minisvg)
#' doc   <- minisvg::svg_doc()
#'
#' # Create the animation
#' pulse <- create_anim_pulse_line(size2 = 50)
#'
#' # Create a rectangle with the animation
#' rect  <- stag$rect(
#'   x      = "10%",
#'   y      = "10%",
#'   width  = "80%",
#'   height = "80%",
#'   fill   = "lightblue",
#'   stroke = 'black',
#'   pulse
#' )
#'
#' # Add this rectangle to the document, show the SVG text, then render it
#' doc$append(rect)
#' doc
#' doc$show()
#' }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create_anim_pulse_line <- function(size1 = 0, size2 = 10,
                                   duration = 4,
                                   repeatCount = 'indefinite', ...) {

  throb_transform <- minisvg::stag$animate(
    attributeName = 'stroke-width',
    attributeType = 'XML',
    values        = c(size1, size2, size1),
    keyTimes      = c(0, 0.5, 1),
    dur           = paste0(duration, 's'),
    repeatCount   = repeatCount,
    ...
  )

  throb_transform
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Interactive testing
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if (FALSE) {
  library(minisvg)
  doc   <- minisvg::svg_doc()
  pulse <- create_anim_pulse_line(size2 = 50)
  rect  <- stag$rect(
    x      = "10%",
    y      = "10%",
    width  = "80%",
    height = "80%",
    fill   = "blue",
    stroke = 'black',
    pulse
  )
  doc$append(rect)
  doc$show()
}
