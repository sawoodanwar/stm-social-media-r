packages <- c(
  "quanteda",
  "quanteda.textstats",
  "stm",
  "tidytext",
  "dplyr",
  "readr",
  "ggplot2",
  "here",
  "rmarkdown"
)

installed <- rownames(installed.packages())
to_install <- setdiff(packages, installed)
if (length(to_install) > 0) install.packages(to_install)
