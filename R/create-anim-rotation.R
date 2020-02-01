
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Create a simple rotation animation
#'
#' @param duration time for full rotate (seconds). default: 16
#' @param cx,cy centre of rotation. default (0, 0)
#' @param repeatCount default: 'indefinite'
#' @param ... other arguments passed to \code{minisvg::stag$animateTransform()}
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
#' rot   <- create_anim_rotation(cx = 200, cy = 200)
#'
#' # Create a rectangle with the animation
#' rect  <- stag$rect(
#'   x      = "10%",
#'   y      = "10%",
#'   width  = "80%",
#'   height = "80%",
#'   fill   = "lightblue",
#'   stroke = 'black',
#'   rot
#' )
#'
#' # Add this rectangle to the document, show the SVG text, then render it
#' doc$append(rect)
#' doc$show()
#' }
#'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create_anim_rotation <- function(duration = 16, cx = 0, cy = 0,
                                 repeatCount = 'indefinite', ...) {

  animate_transform <- minisvg::stag$animateTransform(
    attributeName = 'transform',
    attributeType = 'xml',
    type          = 'rotate',
    from          = paste(  0, cx, cy),
    to            = paste(360, cx, cy),
    dur           = paste0(duration, 's'),
    repeatCount   = repeatCount,
    ...
  )

  animate_transform
}
