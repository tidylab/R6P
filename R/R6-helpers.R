get_classname <- function(){
    calls <- as.character(sys.calls())
    calls <- calls[max(which(stringr::str_detect(calls, "\\$new\\(.*\\)")))]
    stopifnot(length(calls) == 1)

    classname <- stringr::str_remove(calls, "\\$new\\(.*\\)")
    return(classname)
}

dynSet <- function(key, value){
    n <- sys.nframe()
    for(i in seq_len(n-1))
        if(any(key %in% ls(envir = parent.frame(i))))
            assign(key, value, envir = parent.frame(i))

    return()
}

