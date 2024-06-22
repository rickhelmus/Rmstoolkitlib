# this function (mechanism) was based on zlibbioc (https://github.com/Bioconductor/zlibbioc)
pkgconfig <- function(opt = c("PKG_CFLAGS", "PKG_CXXFLAGS", "PKG_LIBS"))
{
    opt <- match.arg(opt)

    if (opt %in% c("PKG_CFLAGS", "PKG_CXXFLAGS"))
    {
        zflags <- utils::capture.output(zlibbioc::pkgconfig("PKG_CFLAGS"))
        cat(sprintf("-I%s", system.file("include", package = "Rlibmstoolkit")), zflags)
    }
    else
    {
        arch <- if (nzchar(.Platform$r_arch))
            sprintf("/%s", .Platform$r_arch)
        else
            ""
        zflags <- utils::capture.output(
            zlibbioc::pkgconfig(paste0("PKG_LIBS_", if (Sys.info()["sysname"] == "Windows") "shared" else "static"))
        )
        cat(sprintf("%s%s/lib%s.a", system.file("libs", package = "Rlibmstoolkit"), arch,
            c("mstlite", "mzimltools", "mzparser", "expat")), zflags)
    }
}
