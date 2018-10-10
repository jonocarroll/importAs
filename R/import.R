#' @export
print.importedNamespace <- function(x, ...) {
  message("Namespace '", c(x), "' can be referenced as '", attr(x, "symbol"), "'")
  print(c(x))
  return(invisible(NULL))
}

#' Overwrite :: Operator
#'
#' @md
#' @usage pkg::name
#'
#' @param pkg	package name: symbol or literal character string.
#' @param name variable name: symbol or literal character string.
#'
#' Works with symbols which point to strings representing packages
#'
#' @section Debugging:
#'
#' To turn on debug mode, in which a message is printed whenever
#' shorthand namespacing is in effect, set the option
#' `options(importAs.debug = TRUE)`
#'
#' @export
#'
#' @examples
#' ## shorthand namespacing
#' # d <- "dplyr"
#' # d::select
#'
#' ## regular namespacing still works
#' # dplyr::select
#' #"dplyr"::select
`::` <- function (pkg, name) {
  charpkg <- as.character(substitute(pkg))
  name <- as.character(substitute(name))
  ## if pkg refers to an installed package, that will be used
  installed <- tryCatch(isNamespace(asNamespace(charpkg)), error = function(e) e)
  pkgobj <- if (!inherits(installed, "error")) charpkg else pkg
  if (!identical(pkgobj, charpkg) && (getOption("importAs.debug") %||% FALSE)) {
    message("DEBUG: ", substitute(name), " retrieved from namespace: ", pkgobj)
  }
  getExportedValue(pkgobj, name)
}

#' Represent A Package With A Symbol
#'
#' @md
#' @param pkg (character or symbol) name of a (hopefully installed) package
#' @param as (character or symbol) symbol into which the package name should be assigned
#'
#' @return the symbol represented by `as` is assigned the character string `pkg`
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
#' @section Debugging:
#'
#' To turn on debug mode, in which a message is printed whenever
#' shorthand namespacing is in effect, set the option
#' `options(importAs.debug = TRUE)`
#'
#' @export
#'
#' @examples
#' importAs("dplyr", "d")
importAs <- function(pkg = NULL, as = NULL) {
  !is.null(substitute(pkg)) || stop("\"pkg\" is required", call. = FALSE)
  !is.null(substitute(as)) || stop("\"as\" is required", call. = FALSE)

  .importAs(substitute(pkg), substitute(as))
  return(invisible(NULL))

}

#' @rdname importAs
#' @export
#' @examples
#' dplyr %importAs% d
`%importAs%` <- function(pkg, as) {
  .importAs(substitute(pkg), substitute(as))
  return(invisible(NULL))
}

#' @keywords internal
#' @noRd
.importAs <- function(pkg, as) {
  ## if name already refers to an installed package, that will have precedence
  already_installed <- tryCatch(isNamespace(asNamespace(as)), error = function(e) e)
  if (!inherits(already_installed, "error")) {
    warning(pkg, " is itself a valid namespace and takes precedence.", call. = FALSE)
    return(invisible(NULL))
  }
  message("Namespace '", as.character(pkg), "' can be referenced as '", as.character(as), "'")
  assign(as.character(as),
         structure(as.character(pkg),
                   class = c("importedNamespace", "character"),
                   symbol = as.character(as)),
         envir = .GlobalEnv)
  return(invisible(NULL))
}
