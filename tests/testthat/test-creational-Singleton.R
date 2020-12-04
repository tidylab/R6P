context("unit test for Singleton")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling Singleton$new instantiates identical objects", {
    attach(test_env)
    expect_is(singleton1 <- Singleton$new(), "Singleton")
    expect_is(singleton2 <- Singleton$new(), "Singleton")
    expect_equal(singleton1, singleton2)
})
