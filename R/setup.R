# Select a CRAN mirror
local({r <- getOption("repos")
       r["CRAN"] <- "http://cran.r-project.org"
       options(repos=r)})

# Install packages
install.packages("chron")
install.packages("cluster")
install.packages("data.table")
install.packages("dplyr")
install.packages("doMC")
install.packages("devtools")
install.packages("DT")
install.packages("feather")
install.packages("foreign")
install.packages("ggplot2")
install.packages("googlesheets")
install.packages("knitr")
install.packages("microbenchmark")
install.packages("parallel")
install.packages("plyr")
install.packages("Rcpp")
install.packages("readr")
install.packages("readxl")
install.packages("shiny")
install.packages("shinyjs")
install.packages("styler")

# Set up Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install()

# Update previously installed packages
update.packages(ask = FALSE)
