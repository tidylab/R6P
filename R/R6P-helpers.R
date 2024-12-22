# Helper Functions --------------------------------------------------------
get_classname <- function() {
  calls <- as.character(sys.calls())
  calls <- calls[max(which(stringr::str_detect(calls, "\\$new\\(.*\\)")))]
  stopifnot(length(calls) == 1)

  classname <- stringr::str_remove(calls, "\\$new\\(.*\\)")
  return(classname)
}

dynGet <- function(x, ...) {
  tryCatch(
    base::dynGet(x, ...),
    error = function(e) {
      return(base::get(x, ...))
    }
  )
}

dynSet <- function(key, value) {
  n <- sys.nframe()
  for (i in seq_len(n - 1)) {
    if (any(key %in% ls(envir = parent.frame(i)))) {
      assign(key, value, envir = parent.frame(i))
    }
  }

  return()
}

# Exception Handling ------------------------------------------------------
#' @title Exception Handling
#' @keywords internal
#' @noRd
exceptions <- new.env()

exceptions$not_implemented_error <- function() {
  caller_name <- deparse(sys.calls()[[sys.nframe() - 2]])
  stop(paste(caller_name, "is not implmented"))
}
