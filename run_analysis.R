# Script prepared as part of the "Getting and Cleaning Data Course Project"
#
# The course assignment asks to create a script that performs the following tasks
#   1) Merges the training and the test sets to create one data set.
#   2) Extracts only the measurements on the mean and standard deviation for 
#      each measurement.
#   3) Uses descriptive activity names to name the activities in the data set
#   4) Appropriately labels the data set with descriptive variable names.
#   5) From the data set in step 4, creates a second, independent 
#      tidy data set with the average of each variable for each activity and
#      each subject.
#
# This script performs all the above tasks, but in a sligtly different order.
# The script takes the folloing steps
#   A) Download and unzip the data file provided by the assignment. Load the
#      files in the zip file into datasets:
#         a) Training data set:    data_train
#         b) Traing activity set:  act_train
#         c) Training subject set: sub_train
#         d) Test data set:        data_test
#         e) Test activity set:    act_test
#         f) Test subject set:     sub_test
#   B) Firstly, the training and test data sets are merged in the row direction,
#      i.e.after this step there are still three data sets:
#         a) all processed data: data_all ~ data_train + data_test
#         b) all activity data:  act_all  ~ act_train  + act_test
#         c) all subject data:   sub_all  ~ sub_train  + sub_test
#   C) All data sets are labeled with descriptive names. The names for the
#      processed data are taken from the file 'features.txt' (561 names),
#      the acivity data are labeled 'activity', the subject data are labeled 'subject'
#   D) The processed data are reduced to only contain mean and standard
#      deviation for each measurement
#   E) the data are merged in column direction. The activity and subject data
#      are put in front of the processed data: data ~ act_all + sub_all + data_all
#   F) The activity data are given descriptive names. This is achieved by using
#      the data in the file 'activity_labels.txt' to translate activity ID's to
#      descriptive names.
#      The data set after this step corresponds to the data set after tasks 1-4
#      in the assignment
#   G) Create a second, independent tidy data set with the average of each variable
#      for each activity and each subject (this is the same as task 5 of the
#      assignment)


################################### STEP A #####################################
# Downloading and unzipping of the data. A folder "UCI HAR Dataset" is 
# created in the working folder containg all the required files
# Uncomment the next three lines to have the script download the data
#url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,destfile="./data.zip")
#unzip("data.zip",exdir=".")

# First load all the training data located in folder "./UCI HAR Dataset/train"
# The file "X_train.txt" contains the training data and has 561 columns
# The file "y_train.txt" is a single column file with activity data (1-6)
# The file "subject_train.txt" is a single column file with subject data (1-30)
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt",)
act_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Now load all the test data ocated in folder "./UCI HAR Dataset/test"
# The file "X_test.txt" contains the test data and has 561 columns
# The file "y_test.txt" is a single column file with activity data (1-6)
# The file "subject_test.txt" is a single column file with subject data (1-30)
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
act_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

################################### STEP B #####################################
# Append test data to train data and create 'all' data
# Note that rbind does not alter the ordering of the rows, therefore
# the three datasets remain 'synchronized'
data_all <- rbind(data_train,data_test)
act_all <- rbind(act_train,act_test)
sub_all <- rbind(sub_train,sub_test)

################################### STEP C #####################################
# Before merging the three data sets, they are labeled with descriptive variable
# names. The descriptive names for 'data_all' are taken from the file
# 'features.txt' (561 names). The column in 'act_all' is named "activity" and 
# the columm in 'sub_all' is named "subject"
# Read descriptive names for data_all
data_names <- read.table("./UCI HAR Dataset/features.txt")
names(data_all) <- data_names[,2]
# Give descriptive names to the activity and subject data columns
names(act_all) <- "activity"
names(sub_all) <- "subject"

################################### STEP D #####################################
# At this point all three datasets have descriptive variable names. The dataset
# data_all still has all 561 columns. Before merging the three datasets, the 
# dataset data_all is reduced to only contain the mean and standard deviation of
# the measurements. This is realised by only selecting the columns with '-mean('
# or '-std(' in their descriptive name.
keep_col <- grep("-mean\\(|-std\\(",names(data_all))
data_all <- data_all[,keep_col]

################################### STEP E #####################################
# Now merge the three datasets. The activity and subject columns are placed
# in front of the data columns
data <- cbind(act_all,sub_all,data_all)

################################### STEP F #####################################
# As the last step assign descriptive names to the activities. For the translating
# the activity ID's to descriptive names the data in the file 'activity_labels.txt'
# are used, viz.:
#  id descriptive name
#   1 WALKING
#   2 WALKING_UPSTAIRS
#   3 WALKING_DOWNSTAIRS
#   4 SITTING
#   5 STANDING
#   6 LAYING
#
# Read the activity labels tabel
act_label <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
# Define a function that translates the activity id into a descriptive name
setactname <- function(id) act_label[id,2]
# Translate all id's to descriptive names
data$activity <- sapply(data$activity,setactname)

# At this stage actions 1-4 of the assignment have been performed and 'data'
# contains the required tidy data set

################################### STEP F #####################################
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject. This is achieved by first grouping the
# data using the activity and subject variables and then taking the mean within
# each group
# 'data_avg' contains the second tidy data set
library(dplyr)
data_avg <- data %>% group_by(activity,subject) %>% summarize_all(mean)

######################  Create output for submission  ##########################
write.table(data_avg,file="data_avg.txt",row.name=FALSE)