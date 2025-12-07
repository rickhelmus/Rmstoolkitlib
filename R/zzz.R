#' Obtain compilation flags for `Rmstoolkitlib`
#' @param opt A character string specifying which compilation flags to return.
#'   Must be one of `"PKG_CFLAGS"`, `"PKG_CXXFLAGS"`, or `"PKG_LIBS"`.
#' @return A character string containing the requested compilation flags.
#' @source This function (mechanism) was based on zlibbioc (https://github.com/Bioconductor/zlibbioc)
#' @export
pkgconfig <- function(opt = c("PKG_CFLAGS", "PKG_CXXFLAGS", "PKG_LIBS"))
{
    opt <- match.arg(opt)

    if (opt %in% c("PKG_CFLAGS", "PKG_CXXFLAGS"))
    {
        cat(sprintf("-I\"%s\"", system.file("include", package = "Rmstoolkitlib")), "-D_LARGEFILE_SOURCE",
            "-D_FILE_OFFSET_BITS=64", "-DGCC -DHAVE_EXPAT_CONFIG_H")
    }
    else
    {
        arch <- if (nzchar(.Platform$r_arch))
            sprintf("/%s", .Platform$r_arch)
        else
            ""
        zflags <- "-lz"
        cat(sprintf("\"%s%s/lib%s.a\"", system.file("libs", package = "Rmstoolkitlib"), arch,
            c("mst", "mzparser", "expat")), zflags)
    }
}
