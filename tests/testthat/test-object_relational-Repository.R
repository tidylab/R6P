# General -----------------------------------------------------------------
test_that("calling AbstractRepository$new fails because it cannot be instantiated directly", {
  expect_error(AbstractRepository$new())
  expect_named(AbstractRepository$public_methods, c("initialize", "add", "del", "get"))
})

# Implementation ----------------------------------------------------------
test_that("implementing AbstractRepository returns Repository", {
  expect_s3_class(repository <- DummyRepository$new(), "Repository")
  expect_s3_class(repository$add(key = rownames(mtcars[1, ]), value = mtcars[1, ]), "Repository")
  expect_identical(repository$get(key = rownames(mtcars[1, ])), mtcars[1, ])
  expect_s3_class(repository$del(key = rownames(mtcars[1, ])), "Repository")
  expect_null(repository$get(key = rownames(mtcars[1, ])), "Repository")
})
