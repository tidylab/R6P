context("unit test for Singleton")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling Singleton$new fails because it cannot be instantiated directly", {
    expect_error(Singleton$new())
})


# Implementation ----------------------------------------------------------
test_that("instantiating of multiple objects of the same Singleton are identical", {
    attach(test_env)
    Counter <<- R6::R6Class(classname = "Counter", inherit = Singleton, public = list(
        count = 0,
        add_1 = function(){self$count = self$count + 1; invisible(self)}
    ))

    expect_is(counter_1 <- Counter$new(), "Singleton")
    expect_is(counter_2 <- Counter$new(), "Counter")
    expect_identical(counter_1, counter_2)

    counter_1$add_1()
    expect_equal(counter_1$count, counter_2$count)
})
