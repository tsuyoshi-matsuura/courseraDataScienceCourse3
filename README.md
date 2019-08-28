# Description of the script in run_analysis.R 

### Usage: source(run_analyis.R) 
This will create two tidy datasets 'data' and 'data_avg'. The first dataset
'data' is the result of performing tasks 1-4 in the assignment. The second
dataset 'data_avg' is the result of task 5 of the assignment. Moreover, the
script will output the dataset 'data_avg' as a file 'data_avg.txt' to the
working directory. This file is submitted as part of the assignment. 

### The tasks performed by the script 
The script is prepared as part of the "Getting and Cleaning Data Course Project".
The course assignment asks to create a script that performs the following tasks: 
  1) Merge the training and the test sets to create one data set.
  2) Extract only the measurements on the mean and standard deviation for 
     each measurement.
  3) Use descriptive activity names to name the activities in the data set
  4) Appropriately label the data set with descriptive variable names.
  5) From the data set in step 4, create a second, independent 
     tidy data set with the average of each variable for each activity and
     each subject. 
     
### Implementation of the above tasks in the script
     
This script performs all the above tasks, but in a sligtly different order.
The script takes the folloing steps: 
  1) Download and unzip the data file provided by the assignment (this 
     functionality has been commented out). Load the files in the zip file
     into datasets: 
        1) Training data set:    data_train
        2) Traing activity set:  act_train
        3) Training subject set: sub_train
        4) Test data set:        data_test
        5) Test activity set:    act_test
        6) Test subject set:     sub_test
  2) Firstly, the training and test data sets are merged in the row direction,
     i.e.after this step there are still three data sets:
        a) all processed data: data_all ~ data_train + data_test
        b) all activity data:  act_all  ~ act_train  + act_test
        c) all subject data:   sub_all  ~ sub_train  + sub_test
  3) All data sets are labeled with descriptive names. The names for the
     processed data are taken from the file 'features.txt' (561 names),
     the acivity data are labeled 'activity', the subject data are labeled 'subject'
  4) The processed data are reduced to only contain mean and standard
     deviation for each measurement
  5) the data are merged in column direction. The activity and subject data
     are put in front of the processed data: data ~ act_all + sub_all + data_all
  6) The activity data are given descriptive names. This is achieved by using
     the data in the file 'activity_labels.txt' to translate activity ID's to
     descriptive names.
     The data set after this step corresponds to the data set after tasks 1-4
     in the assignment
  7) Create a second, independent tidy data set with the average of each variable
     for each activity and each subject (this is the same as task 5 of the
     assignment)

