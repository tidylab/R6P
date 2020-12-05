# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling AbstractRepository$new fails because it cannot be instantiated directly", {
    attach(test_env)
    expect_error(AbstractRepository$new())
})

# Implementation ----------------------------------------------------------
# test_that("instantiating of multiple objects of the same Singleton are identical", {
#     attach(test_env)
#     Counter <<- R6::R6Class(classname = "Counter", inherit = Singleton, public = list(
#         count = 0,
#         add_1 = function(){self$count = self$count + 1; invisible(self)}
#     ))
#
#     expect_is(counter_1 <- Counter$new(), "Singleton")
#     expect_is(counter_2 <- Counter$new(), "Counter")
#     expect_identical(counter_1, counter_2)
#
#     counter_1$add_1()
#     expect_equal(counter_1$count, counter_2$count)
# })
#
# test_that("instantiating of multiple objects of the same Singleton with superclass", {
#     attach(test_env)
#     SuperCounter <<- R6::R6Class(classname = "SuperCounter", inherit = Singleton, public = list(
#         count = 0,
#         add_1 = function(){self$count = self$count + 1; invisible(self)},
#         initialize = function(){super$initialize()}
#     ))
#
#     expect_is(counter_1 <- SuperCounter$new(), "Singleton")
#     expect_is(counter_2 <- SuperCounter$new(), "SuperCounter")
#     expect_identical(counter_1, counter_2)
#
#     counter_1$add_1()
#     expect_equal(counter_1$count, counter_2$count)
# })
#
# test_that("instantiating of multiple objects of the different Singleton are not identical", {
#     attach(test_env)
#     SingletonA <<- R6::R6Class(classname = "SingletonA", inherit = Singleton, public = list(uid = "A"))
#     SingletonB <<- R6::R6Class(classname = "SingletonB", inherit = Singleton, public = list(uid = "B"))
#
#     expect_is(singleton_A <- SingletonA$new(), "Singleton")
#     expect_is(singleton_B <- SingletonB$new(), "Singleton")
#     expect_false(identical(singleton_A, singleton_B))
# })


