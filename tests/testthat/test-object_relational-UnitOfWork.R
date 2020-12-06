# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling AbstractUnitOfWork $new fails because it cannot be instantiated directly", {
    attach(test_env)
    expect_error(AbstractUnitOfWork$new())
    expect_named(AbstractUnitOfWork$public_methods, c('initialize', 'finalize', 'enter', 'exit', 'commit', 'rollback'))
})

# Implementation ----------------------------------------------------------
test_that("implementing AbstractUnitOfWork returns UnitOfWork", {
    attach(test_env)
    FakeUnitOfWork <<- R6::R6Class(classname = "UnitOfWork", inherit = AbstractUnitOfWork, public = list(
        initialize = function() invisible(self),
        enter = function(){NULL; invisible(self)},
        commit = function(){NULL; invisible(self)},
        rollback = function(){NULL; invisible(self)}
    ))

    expect_is(uow <- FakeUnitOfWork$new(), "UnitOfWork")
    expect_is(uow$enter(), "UnitOfWork")
    expect_is(uow$commit(), "UnitOfWork")
    expect_is(uow$rollback(), "UnitOfWork")
    expect_is(uow$exit(), "UnitOfWork")
    expect_silent(rm(uow))
})
