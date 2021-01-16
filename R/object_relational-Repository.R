#' @title Repository Pattern
#' @name Repository
#' @includeRmd vignettes/details/Repository.Rmd
#' @examples
#' # See more examples at <https://tidylab.github.io/R6P/articles>
#'
#' # The following implementation is a Repository of car models with their
#' # specifications.
#'
#' # First, we define the class constructor, initialize, to establish a
#' # transient data storage.
#'
#' # In this case we use a dictionary from the collections package
#' # <https://randy3k.github.io/collections/reference/dict.html>
#'
#' # Second, we define the add, del and get functions that operate on the dictionary.
#'
#' # As an optional step, we define the NULL object. In this case, rather then
#' # the reserved word NULL, the NULL object is a data.frame with 0 rows and
#' # predefined column.
#'
#' TransientRepository <- R6::R6Class(
#'     classname = "Repository", inherit = R6P::AbstractRepository, public = list(
#'         initialize = function() {private$cars <- collections::dict()},
#'         add = function(key, value){private$cars$set(key, value); invisible(self)},
#'         del = function(key){private$cars$remove(key); invisible(self)},
#'         get = function(key){return(private$cars$get(key, default = private$NULL_car))}
#'     ), private = list(
#'         NULL_car = cbind(uid  = NA_character_, datasets::mtcars)[0,],
#'         cars = NULL
#' ))
#'
#' # Adding customised operations is also possible via the R6 set function.
#' # The following example, adds a query that returns all the objects in the database
#'
#' TransientRepository$set("public", "get_all_cars", overwrite = TRUE, function(){
#'     result <- private$cars$values() %>% dplyr::bind_rows()
#'     if(nrow(result) == 0) return(private$NULL_car) else return(result)
#' })
#'
#' # In this example, we use the mtcars dataset with a uid column that uniquely
#' # identifies the different cars in the Repository:
#' mtcars <- datasets::mtcars %>% tibble::rownames_to_column("uid")
#' head(mtcars, 2)
#'
#' # Here is how the caller uses the Repository:
#'
#' ## Instantiate a repository object
#' repository <- TransientRepository$new()
#'
#' ## Add two different cars specification to the repository
#' repository$add(key = "Mazda RX4", value = dplyr::filter(mtcars, uid == "Mazda RX4"))
#' repository$add(key = "Mazda RX4 Wag", value = dplyr::filter(mtcars, uid == "Mazda RX4 Wag"))
#'
#' ## Get "Mazda RX4" specification
#' repository$get(key = "Mazda RX4")
#'
#' ## Get all the specifications in the repository
#' repository$get_all_cars()
#'
#' ## Delete "Mazda RX4" specification
#' repository$del(key = "Mazda RX4")
#'
#' ## Get "Mazda RX4" specification
#' repository$get(key = "Mazda RX4")
NULL

#' @rdname Repository
#' @description Mediates between the domain and data mapping layers using a
#'   collection-like interface for accessing domain objects.
#' @param key (`character`) Name of the element.
#' @param value (`?`) Value of the element. Note: The values in the
#'   \code{Repository} are not necessarily of the same type. That depends on the
#'   implementation of \code{AbstractRepository}.
#' @family object-relational patterns
#' @export
# nocov start
AbstractRepository <- R6::R6Class("Repository", inherit = Singleton, cloneable = FALSE, public = list(
    #' @description Instantiate an object
    initialize = function() exceptions$not_implemented_error(),
    #' @description Add an element to the Repository.
    add = function(key, value) exceptions$not_implemented_error(),
    #' @description Delete an element from the Repository.
    del = function(key) exceptions$not_implemented_error(),
    #' @description Retrieve an element from the Repository.
    get = function(key) exceptions$not_implemented_error()
))
# nocov end

