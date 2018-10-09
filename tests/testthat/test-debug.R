context("debug")

options(importAs.debug = TRUE)
importAs(stats, s)
stats %importAs% s2

test_that("messaging", {
  expect_message(s::median(c(2, 3, 4, 5)), , "Namespace 'stats' can be referenced as 's'")
  expect_message(s2::median(c(2, 3, 4, 5)), , "Namespace 'stats' can be referenced as 's2'")
})
