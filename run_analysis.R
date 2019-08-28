# Download the data
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./data.zip")
unzip("data.zip",exdir=".")

# Load training data
# X_train.txt has 561 columns
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",)

# y_train.txt is a single column file with activity data (1-6)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# subject_train.txt is a single column file with subject data (1-30)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Load test data
# X_test.txt has 561 columns
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# y_test.txt is a single column file with activity data (1-6)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# subject_train.txt is a single column file with subject data (1-30)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Append test data to train data and create 'all' data
X_all <- rbind(X_train,X_test)
y_all <- rbind(y_train,y_test)
subject_all <- rbind(subject_train,subject_test)

# Read headers for X_all
header_all <- read.table("./UCI HAR Dataset/features.txt")
names(X_all) <- header_all[,2]

# Only keep the mean and standard deviation of the measurements
# This means only keeping columns with '-mean(' and '-std(' in their names
keep_col <- grep("-mean\\(|-std\\(",names(X_all))
mydata <- X_all[,keep_col]

# Give headers to the activity and subject data
names(y_all) <- "activity"
names(subject_all) <- "subject"

# Add activity and subject columns to mydata
mydata <- cbind(y_all,subject_all,mydata)

# Give descriptive names for the activities
# read activtity code file 'activity_labels.txt'
activity <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)

setactname <- function(x) activity[x,2]
mydata$activity <- sapply(mydata$activity,setactname)

mydata_avg <- mydata %>% group_by(activity,subject) %>% summarize_all(mean)
