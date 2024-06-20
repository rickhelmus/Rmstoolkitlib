# this function (mechanism) was based on zlibbioc (https://github.com/Bioconductor/zlibbioc)
pkgconfig <- function(opt = c("PKG_CFLAGS", "PKG_CXXFLAGS", "PKG_LIBS"))
{
    opt <- match.arg(opt)

    if (opt %in% c("PKG_CFLAGS", "PKG_CXXFLAGS"))
        cat(sprintf("-I%s", system.file("include", package = "Rlibmstoolkit")))
    else
    {
        arch <- if (nzchar(.Platform$r_arch))
            sprintf("/%s", .Platform$r_arch)
        else
            ""

        cat(sprintf("%s%s/libmstoolkit.a", system.file("libs", package = "Rlibmstoolkit"), arch))
    }
}
