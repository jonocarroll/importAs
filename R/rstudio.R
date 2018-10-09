#' Show Clean Description in RStudio
#' @export
#' @noRd
.rs.describeObject <- function(env, objName) {
  existing <- get(".rs.describeObject",
                  envir = as.environment('tools:rstudio'))(objName = objName,
                                                           env = env)
  if (inherits(get(objName), "importedNamespace")) {
    savedattr <- attr(existing$value, "class")
    existing$value <- paste0("Namespace shorthand for ", c(get(objName)))
    attr(existing$value, "class") <- savedattr
  }
  existing
}
