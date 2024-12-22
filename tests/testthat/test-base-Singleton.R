# General -----------------------------------------------------------------
test_that("calling Singleton$new fails because it cannot be instantiated directly", {
  expect_error(Singleton$new())
})

# Implementation ----------------------------------------------------------
test_that("instantiating of multiple objects of the same Singleton are identical", {
  Counter <- R6::R6Class(classname = "Counter", inherit = Singleton, public = list(
    count = 0,
    add_1 = function() {
      self$count <- self$count + 1
      invisible(self)
    }
  ))

  expect_s3_class(counter_1 <- Counter$new(), "Singleton")
  expect_s3_class(counter_2 <- Counter$new(), "Counter")
  expect_identical(counter_1, counter_2)

  counter_1$add_1()
  expect_equal(counter_1$count, counter_2$count)
})

test_that("instantiating of multiple objects of the same Singleton with superclass", {
  SuperCounter <- R6::R6Class(classname = "SuperCounter", inherit = Singleton, public = list(
    count = 0,
    add_1 = function() {
      self$count <- self$count + 1
      invisible(self)
    },
    initialize = function() {
      super$initialize()
    }
  ))

  expect_s3_class(counter_1 <- SuperCounter$new(), "Singleton")
  expect_s3_class(counter_2 <- SuperCounter$new(), "SuperCounter")
  expect_identical(counter_1, counter_2)

  counter_1$add_1()
  expect_equal(counter_1$count, counter_2$count)
})

test_that("instantiating of multiple objects of the different Singleton are not identical", {
  SingletonA <- R6::R6Class(classname = "SingletonA", inherit = Singleton, public = list(uid = "A"))
  SingletonB <- R6::R6Class(classname = "SingletonB", inherit = Singleton, public = list(uid = "B"))

  expect_s3_class(singleton_A <- SingletonA$new(), "Singleton")
  expect_s3_class(singleton_B <- SingletonB$new(), "Singleton")
  expect_false(identical(singleton_A, singleton_B))
})

# test_that("inheriting Singleton takes the last class name", {
#     Level1Class <- R6::R6Class(classname = "Level1", inherit = Singleton, public = list(uid = "A"))
#     expect_s3_class(level1 <- Level1Class$new(), "Level1")
#
#     Level2Class <- R6::R6Class(classname = "Level2", inherit = Level1Class, public = list(uid = "A"))
#     expect_s3_class(level2 <- Level2Class$new(), "Level2")
#
#     expect_false(identical(level1, level2))
# })
