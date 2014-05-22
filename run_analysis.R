

# CleaningData() - Perfom following steps
# 1. Merge the training and the test datasets
# 2. Extract only the mean and standard deviation for each 
#    measurement.
# 3. Use descriptive names for the activities and various 
#    variables (column names)
# 4. Create a tidy data set with the average of each 
#    variable for each activity and each subject.
#
# Input is the raw data:
# rawDir - This is the directory where all the raw data sets
# reside. E.g. "C:/Users/.../UCI HAR Dataset"
#
# Output is the tidy data
# tidyCSVFilename - This is the file where the tidy data set 
# will be stored in CSV format.
CleaningData <- function(rawDir, tidyCSVFilename) {
        
        # We will store the generated tidy data set in
        # the file specified by the user.
        # If this file already exists then let the user know
        # so they can take appropriate corrective action 
        # before proceeding.
        if (file.exists(tidyCSVFilename) == TRUE) {
                stop("File specified for storing tidy data set already exists. Specify another file or remove this file before proceeding.")
        }
        
        # Step 1 of Assignment:
        # Merge the training and the test sets to 
        # create one data set
        
        
        print("Merging Datasets ...")
        mergedData <- MergeData(rawDir)
        
        # Step 2 of Assignment:
        # Extract only the mean 
        # and standard deviation for each measurement. 
        
        print("Extracting Mean and Standard Deviation ...")
        extractedData <- ExtractMeanAndStd(mergedData)
        
        # Steps 3 and 4 of the assignment:
        # Use descriptive activity names to name the 
        # activities in the data set
        # Appropriately label the data set with 
        # descriptive activity names.
        #
        # In addition, this step will also beautify the
        # variable names
        
        print("Beautifying the activity labels and variables ...")
        extractedData <- BeautifyAllVariables(rawDir, 
                                              extractedData)
        
        
        # Step 5 of the assignment:
        # Creates a second, independent tidy data set with 
        # the average of each variable for each activity 
        # and each subject. 
        
        print("Creating tidy data set ...")
        tidyData <- AverageData(extractedData)
        
        #Write the data to the specified csv file
       
        write.csv(tidyData, tidyCSVFilename)
        
        return(tidyData)
}

# MergeData() - Merge the training and test set data
MergeData <- function(topDir) {
        #First, merge X, y, and subject training data sets 
        trainData <- MergeDataSets(topDir, "train")
        
        #Then, merge X, y, and subject test data sets
        testData <- MergeDataSets(topDir, "test")
        
        #Next, combine the train and test data sets
        mergedData <- rbind(trainData, testData)
        
        return(mergedData)
}

# MergeDataSets() - Merge the X, y and subject datasets
MergeDataSets <- function(topDir, dataSet) {
        # Change working directory to the directory containing
        # the dataset 
        subDir <- paste(topDir, "/", dataSet, sep="")
        setwd(subDir)
        
        # Generate file names based on the dataSet
        # E.g. if dataSet is "train", then following
        # code will generate the file names X_train,
        # y_train and subject_train
        X_file <- paste("X_", dataSet, ".txt", sep="")
        y_file <- paste("y_", dataSet, ".txt", sep="")
        subj_file <- paste("subject_", dataSet, ".txt", 
                           sep="")
        
        # Read the above data files
        if (file.exists(X_file) == FALSE) {
                stop("Missing Data File")
        }
        X_data <- read.table(X_file)
        
        if (file.exists(y_file) == FALSE) {
                stop("Missing Data File")
        }
        y_data <- read.table(y_file)
        
        
        if (file.exists(subj_file) == FALSE) {
                stop("Missing Data File")
        }
        subj_data <- read.table(subj_file)
        
        # Give user freindly column names
        # for each data set
        
        # According to the README file
        # (the one provided with the data set),
        # "y" data contains the activity label
        names(y_data) <- "activity"
        
        # According to the README file
        # (the one provided with the data set),
        # "subject" file contains the identifier of 
        # the subject who carried out the experiment
        names(subj_data) <- "subjectid"
        
        # According to the README file
        # (the one provided with the data set),
        # the "features" files contains the 
        # feature names or the column names for the 
        # X data file
        
        # Change the working directory to the top
        # directory where the features file is located.
        setwd(topDir);
        
        # Read the features into a data frame
        if (file.exists("features.txt") == FALSE) {
                stop("Missing File: features.txt")
        }
        features <- read.table("./features.txt");
        
        names(X_data) <- as.character(features[,2])
        
        # Merge the X, y and subject data sets
        # Note these 3 data sets do not have common id
        # so using column bind (cbind) to combine them instead 
        # of merge or join
        
        mData <- cbind(subj_data, y_data, X_data)
        
        return(mData)
        
}

# ExtractMeanAndStd() - extract the mean and
# standard deviation columns from the data set

ExtractMeanAndStd <- function(mData) {
        
        # All columns (features) with mean values have "mean"
        # in their name. Similarly, all features with
        # standard deviation values have "std" in them.
        
        # Find index of the mean columns - meanCols
        meanCols <- grep("mean", names(mData))
        
        # Find index of the columns containing the standard
        # deviation values
        stdCols <- grep("std", names(mData))
        
        # Use the above indices to extract the mean
        # and standard deviation columns
        
        # Assignment instruction asks to extract mean and
        # standard deviations for "each" measurement
        # so we extract these values for all of them.
        
        # We keep the 1st and 2nd column intact - these
        # have the subject and y (activity) values.
        extData <- mData[,c(1, 2, meanCols,stdCols)]
        
        return(extData);
}

# BeautifyVariables() - Use factors with descriptive names
# instead of numbers in the activity column.
# Also, replace variables/column headings with descriptive
# names.
BeautifyAllVariables <- function(topDir, extractedData) {
        
        # Read the activity labels file
        # This has descriptive names for each activity
        setwd(topDir)
        if (file.exists("activity_labels.txt") == FALSE) {
                stop("Missing File: activity_labels.txt")
        }
        activities <- read.table("activity_labels.txt")
        
        # Convert to lower case and remove white spaces
        activities[,2] <- tolower(
                                as.character(activities[,2]))
        
        activities[,2] <- gsub("_", "", activities[,2])
        
        # Convert the activity (y) column in the data set
        # to a factor and use descriptive names
        extractedData$activity <- as.factor(
                                    extractedData$activity)
        levels(extractedData$activity) <- c(activities[,2])
        
        # Make all columns headings descriptive
        extractedData <- BeautifyColumnHeadings(extractedData)
        
        return(extractedData)
}

# Make all columns headings descriptive
BeautifyColumnHeadings <- function(edata) {
        # Remove all "-"
        names(edata) <- gsub("-", "", names(edata))
        
        # Remove all "()"
        names(edata) <- gsub("\\(", "", names(edata))
        names(edata) <- gsub("\\)", "", names(edata))
        
        # At this point, all column names start with 
        # either "t" or "f"
        # "t" columns have time data
        # "f" columns have frequency data
        names(edata) <- gsub("^t", "time", names(edata))
        names(edata) <- gsub("^f", "frequency", names(edata))
        
        # Expand various short forms
        # E.g. replace "Acc" with "acceleration"
        names(edata) <- gsub("Acc", "acceleration", 
                             names(edata))
        names(edata) <- gsub("Mag", "magnitude", names(edata))
        names(edata) <- gsub("std", "StandardDeviation", 
                             names(edata))
        
        # I see some places "Body" is duplicated in
        # column names. Remove the duplicate
        names(edata) <- gsub("BodyBody", "body", names(edata))
        
        # Convert everything to lower case
        names(edata) <- tolower(names(edata))
        
        
        return(edata)
}

# AverageData() - Create a tidy data set with the average of
# each variable for each activity and each subject.
AverageData <- function(eData) {
        
        library(plyr)
 
        # Split the data based on subject and activity
        # and then find means for each variable
        ncol <- ncol(eData)
        tidyData <- ddply(eData, 
                          .(subjectid,activity),
                          function (x) colMeans(x[,3:ncol]))
        
        return(tidyData)
}