#' @importFrom devtools find_rtools
find_rsync <- function() {
  find_rtools()
  if (system('rsync -h', ignore.stdout = T) != 0) {
    stop('rsync needs to be available', call. = FALSE)
  }
  'rsync'
}
