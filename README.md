---
title: "Readme"
output:
  html_document:
    df_print: paged
---

### Description

This project contains a data transformation script to process initial dataset of 
"Human Activity Recognition Using Smartphones" project.
The output dataset contains tidy and easy to use data.

### Dependencies

```run_analysis.R``` script depends on ```dplyr``` package. If package is not found, it will try install it automatically.

### Steps to execute

1. Put ```run_analysis.R``` script into a folder on your local drive.
2. Set this folder as a working directory using ```setwd()``` function in RStudio.
3. Run the script by ```source("run_analysis.R")``` This will download and extract initial data into ```UCI HAR Dataset``` folder. The script will transform initial data and generate a new file ```tidy_data.txt``` into your working directory.

