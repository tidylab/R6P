<!-- README.md is generated from README.Rmd. Please edit that file -->

# `R6P` <img src="https://raw.githubusercontent.com/tidylab/R6P/master/pkgdown/logo.png" align="right" height="75"/>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/R6P)](https://CRAN.R-project.org/package=R6P)
[![R build
status](https://github.com/tidylab/R6P/workflows/R-CMD-check/badge.svg)](https://github.com/tidylab/R6P/actions)
[![codecov](https://codecov.io/gh/tidylab/R6P/branch/master/graph/badge.svg?token=U6FL5N32FL)](https://codecov.io/gh/tidylab/R6P)

<!-- badges: end -->

## Intentions

-   `R6P` is a collection of useful design patterns in R
-   `R6P` explains *how a design pattern works* and *when to use a
    design pattern*
-   `R6P` provides examples that show how to implement each design
    pattern in R

**Caution:** Most functions and classes provided by the `R6P` package
are not useful by themselves. This is because design patterns are
employed in a specific context. `R6P` implementations are designed for
demonstration purposes. Instead of directly using the design pattern as
they appear in the package, you’d have to adjust the source code
(provided in the examples) to the problem you are trying to solve.

## Introduction

Build robust and maintainable software with object-oriented design
patterns in R. Design patterns abstract and present in neat,
well-defined components and interfaces the experience of many software
designers and architects over many years of solving similar problems.
These are solutions that have withstood the test of time with respect to
re-usability, flexibility, and maintainability. ‘R6P’ provides abstract
base classes with examples for a few known design patterns. The patterns
were selected by their applicability to analytic projects in R. Using
these patterns in R projects have proven effective in dealing with the
complexity that data-driven applications possess.

This package is based on the work of Gamma1995, and Fowler2002.

### Should I use design patterns?

Design patterns represent an alternative to design: rather than
designing a new mechanism from scratch, just apply a well-known design
pattern. For the most part, this is good: design patterns arose because
they solve common problems, and because they are generally agreed to
provide clean solutions. If a design pattern works well in a particular
situation, it will probably be hard for you to come up with a different
approach that is better.

The greatest risk with design patterns is over-application. Not every
problem can be solved cleanly with an existing design pattern; don’t try
to force a problem into a design pattern when a custom approach will be
cleaner. Using design patterns doesn’t automatically improve a software
system; it only does so if the design patterns fit. As with many ideas
in software design, the notion that design patterns are good doesn’t
necessarily mean that more design patterns are better.

## Installation

You can install the released version of R6P from CRAN with:

    install.packages("R6P")

And the development version from GitHub with:

    # install.packages("devtools")
    devtools::install_github("tidylab/R6P")

## References

Fowler, Martin. 2002. *<span class="nocase">Patterns of enterprise
application architecture</span>*. Addison-Wesley Longman Publishing Co.,
Inc.

Gamma, Erich, Richard Helm, Ralph Johnson, and John Vlissides. 1995.
*<span class="nocase">Design patterns: elements of reusable
object-oriented software</span>*. Pearson Education India.

Ousterhout, John. 2018. *<span class="nocase">A Philosophy of Software
Design</span>*. Yaknyam Press.
