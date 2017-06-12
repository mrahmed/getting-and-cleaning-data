# This script accomplish the following tasks in 10 steps
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# 


# Step 1- check and create dir if needed
if (!file.exists("./data")) {dir.create("./data")}

# Step 2- download file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "./data/ds.zip"
if (!file.exists("./data/ds.zip")) {download.file(url,f)}

# Step 3- unzip file
if (!file.exists("./data/UCI HAR Dataset")) {unzip(zipfile = f, exdir ="./data" )}

# Step 4- read data
folder <- "./data/UCI HAR Dataset/"

# read training data
x_train <- read.table(paste0(folder,"train/X_train.txt"))
y_train <- read.table(paste0(folder,"train/y_train.txt"))
subject_train <- read.table(paste0(folder,"train/subject_train.txt"))

# read test data
x_test <- read.table(paste0(folder,"test/X_test.txt"))
y_test <- read.table(paste0(folder,"test/y_test.txt"))
subject_test <- read.table(paste0(folder,"test/subject_test.txt"))

# read features data
features <- read.table(paste0(folder,"features.txt"))

# read activity labels
activityLabels =  read.table(paste0(folder, "activity_labels.txt"))

# Step 5 - read data set labels read from features(2nd column)
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c("activityId","activityType")

# Step 5 - merge train and test data into one dataset, keys first
dt_traing <- cbind(y_train, subject_train, x_train )
dt_test <- cbind(y_test, subject_test, x_test )
dt <- rbind(dt_traing,dt_test)

# Step 6 - read column names - we need to extract mean columns
cols <- colnames(dt)

# Step 7 - flag required colums including key columns activityId and subjectId
required_cols <- (grepl("activityId" , cols) | grepl("subjectId" , cols) | grepl("mean.." , cols) |  grepl("std.." , cols))

# Step 8 - subset all rows and required colums
dt_final <- dt[,required_cols==T]

# Step 9 - apply descriptive activity names to name the activities in the data set.
dt_final <- merge(dt_final, activityLabels, all.x=TRUE, by="activityId")

# Step 10 - take average and create new dataset 
dt_final_average <- aggregate(. ~subjectId + activityId, dt_final, mean)

# write files
write.table(dt_final, paste0(folder,"tiday_data"), row.name=FALSE)
write.table(dt_final_average, paste0(folder,"tiday_data_average.txt"), row.name=FALSE)






