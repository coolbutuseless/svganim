#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Create an animation for the rendering of a stroke around an object.
#'
#' This animation will only show if the object it applies to (a) has a visible
#' stroke, and (b) has the \code{stroke-dasharray} attribute set.
#'
#' @param duration time for full cycle (seconds). default: 4
#' @param offset The length of the offset motion. this will need to be adjusted
#'        depending on the overall stroke length. default: 2000
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
#' stroke_render <- create_anim_stroke_render()
#'
#' # Create a rectangle with the animation
#' rect  <- stag$rect(
#'   x      = "10%",
#'   y      = "10%",
#'   width  = "80%",
#'   height = "80%",
#'   fill   = "lightblue",
#'   stroke = 'black',
#'   stroke_width = 5,
#'   stroke_dasharray = 2000,
#'   stroke_render
#' )
#'
#' # Add this rectangle to the document, show the SVG text, then render it
#' doc$append(rect)
#' doc
#' doc$show()
#' }
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create_anim_stroke_render <- function(offset = 2000, duration = 4,
                                      repeatCount = 'indefinite', ...) {

  stroke_render <- minisvg::stag$animate(
    attributeName = 'stroke-dashoffset',
    attributeType = 'XML',
    values        = c(2000, 0),
    keyTimes      = c(0, 1),
    dur           = paste0(duration, 's'),
    repeatCount   = repeatCount,
    ...
  )

  stroke_render
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Interactive testing
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if (FALSE) {
  library(minisvg)
  doc   <- minisvg::svg_doc()
  pulse <- create_anim_stroke_render()
  rect  <- stag$rect(
    x      = "10%",
    y      = "10%",
    width  = "80%",
    height = "80%",
    fill   = "lightblue",
    stroke = 'black',
    stroke_width = 5,
    stroke_dasharray = 2000,
    pulse
  )
  doc$append(rect)
  doc$show()
}
