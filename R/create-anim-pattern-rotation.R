


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Create a simple rotation animation for an SVG pattern
#'
#' This animation targets the \code{patternTransform} attribute, and thus onlyl
#' applies to patterns.
#'
#' If you want to animate the rotation of an arbitrary SVG object, see
#' \link{create_anim_rotation}.
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
#' # Create the animation
#' anim1 <- create_anim_pattern_rotation(id = 'hello')
#'
#' # Create a pattern and append the animation to the pattern
#' pat   <- svgpatternsimple::create_pattern_stripe(id = 'stripe')
#' pat$append(anim1)
#'
#' # Create an SVG document with a rectangle, add the pattern to the
#' # document definitions, and use the pattern in the rectangle
#' doc <- minisvg::svg_doc()
#' doc$defs(pat)
#' doc$rect(x=0, y=0, width='100%', height='100%', fill=pat)
#'
#' # view the code and render the SVG
#' doc
#' doc$show()
#' }
#'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create_anim_pattern_rotation <- function(duration = 16, cx = 0, cy = 0,
                                         repeatCount = 'indefinite', ...) {

  animate_transform <- minisvg::stag$animateTransform(
    attributeName = 'patternTransform',
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



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Interactive testing
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if (FALSE) {
  library(svgpatternsimple)
  anim1 <- create_anim_pattern_rotation(cx = 0, cy = 0)
  pat   <- svgpatternsimple::create_pattern_stripe(id = 'stripe')
  pat$append(anim1)
  pat
  pat$show()
}
