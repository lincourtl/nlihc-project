# Fetch NLIHC OOR data
# Requires datasets package for state data
# See: https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/state.html
# OOR data URL template: http://nlihc.org/sites/default/files/oor/files/reports/state/2015-OOR-AL.xls

require("datasets")
base_url <- "http://nlihc.org/sites/default/files/oor/files/reports/state/"
oor_template <- "OOR"
file_ext <- ".xls"
data_urls <- paste( 
              base_url,
              paste( format(Sys.Date(),"%Y"), 
                     oor_template,
                     state.abb, 
                     sep="-" ), 
              file_ext, 
              sep="" )
