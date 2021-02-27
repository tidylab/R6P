# time_tk -----------------------------------------------------------------
time_tk <- function(func){
    wrapper <- function(...){
        start_time <- Sys.time()
        output <- withVisible(func(...))
        end_time <- Sys.time()

        print(difftime(end_time, start_time))
        ifelse(output$visible, return(output$value), return(invisible(output$value)))
    }

    return(wrapper)
}

test_that("decorating a function with time_tk extends another function abilities", {
    expect_silent(Sys.sleep(0.01))
    expect_type(Sys.sleep <- time_tk(base::Sys.sleep), "closure")
    expect_output(Sys.sleep(0.01), "Time difference of")
})


# assert_input_type -------------------------------------------------------
assert_input_type <- function(func){
    args_expected <- data.frame()
    for(i in seq_along(formals(func))){
        args_expected[i, "name"] = names(formals(func))[i]
        args_expected[i, "type"] = class(formals(func)[[i]])[1]
    }

    wrapper <- function(...){
        args_actual <- data.frame()
        for(i in seq_along(list(...))){
            args_actual[i, "name"] = names(list(...))[i]
            args_actual[i, "type"] = class(list(...)[[i]])[1]
        }

        args <- merge(args_expected, args_actual, by = "name", suffixes = c(".expected", ".actual"))
        for(i in seq_len(nrow(args))){
            if(identical(args[i, "type.expected"], args[i, "type.actual"])) next
            msg <- paste0(args[i, "name"], " is of type ", args[i, "type.actual"], " rather than ", args[i, "type.expected"], "!")
            stop(msg)
        }

        ifelse(output$visible, return(output$value), return(invisible(output$value)))
    }

    return(wrapper)
}

test_that("decorating a ValueObject with assert_input_type adds data type validation", {
    Customer <- function(given = NA_character_, family = NA_character_){
        tibble::tibble(given = given, family = family)
    }

    expect_s3_class(Customer(given = "Bilbo", family = 888), "data.frame")
    expect_type(Customer <- assert_input_type(Customer), "closure")
    expect_error(Customer(given = "Bilbo", family = 888), "family")
})
