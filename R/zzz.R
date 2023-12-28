#' Title
#'
#'
#' @export
#'
#' @import jl4R
#'
#' @examples .onLoad()
#'

.onLoad <- function(libname, pkgname) {
  jl4R::jlusing(JuliaPredict,CSV, Downloads, DataFrames)
}
