get_classname <- function(){
    calls <- as.character(sys.calls())
    calls <- calls[max(which(stringr::str_detect(calls, "\\$new\\(.*\\)")))]
    stopifnot(length(calls) == 1)

    classname <- stringr::str_remove(calls, "\\$new\\(.*\\)")
    return(classname)
}
