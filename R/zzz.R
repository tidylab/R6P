.onAttach <- function(lib, pkg,...){
    try(
        packageStartupMessage(
            paste(
                "\033[44m\033[37m",
                "\n",
                "Welcome to R6P\n",
                "\n",
                "More information is available on the R6P project website:\n",
                "https://tidylab.github.io/R6P/\n",
                "\n",
                "\033[39m\033[49m",
                sep="")
        )
    )
}
