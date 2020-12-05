#' @title Singleton Pattern
#' @description Ensure a class only has one instance, and provide a global point
#'   of access to it.
#' @references \href{Wikipedia}{https://en.wikipedia.org/wiki/Singleton_pattern}
#' @family creational design patterns
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
#' @export
Singleton <- R6::R6Class("Singleton", cloneable = FALSE, public = list(
    #' @description Create or retrieve an object
    initialize = function(){
        classname <- get_classname()
        if(classname == "Singleton") stop(paste(classname, "is an abstract base class and therefore cannot be instantiated directly"))
        if(is.null(private$public_bind_env)){
            Class <- base::get(classname)

            private$public_bind_env <- base::dynGet("public_bind_env")
            private$private_bind_env <- base::dynGet("private_bind_env")

            Class$set('private', 'public_bind_env', private$public_bind_env, overwrite = TRUE)
            Class$set('private', 'private_bind_env', private$private_bind_env, overwrite = TRUE)

            } else {
            self <- private$instance
            dynSet("public_bind_env", private$public_bind_env)
            dynSet("private_bind_env", private$private_bind_env)
        }
    }
), private = list(
    public_bind_env = NULL,
    private_bind_env = NULL
))

