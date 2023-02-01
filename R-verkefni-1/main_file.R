# TODO: Description

# Install packages if necessary.
# Load packages.
library(datasets)

# Load data. [1a]
HS = read.csv("Data/husnaedisverd_2017_21.csv", sep = ";", header = TRUE)

# Preliminary data exploration of full dataset.
head(HS)
summary(HS)

# Narrowing of dataset to three neighbourhoods.[1b]
hverfi <- c(500, 170, 300)
HS <- filter(HS, matssvaedi%in%hverfi)

# Preliminary data exploration of narrowed dataset.
head(HS)
