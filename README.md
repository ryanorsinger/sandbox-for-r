# Sandbox for R

## Datasets and Setup
- For easy access to the "Regression and Other Stories" data sets, there is an R package `rosdata`. 
- You can install it with a command `remotes::install_github("avehtari/ROS-Examples",subdir = "rpackage")`. 
- Then you can access data, for example, as `library(rosdata), data(wells), head(wells)`. 
- You can get the list of data sets with `?rosdata`.
- Example `library(rosdata)` then `data(hibbs)`

## Setup and configuration changes so far:
- Install R from https://cran.r-project.org/
- Install R Studio from https://posit.co/download/rstudio-desktop/
- `install.packages("tidyverse")`
- `install.packages("remotes")`
- `remotes::install_github("avehtari/ROS-Examples",subdir = "rpackage")`
- `install.packages("rstanarm", dependencies = TRUE, type = "source")` # Installs STAN
