context("functional form usage")

options(importAs.debug = FALSE)

test_that("import -- functional", {
  expect_message(importAs(stats, s), "Namespace 'stats' can be referenced as 's'")
})

test_that("structural components -- functional", {
  expect_equal(c(s), "stats")
  expect_equal(class(s), c("importedNamespace", "character"))
  expect_equal(attr(s, "symbol"), "s")
})

test_that("messaging -- functional", {
  expect_message(print(s), "Namespace 'stats' can be referenced as 's'")
  # expect_equal(c(.rs.describeObject(objName = "s", env = .GlobalEnv)$value), "Namespace shorthand for stats")
})

test_that("retrieval -- functional", {
  expect_equal(stats::median(c(2, 3, 4, 5)), s::median(c(2, 3, 4, 5)))
  expect_equal("stats"::median(c(2, 3, 4, 5)), s::median(c(2, 3, 4, 5)))
})
