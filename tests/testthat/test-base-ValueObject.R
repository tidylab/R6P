Person <- ValueObject

test_that("instantiating a Null Value Object", {
    expect_s3_class(Person(), "data.frame")
})

test_that("instantiating a person", {
    expect_s3_class(Person(given = "Bilbo", family = "Baggins"), "data.frame")
})

test_that("instantiating persons without family names", {
    expect_s3_class(Person(given = LETTERS, ), "data.frame")
})
