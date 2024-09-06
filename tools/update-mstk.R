ghurl <- "https://github.com/rickhelmus/mstoolkit/archive/refs/heads/thread_safety.zip"
outf <- tempfile(fileext = ".zip")
stopifnot(download.file(ghurl, outf, mode = "wb") == 0)

# NOTE: the files will be extracted in a subdirectory mstoolkit-master
srcdir <- "src"
exdir <- file.path(srcdir, "mstoolkit")
unlink(exdir, recursive = TRUE)
unzip(outf, exdir = srcdir)
file.rename(file.path(srcdir, "mstoolkit-thread_safety"), file.path(srcdir, "mstoolkit"))

stopifnot(system2("patch", c(file.path(exdir, "Makefile"), file.path("tools", "Makefile.patch"))) == 0)
