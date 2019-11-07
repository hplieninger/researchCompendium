
  - [A Research Compendium is Great](#a-research-compendium-is-great)
      - [Structure](#structure)
          - [Structure Similar to an R
            Package](#structure-similar-to-an-r-package)
          - [Additional Parts](#additional-parts)
  - [Resources](#resources)
  - [Get Started](#get-started)
      - [Workflow](#workflow)
  - [Alternatives](#alternatives)
  - [Misc](#misc)

<!-- README.md is generated from README.Rmd. Please edit that file -->

## A Research Compendium is Great

A research compendium is a bundle of files and folders, which contains
all the data, code, and writing with respect to a research project. A
compendium in the form of an R package has several advantages:

  - R packages have a decent structure that can be used to create a
    clear compendium that is well understood by many working with R
    (which includes, importantly, also future you).
  - This allows to easily share a compendium (on GitHub, on OSF, or in
    any other form).
  - Several tools and workflows designed for R packages can be useful in
    a compendium, for example, tests.

### Structure

The structure that I want to advertise herein is the following:

``` r
fs::dir_tree(recurse = 2)
```

    .
    +-- code
    |   +-- 01_summary-statistics.R
    |   +-- 11_irt-models_01.R
    |   +-- 12_irt-models-constrained_01.R
    |   \-- 21_cfa-models.R
    +-- data
    |   +-- jackson.rda
    |   \-- jackson_items.rda
    +-- data-raw
    |   +-- data.csv
    |   \-- jackson.R
    +-- DESCRIPTION
    +-- figures
    |   \-- scatterplot-N-E.pdf
    +-- LICENSE
    +-- man
    |   +-- add_numbers.Rd
    |   +-- jackson.Rd
    |   +-- jackson_items.Rd
    |   \-- pipe.Rd
    +-- NAMESPACE
    +-- R
    |   +-- add_numbers.R
    |   +-- jackson.R
    |   +-- jackson_items.R
    |   \-- utils-pipe.R
    +-- README.md
    +-- README.Rmd
    +-- report
    |   +-- output
    |   |   +-- 01_data-overview.md
    |   |   +-- 01_data-overview.Rmd
    |   |   \-- 01_data-overview_files
    |   +-- paper
    |   \-- talk
    \-- researchCompendium.Rproj

#### Structure Similar to an R Package

The following files and folders used in the compendium are part of the
typical R package structure:

  - `data/`: Contains data files that are available when the package is
    loaded via `data()`.
  - `data-raw/`: Contains data files and accompanying code that is used
    to create the data in `data/`. Files should be unchanged files that
    you receive from elsewhere. These two folders are very important for
    reproducability and should be as self-contained as possible.
  - `DESCRIPTION`: See, for instance,
    <http://r-pkgs.had.co.nz/description.html>
  - `man/`: Contains documentation automatically created by
    `devtools::document()`.
  - `NAMESPACE`: File is automatically created when building the
    package. (See, for instance,
    <http://r-pkgs.had.co.nz/namespace.html>)
  - `R/`: Contains your R functions, add them using `use_r()`.

#### Additional Parts

In addition to the parts above, you probably need additional files and
folders for your code and writing. I propose to create a few additional
folders on the top-level. The names should be descriptive, and you
should use only few additional top-level folders, because the structure
of the R package gets blurred otherwise.

I tend to use the following three folders each containing as many files
and sub-folders as I need:

  - `code/`: Folder contains mainly `.R`-files for analyses that are
    complex, preliminary, or of minor importance. May contain code
    written in other languages such as Stan or Python.
  - `figures/`. Folder contains no sub-folders, contains all plots (PDF,
    PNG, etc.) that may be needed in writing.
  - `report/`: Folder contains any form of writing/documentation that
    you create. This may be in the form of a paper or presentation, but
    may also be an `.Rmd`-file that contains documentation and results
    of an important analysis such that you can have a look at it in the
    future.

## Resources

  - Marwick, B., Boettiger, C., & Mullen, L. (2018). Packaging data
    analytical work reproducibly using R (and friends). *PeerJ
    Preprints*, *6*, e3192v2. doi:
    [10.7287/peerj.preprints.3192v2](https://doi.org/10.7287/peerj.preprints.3192v2)
  - [exampleRPackage](https://github.com/mvuorre/exampleRPackage): “In
    our manuscript (not yet available), we describe why and how
    researchers might choose to share their research products as R
    packages.”
  - [rmini](https://github.com/yihui/rmini): “A minimal R package with
    examples of most common components”
  - <http://kbroman.org/steps2rr/>: “Initial steps toward reproducible
    research”

## Get Started

There are several ways to create your own compendium. The first one is
to create a package structure and than add the parts you need step by
step. The [usethis](https://usethis.r-lib.org/index.html) package is
recommended for this:

``` r
library("usethis")

# Create package structure
create_package()
```

An alternative is to clone my GitHub repo and adapt it to your needs:

``` r
usethis::create_from_github("hplieninger/researchCompendium")
```

Last, there are several R packages that are designed to create a
compendium in a similar vein:

  - [rrtools](https://github.com/benmarwick/rrtools): Tools for Writing
    Reproducible Research in R
  - [template](https://github.com/Pakillo/template): Generic template
    for research projects structured as R packages
  - [starters](https://github.com/lockedata/starters): R Package for
    making projects for various R activities

### Workflow

  - Add a raw-data file in `data-raw/`. Create a script (via
    `use_data_raw()`) to import the raw data and bring it into the shape
    that you need for analyses. Add the polished file to `data/` using
    `use_data()`.
  - Write functions and save them in `R/` via `use_r()`.
  - Write documentation for your functions (and data sets) and run
    `devtools::document()`. Details can be found in
    <http://r-pkgs.had.co.nz/man.html>.
  - Load your package into memory via `devtools::load_all()`.
  - Add code and writing in folders `code/` or `report/`. Therein, you
    will use your data (attached via `data()`) and functions. Create
    figures as needed and save them in `figures/`.

## Alternatives

There are pros and cons and alternatives to everything including the
herein advertised structure of a compendium. Alternative approaches
often structure a compendium in such a way that a
[Makefile](https://en.wikipedia.org/wiki/Make_\(software\)) is used to
keep track of dependencies of the various parts of a compendium. (For
example, update all but only those analyses that depend on an updated
data set.) Alternative approaches are, for example:

  - [ProjectTemplate](http://projecttemplate.net/): ProjectTemplate is a
    system for automating the thoughtless parts of a data analysis
    project
  - [represtools](https://github.com/PirateGrunt/represtools):
    Reproducible Research Tools

## Misc

  - [How to name
    files](https://speakerdeck.com/jennybc/how-to-name-files) by Jenny
    Bryan
  - Book [Happy Git and GitHub for the useR](https://happygitwithr.com/)
  - Package [here](https://here.r-lib.org/): A simpler way to find your
    files. See also [Ode to the here
    package](https://github.com/jennybc/here_here) by Jenny Bryan.
