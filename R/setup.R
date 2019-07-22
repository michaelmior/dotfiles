# Select a CRAN mirror
local({r <- getOption("repos")
       r["CRAN"] <- "http://cran.r-project.org"
       options(repos=r)})

pkgTest <- function(x) {
  if (!require(x,character.only = TRUE)) {
    install.packages(x,dep=TRUE)
      if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}

# Install packages
pkgTest("chron")
pkgTest("cluster")
pkgTest("data.table")
pkgTest("dplyr")
pkgTest("doMC")
pkgTest("devtools")
pkgTest("DT")
pkgTest("feather")
pkgTest("foreign")
pkgTest("ggplot2")
pkgTest("googlesheets")
pkgTest("knitr")
pkgTest("microbenchmark")
pkgTest("parallel")
pkgTest("plyr")
pkgTest("Rcpp")
pkgTest("readr")
pkgTest("readxl")
pkgTest("shiny")
pkgTest("shinyjs")
pkgTest("styler")

# Set up Bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install()

# Update previously installed packages
update.packages(ask = FALSE)
