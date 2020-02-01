
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Convert a set of x,y coordinates to
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
coords_to_svg_path_string <- function(xs, ys) {
  if (length(xs) == 0 || length(ys) == 0) {
    return(NULL)
  }
  xs = round(xs, 4)
  ys = round(ys, 4)
  paste("M", paste(xs, ys, collapse = " L ", sep=" "), "Z")
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Create simple animation of motion-along-a-path
#'
#' @param duration time for full motion (seconds). default: 4
#' @param xs,ys numeric vectors of x and y points on the path
#' @param repeatCount default: 'indefinite'
#' @param ... other arguments passed to \code{minisvg::stag$animateMotion()}
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
#' doc    <- minisvg::svg_doc()
#'
#' # Create the animation
#' motion <- create_anim_motion(
#'   xs = c(20, 20, 80, 80),
#'   ys=c(20, 80, 80, 20)
#' )
#'
#' # Create a rectangle with the animation
#' rect   <- stag$rect(
#'   x      = "10%",
#'   y      = "10%",
#'   width  = "30%",
#'   height = "30%",
#'   fill   = "lightblue",
#'   stroke = 'black',
#'   motion
#' )
#'
#' # Add this rectangle to the document, show the SVG text, then render it
#' doc$append(rect)
#' doc$show()
#' }
#'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
create_anim_motion <- function(duration = 4, xs, ys,
                               repeatCount = 'indefinite', ...) {

  animate_transform <- minisvg::stag$animateMotion(
    dur           = paste0(duration, 's'),
    repeatCount   = repeatCount,
    path          = coords_to_svg_path_string(xs, ys),
    ...
  )

  animate_transform
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Interactive testing
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if (FALSE) {
  library(minisvg)
  doc    <- minisvg::svg_doc()
  motion <- create_anim_motion(
    xs = c(20, 20, 80, 80),
    ys=c(20, 80, 80, 20)
  )
  rect   <- stag$rect(
    x      = "10%",
    y      = "10%",
    width  = "30%",
    height = "30%",
    fill   = "blue",
    stroke = 'black',
    motion
  )
  doc$append(rect)
  doc$show()
}
