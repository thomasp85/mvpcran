make_mac_cran <- function(location, version) {
  rsync <- find_rsync()
  if (is.null(version)) version <- find_mac_versions(location)
  get_mac_tools(rsync, location)
  get_mac_r(rsync, location)
  get_mac_bin(rsync, location, version)
}

get_mac_tools <- function(rsync, location) {
  call <- paste0(
    rsync,
    ' -rtlzv --delete  cran.r-project.org::CRAN/bin/macosx/tools/ ',
    file.path(location, 'bin', 'macosx', 'tools', '')
  )
  system(call)
}
get_mac_r <- function(rsync, location) {
  call <- paste0(
    rsync,
    ' -tlzv --delete  -a --include="NEWS" --include="*.shtml" --include="*.html" --include="*.pkg" --include="*.dmg" --include="*.gz" --exclude="*" cran.r-project.org::CRAN/bin/macosx/ ',
    file.path(location, 'bin', 'macosx', '')
  )
  system(call)
}
get_mac_bin <- function(rsync, location, version) {
  for (i in version) {
    call <- paste0(
      rsync,
      ' -rtlzv --delete  cran.r-project.org::CRAN/bin/macosx/mavericks/contrib/',
      i, '/ ',
      file.path(location, 'bin', 'macosx', 'mavericks', 'contrib', version, '')
    )
    system(call)
  }
}
