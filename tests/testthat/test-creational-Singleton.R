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

#' @examples
#' # Example: A Counter Implementation
#' Counter <- R6::R6Class(inherit = Singleton, public = list(
#'     count = 0,
#'     add_1 = function(){self$count = self$count + 1; invisible(self)}
#' ))
#'
#' counter <- Counter$new()
#' counter$count
#' counter$add_1()$count
#' counter$add_1()$count
#'
#' retrieved_conter <- Counter$new()
#' retrieved_conter$count
#'
#' rm(retrieved_conter)
