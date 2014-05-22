# README file for Getting and Cleaning Data Coursera Project

The goal of this project is to clean and process the raw data obtained from the **Human Activity Recognition Using Smartphones** experiment. The raw data from this experiment has various measurements for 30 subjects where each subject performed 6 different types of activities (e.g walking, standing, sitting and so on).

# Files accompanying this README
* run_analysis.R described below.
* CodeBook.md

## Raw Data Information
A full description of the experiment and the asscosciated raw data is available at the following site from where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Processing done on the Raw Data
The R script file - run_analysis.R - accompanying this README has **CleaningData()** function which performs following processing on the above mentioned raw data.
* Merge the training and the test datasets
* Extract only the mean and standard deviation for each 
measurement.
* Use descriptive names for the activities and various 
variables
* Create a tidy data set with the average of each 
variable for each activity and each subject.

The **Code Book** accompanying this README has details of the variables and so on.

### Main Function: CleaningData()
* There are no parameters to this function.
* It only accepts rawDir and tidyCSVFilename as input. rawDir is the directory where the raw data from the above experiment is stored. tidyCSVFilename is the CSV file where the processed tidy data set will be stored.
* It calls various helper functions described below to process the data.
* It stores the generated tidy data in the CSV file specified by the user.

### Helper Functions
* **MergeData():** It merges the training and test dataset. Each data set has X, y and subject data. It calls 
**MergeDataSets()** to first merge X, y, and subject data in the train and test data sets. It then merges the training and test data sets.
* **ExtractMeanAndStd():** The above merged data set has values for around 561 variables. We are interested only in the mean and standard deviation for each mesaurement. There are around 80 such values so it is not desirable to extract these values by specifying the column index manually. The columns of interest contain "mean" and "std" in their names. This fact is used to identify indices of the desired columns and then use those indices to extract the data.
* **BeautifyAllVariables():** The y values in above merged data set is a numeric vector representing the activity. E.g. number 1 represents **walking**. This is not user friendly. BeautifyAllVariables() function converts the y values to factor class and the names for the levels of this factor is obtained from the **activity_labels** file. This file was obtained with the raw data set. In addition, it calls **BeautifyColumnHeadings()** to give more descriptive names for the columns. This includes removing "()" and "-", changing to lower case, expanding abbreviated words (e.g. replacing "acc" with "acceleration") and so on.
* **AverageData():** This creates tidy data set  with the average of each variable for each activity and each subject. 

