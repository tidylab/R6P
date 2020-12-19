InMemoryRepository <- R6::R6Class(
    classname = "Repository", inherit = AbstractRepository, public = list(
        initialize = function() private$cars <- collections::dict(),
        add = function(key, value){private$cars$set(key, value); invisible(self)},
        del = function(key){private$cars$remove(key); invisible(self)},
        get = function(key){return(private$cars$get(key, default = NULL))}
    ), private = list(
        cars = NULL)
)

PersistentRepository <- R6::R6Class(
    classname = "Repository", inherit = AbstractRepository, public = list(
        #' @param immediate (`logical`) Should queries be committed immediately?
        initialize = function(immediate = TRUE){
            private$immediate <- immediate
            private$conn <- DBI::dbConnect(RSQLite::SQLite(), dbname = ":memory:")
            private$NULL_car <-
                datasets::mtcars[0,] %>%
                tibble::add_column(uid = NA_character_, .before = 0)

            DBI::dbCreateTable(private$conn, "mtcars", private$NULL_car)
        },
        add = function(key, value){
            value <- private$NULL_car %>% tibble::add_row(uid = key, value)
            self$del(key = key)
            DBI::dbAppendTable(private$conn, "mtcars", value)
            invisible(self)
        },
        del = function(key){
            statement <- paste0("DELETE FROM mtcars WHERE uid = '", key, "'")
            DBI::dbExecute(private$conn, statement, immediate = private$immediate)
            invisible(self)
        },
        get = function(key){
            statement <- paste0("SELECT * FROM mtcars WHERE uid = '", key, "'")
            result <- DBI::dbGetQuery(private$conn, statement)
            if(nrow(result) == 0) return(NULL) else return(result)
        }
    ), private = list(
        immediate = NULL,
        NULL_car = NULL,
        conn = NULL)
)

PersistentRepository$set("public", "get_all_cars", overwrite = TRUE, function(){
    statement <- "SELECT * FROM mtcars"
    result <- DBI::dbGetQuery(private$conn, statement)
    if(nrow(result) == 0) return(NULL) else return(result)
})


# repository <- InMemoryRepository$new()
repository <- PersistentRepository$new()

repository$add(key = rownames(mtcars[1,]), value = mtcars[1,])
repository$add(key = rownames(mtcars[2,]), value = mtcars[2,])

repository$get(key = rownames(mtcars[1,]))

repository$get_all_cars()

repository$del(key = rownames(mtcars[1,]))
repository$get(key = rownames(mtcars[1,]))
