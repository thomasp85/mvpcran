make_base_cran <- function(location) {
  rsync <- find_rsync()
  get_root(rsync, location)
  get_src(rsync, location)
  get_docs(rsync, location)
  get_web(rsync, location)
}

get_root <- function(rsync, location) {
  call <- paste0(
    rsync,
    ' -tlzv --delete -a --include="*.html" --include="*.shtml" --include="*.svg" --include="*.png" --exclude="*" cran.r-project.org::CRAN/ ',
    file.path(location, '')
  )
  system(call)
}

get_src <- function(rsync, location) {
  call <- paste0(
    rsync,
    ' -rtlzv --delete  cran.r-project.org::CRAN/src/ ',
    file.path(location, 'src', '')
  )
  system(call)
}

get_docs <- function(rsync, location) {
  call <- paste0(
    rsync,
    ' -rtlzv --delete  cran.r-project.org::CRAN/doc/ ',
    file.path(location, 'doc', '')
  )
  system(call)
}

get_web <- function(rsync, location) {
  call <- paste0(
    rsync,
    ' -rtlzv --delete  cran.r-project.org::CRAN/web/ ',
    file.path(location, 'web', '')
  )
  system(call)
}
