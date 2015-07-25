# GettingAndCleaningDataCourseProject

This repo is used to filter and summarize the Human Activity Recognition Using Smartphones Data Set from UCI (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) by selecting raw measurements on the mean and standard deviation and producing an output table of the average of each of those variables grouped by the activity and subject id of the measurements, as per the requirements for the Getting and Cleaning Data Course Project on Coursera, taught by Jeff Leek, PhD, Roger D. Peng, PhD, and Brian Caffo, PhD from John Hopkins. 

## Usage

From Command Line: `run_analysis.R rootDatasetDir outputDir`

**Params**:  
rootDatasetDir: the path to the root directory of the dataset  
outputPath: the path to write the summarized data to

**Note**: The script assumes the following directory structure of the UCI HAR Dataset (the default structure when downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

* root  
  * train  
    * subject_train.txt  
    * X_train.txt  
    * y_train.txt  
  * test  
    * subject_test.txt  
    * X_test.txt  
    * y_test.txt  
  * activity_labels.txt  
  * features.txt  
