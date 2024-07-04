# this function (mechanism) was based on zlibbioc (https://github.com/Bioconductor/zlibbioc)
pkgconfig <- function(opt = c("PKG_CFLAGS", "PKG_CXXFLAGS", "PKG_LIBS"))
{
    opt <- match.arg(opt)

    if (opt %in% c("PKG_CFLAGS", "PKG_CXXFLAGS"))
    {
        zflags <- utils::capture.output(zlibbioc::pkgconfig("PKG_CFLAGS"))
        cat(sprintf("-I%s", system.file("include", package = "Rmstoolkitlib")), "-D_LARGEFILE_SOURCE",
            "-D_FILE_OFFSET_BITS=64", "-DGCC -DHAVE_EXPAT_CONFIG_H", zflags)
    }
    else
    {
        arch <- if (nzchar(.Platform$r_arch))
            sprintf("/%s", .Platform$r_arch)
        else
            ""
        zflags <- if (Sys.info()["sysname"] == "Windows")
            utils::capture.output(zlibbioc::pkgconfig(paste0("PKG_LIBS_shared")))
        else
        {
            # BUG? zlibbioc vignette recommends to link to static on Linux, but doesn't actually provide it. However, it
            # is usually present anyway, so we can use the system zlib
            "-lz"
        }
        cat(sprintf("%s%s/lib%s.a", system.file("libs", package = "Rmstoolkitlib"), arch,
            c("mstlite", "mzimltools", "mzparser", "expat")), zflags)
    }
}
