.onLoad <- function(libname, pkgname) {
  op <- options()
  op.importAs <- list(
    importAs.debug = FALSE
  )
  toset <- !(names(op.importAs) %in% names(op))
  if (any(toset)) options(op.importAs[toset])

  invisible()
}
