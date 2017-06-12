
Requirements
Create a create R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Programming Steps
The sbove task are performed in 10 steps outlines below.

# Step 1- create dir if needed - check if the directory already exists, if not create it
# Step 2- download file - check if the file already exist, if not download it
# Step 3- unzip file - unzip the file into the provoded directory
# Step 4- read data - read training and test and associated text file - this create data frames
# Step 5 - merge train and test data into one dataset, keys first - within each of train and test, use cbind to combine comlumn, then use rbind to append one set to other
# Step 5 - read data set labels read from features(2nd column) - 
# Step 6 - read column names - we need to extract mean columns
# Step 7 - flag required colums including key columns activityId and subjectId - create logical vector with true mean column names contain "mean" or "std" literal
# Step 8 - subset all rows and required colums - subset data containing only required columns
# Step 9 - apply descriptive activity names to name the activities in the data set
# Step 10 - take average and create new dataset

Variable Description
1 data frame variables x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded text files.
2. dt_traing, dt_test, contain merged data and dt contains merged data from both datasets and associated files
3.required_cols cotain logical vector of required column (key columns as well column name contain mean or std 
4. dt_final - subset containing only required columns. This is tidy dataset
5. dt_final_average - second data set with the average of each variable for each activity and each subject.

