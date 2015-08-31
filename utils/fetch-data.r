# Fetch NLIHC OOR data
# OOR data URL template: http://nlihc.org/sites/default/files/oor/files/reports/state/2015-OOR-AL.xls

# Requires datasets package for state data
# See: https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html
require("datasets")

# Some variables to make life easier
base_url <- "http://nlihc.org/sites/default/files/oor/files/reports/state/"
oor_template <- "OOR"
file_ext <- ".xls"
data_dir <- "data"
working_dir <- getwd()

# Create data directory if needed
if (!dir.exists(file.path(working_dir, data_dir))) {
  dir.create(file.path(working_dir, data_dir))
  print("Data directory was created.")
} else {
  print("Data directory already exists.")
}

oor_urls <- paste( base_url, 
                    oor_filenames <- paste( format(Sys.Date(),"%Y"), 
                                            oor_template,
                                            state.abb, 
                                            sep="-" ), 
                    file_ext, 
                    sep="" )
