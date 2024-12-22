# utilities ---------------------------------------------------------------
`%+%` <- base::paste0
line_break <- function() paste0("\n", paste0(rep("#", 80), collapse = ""))
banner <- function(title) paste0(line_break(), paste0("\n## ", title), line_break(), "\n", collapse = "")


# testthat ----------------------------------------------------------------
expect_class <- function(object, class) testthat::expect(any(base::class(object) %in% class), "object is" %+% base::class(object) %+% "not" %+% class)
expect_has_columns <- function(data, cols) testthat::expect(all(cols %in% colnames(data)), "not all column names are in the data.frame")
expect_file_exists <- function(path) testthat::expect(file.exists(path), "File doesn't exist at " %+% path)
expect_match <- function(object, regexp) testthat::expect_match(stringr::str_flatten(object, collapse = "\n"), regexp)
expect_not_failure <- function(object, ...) {
  testthat::expect_type(object, type = "environment", ...)
}

# mocks -------------------------------------------------------------------
DummyRepository <- R6::R6Class(classname = "Repository", inherit = AbstractRepository, public = list(
  initialize = function() private$cars <- collections::dict(),
  add = function(key, value) {
    private$cars$set(key, value)
    return(self)
  },
  del = function(key) {
    private$cars$remove(key)
    return(self)
  },
  get = function(key) {
    return(private$cars$get(key, default = NULL))
  }
), private = list(cars = NULL))
