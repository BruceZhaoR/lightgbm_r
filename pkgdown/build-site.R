getwd()
setwd("C:/projects/lightgbm-r/")
devtools::document()

if (!dir.exists("./docs")) {
  dir.create("./docs")
}
print("========================building pkgdown site====================================")
#options(pkgdown.internet=FALSE)
library(pkgdown)

clean_site()
init_site()
build_home(quiet = FALSE,preview = FALSE)
build_reference(preview = FALSE)
# # to-do
# build_articles(preview = FALSE)
# build_tutorials(preview = FALSE)
# build_news(preview = FALSE)

# # don't work
# pkgdown::build_site(pkg = ".", examples = FALSE, document = TRUE,
#                     run_dont_run = TRUE, seed = 1014, lazy = FALSE,
#                     override = list(), preview = NA, new_process = FALSE)

# add artifacts
devtools::build(binary = TRUE, args = c('--preclean', '--no-multiarch'))
version <- gsub("Version: ","",grep("Version: ",readLines(con = file.path(".", "DESCRIPTION")),value = TRUE))
file.copy(file.path("..", sprintf("lightgbm_%s.tar.gz", version)),".")
file.copy(file.path("..", sprintf("lightgbm_%s.zip", version)),".")
