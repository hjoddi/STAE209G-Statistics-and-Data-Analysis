# Name, etc.

# Install packages
install.packages("pacman")

# Load packages
library(datasets)

## Load packages through pacman.
library(pacman)
pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis,
               httr, plotly, rio, rmarkdown, shiny, stringr, tidyr,
               tidyverse)

# Clear packages
p_unload(all) # Pacman packages.
detach("package:datasets", unload = TRUE) # Base packages.

# Clear console.
cat("\014") # ctrl+L
