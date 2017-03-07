port_cran <- function(location, binaries = character(), version = NULL) {
  make_base_cran(location)
  if ('mac' %in% tolower(binaries)) {
    make_mac_cran(location, version)
  }
  if ('win' %in% tolower(binaries)) {
    make_win_cran(location, version)
  }
}
