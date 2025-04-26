## ╭────────────────────────────────────────────────────────────────╮
## │ ~/.Rprofile                                                    │
## │ To set up R.nvim over a remote connection                      │
## │ Copy this file to the the remote machine's `~/.Rprofile`       │
## │                                                                │
## │ Make sure your local machine has a `~/.remoteR directory`      │
## │ we can configure this with nvim                                │
## ╰────────────────────────────────────────────────────────────────╯

options(
  repos = c(CRAN = "https://cran.r-project.org"),
  BiocManager.install = "binary"
)

if (interactive()) {
  if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }
}

if (requireNamespace("BiocManager", quietly = TRUE)) {
  options(renv.config.bioconductor.version = as.character(BiocManager::version()))
}
# Install packages with the following sytax:
# `BiocManager::install("package")`
# Youc can also install Packages from Bioconductor 
# wiht renv by using the bioc:: prefix. For example:
# `renv::install("bioc::Biobase")`

# options(nvimcom.verbose = 2)
# library(colorout)
