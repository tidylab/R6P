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
    expect_s3_class(uow <- DummyUnitOfWork$new(), "UnitOfWork")
    expect_s3_class(uow$enter(), "UnitOfWork")
    expect_s3_class(uow$commit(), "UnitOfWork")
    expect_s3_class(uow$rollback(), "UnitOfWork")
    expect_s3_class(uow$exit(), "UnitOfWork")
    expect_silent(rm(uow))
})
