# Coursera - Getting and Cleaning Data Project

This repo contains `run_analysis.R` script that is the `Getting and Cleaning Data` Coursera course project.

## The Dataset
The input data can be found here:
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The input data description can be found here:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Dataset should be downloaded into `UCI HAR Dataset` folder in the root directory of this repo.
 
## The script process
The script does the following:
1. Load the dataset metadata
2. Load `train` and `test` data
3. Combine X, Y, and subject data
4. Assigns human-readable column names
5. Extract `mean` and `standard deviation` variables from the data
6. Merge `train` and `test` data
7. Calculate the average of each reading per `subject` and `activity`
8. Write back the results into `tidy_data.txt` file
