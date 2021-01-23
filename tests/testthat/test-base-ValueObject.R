Person <- ValueObject

test_that("instantiating a Null Value Object", {
    expect_s3_class(Person(), "data.frame")
})

test_that("instantiating a person", {
    expect_s3_class(
        Person(given = "Bilbo", family = "Baggins", birthdate = as.Date("2890-09-22")),
        "data.frame"
    )
})

test_that("instantiating persons", {
    expect_s3_class(Person(given = LETTERS, family = LETTERS),"data.frame")
})
