# Getting and Cleaning Data
This class project asked us to analyse the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and create a tidy data set.

## Prerequisites
* Download the files from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Unzip the archive
* Copy the following files at the root of the samed directory as the run_analysis.R script
  * subject_train.txt
  * X_train.txt
  * Y_train.txt
  * subject_test.txt
  * X_test.txt
  * Y_test.txt
  * features.txt
  * activity_labels.txt
* Check that the stringr library is installed. If not, you can download it from [CRAN](https://cran.r-project.org/).

## Running the script
Once all of these steps have been performed, the run_analysis.R script can be run. It will then generate an output file: tidy_set.csv

Please refer to the codebook for further information about the data and the analysis. 
