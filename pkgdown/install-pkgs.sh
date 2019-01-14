Rscript -e 'install.packages(c("devtools","pkgdown"), repos = "https://cran.rstudio.com", type="both")'
Rscript -e 'devtools::build(pkg = ".", vignettes = FALSE, args = c("--keep-empty-dirs"))'

# Install the package
Rscript -e 'version <- gsub("Version: ","",grep("Version: ",readLines(con = file.path(".", "DESCRIPTION")),value = TRUE));tarball <- file.path(getwd(),"..", sprintf("lightgbm_%s.tar.gz", version));system(sprintf("R CMD INSTALL %s --no-multiarch", tarball))'
