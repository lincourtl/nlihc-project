# Fetch NLIHC OOR data
# OOR data URL template: http://nlihc.org/sites/default/files/oor/files/reports/state/2015-OOR-AL.xls

# Requires datasets package for state data
# See: https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html
require("datasets")

# Some variables to make life easier
base_url <- "http://nlihc.org/sites/default/files/oor/files/reports/state/%s"
oor_template <- "OOR"
file_ext <- ".xls"
data_dir <- "data"

## Create dir_name if it doesn't already exist
make_directory.maybe <- function(dir_name) {
  working_dir <- getwd()
  the_path <- file.path(working_dir,dir_name)
  if (!dir.exists(the_path)) {
    dir.create(the_path)
    print("Data directory was created.")
  } else {
    print("Data directory already exists.")
  }
}

## Download url to file path. If it already exists, redownload it if refetch=TRUE
download.maybe <- function(data_url, data_path, refetch) {
                    dest <- file.path(data_path, basename(data_url))
                    if (refetch || !file.exists(dest))
                      download.file(data_url, dest)
                    return(dest)
}

## Construct the filenames for our remote data
format_oor_filenames <- paste(
                  paste(
                    format(Sys.Date(),"%Y"),
                    oor_template,
                    state.abb,
                    sep="-" ),
                  file_ext,
                  sep="")

## Create a vector of urls to our remote data files
data_urls <- sprintf(base_url,format_oor_filenames)

## Create the data directory if necessary
make_directory.maybe(data_dir)

## Download all of the remote data files
data_files <- sapply(data_urls, download.maybe, data_path=data_dir, refetch=FALSE)