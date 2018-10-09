context("shared")

importAs(stats, s)
stats %importAs% s2

test_that("equivalence", {
  expect_equal(c(s), c(s2))
  expect_equal(class(s), class(s2))
})

test_that("precedence", {
  expect_warning(importAs(base, stats), regexp = "base is itself a valid namespace and takes precedence.")
  expect_true(length(ls(pattern = "stats")) == 0L)
})

