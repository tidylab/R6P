# Setup -------------------------------------------------------------------
testthat::setup({
    assign("test_env", testthat::test_env(), envir = parent.frame())
})

# General -----------------------------------------------------------------
test_that("calling AbstractUnitOfWork $new fails because it cannot be instantiated directly", {
    attach(test_env)
    expect_error(AbstractUnitOfWork$new())
    expect_named(AbstractUnitOfWork$public_methods, c('initialize', 'enter', 'exit', 'commit', 'rollback'))
})

# Implementation ----------------------------------------------------------
# test_that("implementing AbstractRepository returns Repository", {
#     attach(test_env)
#     FakeRepository <- R6::R6Class(classname = "Repository", inherit = AbstractRepository, public = list(
#         initialize = function() private$cars <- collections::dict(),
#         add = function(key, value){private$cars$set(key, value); return(self)},
#         del = function(key){private$cars$remove(key); return(self)},
#         get = function(key){return(private$cars$get(key, default = NULL))}
#     ), private = list(cars = NULL))
#
#     expect_is(repository <- FakeRepository$new(), "Repository")
#     expect_is(repository$add(key = rownames(mtcars[1,]), value = mtcars[1,]), "Repository")
#     expect_identical(repository$get(key = rownames(mtcars[1,])), mtcars[1,])
#     expect_is(repository$del(key = rownames(mtcars[1,])), "Repository")
#     expect_null(repository$get(key = rownames(mtcars[1,])), "Repository")
# })
