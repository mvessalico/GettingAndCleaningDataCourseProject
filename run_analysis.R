# Combines the training and testing data of the UCI HAR Dataset and produces a summary table
# of the mean of all features relating to mean and standard deviation, grouped by the activity
# the subject was performing and the subject id
#
# Params:
#   rootDatasetDir: the path to the root directory of the dataset
#   outputPath: the path to write the summarized data to
#
# Note: The script assumes the following directory structure of the UCI HAR Dataset
#       The default structure when downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#   -root
#       -train
#           -subject_train.txt
#           -X_train.txt
#           -y_train.txt
#       -test
#           -subject_test.txt
#           -X_test.txt
#           -y_test.txt
#       -activity_labels.txt
#       -features.txt


run_analysis <- function(rootDatasetDir, outputPath) {
    
    # Load dplyr library
    library(dplyr)
    
    # Loads the feature names from features.txt into a vector and appends "activity" and "subjectID"
    # to the end of the vector
    
    featureNames <- as.vector(select(read.table(file.path(rootDatasetDir, "features.txt")), V2)$V2)
    featureNames <- append(featureNames, c("activity", "subjectID"))
    
    # Gets names of all txt files in the train and test directory
    trainFiles <- list.files(file.path(rootDatasetDir, "train"), pattern=".txt", full.names=TRUE)
    testFiles <- list.files(file.path(rootDatasetDir, "test"), pattern=".txt", full.names=TRUE)
    
    # Loads the training data into a single dataframe
    trainingData <- lapply(trainFiles, read.table)
    trainingData <- do.call(cbind, trainingData)
    trainingData <- trainingData[, c(2:dim(trainingData)[2], 1)]
    
    #Loads the test data into a single dataframe
    testData <- lapply(testFiles, read.table)
    testData <- do.call(cbind, testData)
    testData <- testData[, c(2:dim(testData)[2], 1)]
    
    # Combines training and testing data into a single dataframe and adds the feature names as headers
    combinedData <- rbind(trainingData, testData)
    names(combinedData) <- make.names(featureNames, unique=TRUE, allow_=TRUE)
    
    # Selects the columns relating to mean and standard deviation from the data, while removing the
    # columns relating to angle from the resulting dataframe
    meanStdData <- select(combinedData, matches("mean|std|activity|subjectID"))
    meanStdData <- meanStdData[, !(names(meanStdData) %in% select_vars(names(meanStdData), contains("angle")))]
    
    # Converts the numeric codes for activity type to labels
    activityNames <- as.vector(select(read.table(file.path(rootDatasetDir, "activity_labels.txt")), V2)$V2)
    meanStdData$activity <- factor(meanStdData$activity, labels=activityNames)
    
    # Renames the features to have more descriptive names
    names(meanStdData) <- gsub("^t", "timeDomain_", names(meanStdData))
    names(meanStdData) <- gsub("^f", "freqDomain_", names(meanStdData))
    names(meanStdData) <- gsub("std", "_StdDev_", names(meanStdData))
    names(meanStdData) <- gsub("Acc", "Acceleration", names(meanStdData))
    names(meanStdData) <- gsub("Mag", "Magnitude", names(meanStdData))
    names(meanStdData) <- gsub("mean", "_Mean_", names(meanStdData))
    names(meanStdData) <- gsub("Mean_Freq", "MeanFreq_", names(meanStdData))
    names(meanStdData) <- gsub("\\.", "", names(meanStdData))
    names(meanStdData) <- gsub("_$", "", names(meanStdData))
    
    # Writes a summary table of the mean of each column grouped by the activity and the subject
    avgData <- meanStdData %>% group_by(activity, subjectID) %>% summarise_each(funs(mean))
    write.table(avgData, outputPath, sep="\t", row.names=FALSE) 
    
    
}
