# Getting-And-Cleaning-Data-project

##The repository contains:
1. CodeBook.md describing the variables, the data and transformations.
2. run_analysis.R - R script used to perform the analysis.
3. README.md file having information on how to run the script and do the analysis.
4. tidyData.txt the tidy data set

##In order to create the tidy data set
1. Download the raw data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip the file.
3. Set the working directory to "UCI HAR Dataset" after extracting the contents of the .zip file.
4. Run run_analysis.R to generate the tidy data set.


##R script called run_analysis.R does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.