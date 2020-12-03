context("unit test for Singleton")

# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling Singleton$new instantiates an object", {
    attach(test_env)
    expect_is(obj <- Singleton$new(), "Singleton")
    test_env$obj <- obj
})
