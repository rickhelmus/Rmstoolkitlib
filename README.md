Rmstoolkitlib
==============

[![Rmstoolkitlib r-universe](https://rickhelmus.r-universe.dev/badges/Rmstoolkitlib)](https://rickhelmus.r-universe.dev/Rmstoolkitlib)

Rmstoolkitlib provides an R interface to the [MSToolkit](https://github.com/mhoopmann/mstoolkit) library for reading raw mass spectrometry data.

## Installation (R universe)

```r
install.packages('Rmstoolkitlib', repos = c('https://rickhelmus.r-universe.dev', 'https://cloud.r-project.org'))
```

## Installation (from source)

```r
# Install the package from the source repository
remotes::install_github("rickhelmus/Rmstoolkitlib")
```

If you face errors during installation it may be due to temporary installation paths with spaces in them (especially common on Windows). As a workaround, you can tempoerarily change the `TMPDIR` environment variable during package installation. For instance:

```r
withr::local_envvar(list(TMPDIR = "C:/Rtmpdir"), remotes::install_github("rickhelmus/Rmstoolkitlib"))
```

## Original project

For more information, refer to the original **MSToolkit** project:

https://github.com/mhoopmann/mstoolkit

## Usage in R packages

1. Add `Rmstoolkitlib` to `Imports`  or `Suggests` (_not_ `LinkingTo`) in your package `DESCRIPTION` file.
2. Add the following to your `src/Makevars` and/or `src/Makevars.win` file:

```Makefile
PKG_CXXFLAGS += $(shell echo 'Rmstoolkitlib::pkgconfig("PKG_CXXFLAGS")' | "${R_HOME}/bin/R" --vanilla --slave)
PKG_LIBS += $(shell echo 'Rmstoolkitlib::pkgconfig("PKG_LIBS")' | "${R_HOME}/bin/R" --vanilla --slave)
```

---

Feel free to contribute or raise issues on the repository.
