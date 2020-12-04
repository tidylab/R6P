#' @title Singleton Pattern
#' @description Ensure a class only has one instance, and provide a global point
#'   of access to it.
#' @references \href{Wikipedia}{https://en.wikipedia.org/wiki/Singleton_pattern}
#' @family creational design patterns
#' @export
Singleton <- R6::R6Class("Singleton", cloneable = FALSE, public = list(
    #' @description Create or retrieve an object
    initialize = function(){
        classname <- gsub("\\$new\\(.*\\)", "", deparse(sys.calls()[[sys.nframe()-1]]))
        if(classname == "Singleton") stop(paste(classname, "is an abstract base class and therefore cannot be instantiated directly"))
        if(is.null(private$public_bind_env)){
            classname <- gsub("\\$new\\(.*\\)", "", deparse(sys.calls()[[sys.nframe()-1]]))
            Class <- base::get(classname)

            private$public_bind_env <- base::get("public_bind_env", envir = parent.frame(1))
            private$private_bind_env <- base::get("private_bind_env", envir = parent.frame(1))

            Class$set('private', 'public_bind_env', private$public_bind_env, overwrite = TRUE)
            Class$set('private', 'private_bind_env', private$private_bind_env, overwrite = TRUE)

            } else {
            self <- private$instance
            assign("public_bind_env", private$public_bind_env, envir = parent.frame(1))
            assign("private_bind_env", private$private_bind_env, envir = parent.frame(1))
        }
    }
), private = list(
    public_bind_env = NULL,
    private_bind_env = NULL
))
