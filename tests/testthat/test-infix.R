context("infix form usage")

options(importAs.debug = FALSE)

test_that("import -- infix", {
  expect_message(stats %importAs% s2, "Namespace 'stats' can be referenced as 's2'")
})

test_that("structural components -- infix", {
  expect_equal(c(s2), "stats")
  expect_equal(class(s2), c("importedNamespace", "character"))
  expect_equal(attr(s2, "symbol"), "s2")
})

test_that("messaging -- infix", {
  expect_message(print(s2), "Namespace 'stats' can be referenced as 's2'")
  # expect_equal(c(.rs.describeObject(objName = "s2", env = .GlobalEnv)$value), "Namespace shorthand for stats")
})

test_that("retrieval -- infix", {
  expect_equal(stats::median(c(2, 3, 4, 5)), s2::median(c(2, 3, 4, 5)))
  expect_equal("stats"::median(c(2, 3, 4, 5)), s2::median(c(2, 3, 4, 5)))
})

options(importAs.debug = FALSE)

