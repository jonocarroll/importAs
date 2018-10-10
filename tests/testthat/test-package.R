context("package")

test_that("package option is set on package load", {
  expect_equal(getOption("importAs.debug"), FALSE)
})

unloadNamespace("importAs")
options(importAs.debug = TRUE)

test_that("resetting package option after unload", {
  expect_equal(getOption("importAs.debug"), TRUE)
})

loadNamespace("importAs")

test_that("option remains set after reloading package", {
  expect_equal(getOption("importAs.debug"), TRUE)
})
