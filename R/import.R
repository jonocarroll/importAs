#' Overwrite :: Operator
#'
#' @usage pkg::name
#'
#' @param pkg	package name: symbol or literal character string.
#' @param name variable name: symbol or literal character string.
#'
#' Works with symbols which point to strings represeting packages
#'
#' @export
#'
#' @examples
#' ## shorthand namespacing
#' d <- "dplyr"
#' d::select
#'
#' ## regular namespacing still works
#' dplyr::select
#' "dplyr"::select
`::` <- function (pkg, name) {
  charpkg <- as.character(substitute(pkg))
  ## if pkg refers to an installed package, that will be used
  installed <- tryCatch(isNamespace(asNamespace(charpkg)), error = function(e) e)
  pkgobj <- if (!inherits(installed, "error")) charpkg else pkg
  name <- as.character(substitute(name))
  getExportedValue(pkgobj, name)
}

#' Represent A Package With A Symbol
#'
#' @md
#' @param pkg (character) name of a (hopefully installed) package
#' @param as (character) symbol into which the package name should be assigned
#'
#' @return the symbol represented by `as` is assigned the character string `pkg`
#'
#' @export
#'
#' @description
#' This is merely a convenience function which signals to a reader that shorthand
#' (python-esque) namespacing is occurring. This is equivalent to
#'
#' `d <- "dplyr"`
#'
#' but demonstrates that this is to be explicitly used in a shorthand namespace
#' prefixing operation, such as `d::select()`
#'
#' @examples
#' importAs("dplyr", "d")
importAs <- function(pkg = NULL, as = NULL) {
  !is.null(pkg) || stop("\"pkg\" is required", call. = FALSE)
  !is.null(as) || stop("\"as\" is required", call. = FALSE)

  assign(as, pkg, envir = parent.frame())
}


