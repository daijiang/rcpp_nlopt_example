path <- function(x) normalizePath(file.path(getwd(), x))
# dyn.load(path("nlopt/win/x64/lib/libnlopt-0.dll"))
withr::with_envvar(
  c(
    PKG_CXXFLAGS = glue::glue('-I"{folder}"', folder = path("nlopt/osx/include")),
    # CXX_STD = "CXX11",
    PKG_LIBS = glue::glue('-L"{folder}" -lnlopt -lm', folder = path("nlopt/osx/lib"))
  ),
  Rcpp::sourceCpp('main.cpp', verbose = FALSE, rebuild = TRUE)
)
test()
