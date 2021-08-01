#' @title Singleton Pattern
#' @name Singleton
#' @includeRmd vignettes/details/Singleton.Rmd
#' @examples
#' # See more examples at <https://tidylab.github.io/R6P/articles>
#' address <- function(x) sub('<environment: (.*)>', '\\1', capture.output(x))
#'
#' # In this example we implement a `Counter` that inherits the qualities of
#' # Singleton
#' Counter <- R6::R6Class("Counter", inherit = R6P::Singleton, public = list(
#'     count = 0,
#'     add_1 = function(){self$count = self$count + 1; invisible(self)}
#' ))
#'
#' # Whenever we call the constructor on `Counter`, we always get the exact same
#' # instance:
#' counter_A <- Counter$new()
#' counter_B <- Counter$new()
#'
#' identical(counter_A, counter_B, ignore.environment = FALSE)
#'
#' # The two objects are equal and located at the same address; thus, they are
#' # the same object.
#'
#' # When we make a change in any of the class instances, the rest of the
#' # instances are changed as well.
#'
#' # How many times has the counter been increased?
#' counter_A$count
#'
#' # Increase the counter by 1
#' counter_A$add_1()
#'
#' # How many times have the counters been increased?
#' counter_A$count
#' counter_B$count
NULL

#' @rdname Singleton
#' @description Ensure a class only has one instance, and provide a global point
#'   of access to it.
#' @family base design patterns
#' @export
Singleton <- R6::R6Class("Singleton", cloneable = FALSE, public = list(
    #' @description Create or retrieve an object
    initialize = function(){
        classname <- get_classname()
        if(classname == "Singleton") stop(paste(classname, "is an abstract base class and therefore cannot be instantiated directly"))
        if(is.null(private$public_bind_env)){
            Class <- private$dynGet(classname)

            private$public_bind_env <- private$dynGet("public_bind_env")
            private$private_bind_env <- private$dynGet("private_bind_env")

            Class$set('private', 'public_bind_env', private$public_bind_env, overwrite = TRUE)
            Class$set('private', 'private_bind_env', private$private_bind_env, overwrite = TRUE)

            } else {
            self <- private$instance
            private$dynSet("public_bind_env", private$public_bind_env)
            private$dynSet("private_bind_env", private$private_bind_env)
        }
    }
), private = list(
    public_bind_env = NULL,
    private_bind_env = NULL,
    dynGet = dynGet,
    dynSet = dynSet
))

