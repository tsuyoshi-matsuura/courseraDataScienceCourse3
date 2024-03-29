# Description of the script in run_analysis.R 

### Usage: source(run_analyis.R) 
This will create two tidy datasets 'data' and 'data_avg'. The first dataset
'data' is the result of performing tasks 1-4 of the assignment. The second
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
The script takes the following steps:
  1) Load data files into datasets: 
        1) Training data set ('X_train.txt'):    data_train
        2) Training activity set ('y_train.txt'):  act_train
        3) Training subject set (subject_train.txt): sub_train
        4) Test data set ('X_test.txt'):        data_test
        5) Test activity set ('y_test.txt':    act_test
        6) Test subject set (subject_test.txt'):     sub_test
  2) The training and test data sets are merged in the row direction using 'rbind',
     i.e.after this step there are still three data sets:
        1) all processed data: data_all ~ data_train + data_test
        2) all activity data:  act_all  ~ act_train  + act_test
        3) all subject data:   sub_all  ~ sub_train  + sub_test
  3) All data sets are labeled with descriptive names. The names for the
     processed data are taken from the file 'features.txt' (561 names),
     the activity data are labeled 'activity', the subject data are labeled 'subject'
  4) The processed data ('data_all') are reduced to only contain mean and standard
     deviation for each measurement. This is achieved by using grep to identify
     variables names containing '-mean(' or '-std(' and only selecting those
     columns for the updated, reduced data base
  5) The data are merged in column direction using 'cbind'. The activity and subject data
     are put in front of the processed data: data ~ act_all + sub_all + data_all
  6) The activity data are given descriptive names. This is achieved by using
     the data in the file 'activity_labels.txt' to translate activity ID's to
     descriptive names. 
     The data set after this step, 'data', corresponds to the data set after tasks 1-4
     in the assignment
  7) Create a second, independent tidy data set with the average of each variable
     for each activity and each subject (this is the same as task 5 of the
     assignment). This is achieved using the dplyr library to 'group_by' and 'summarize_all'
     the dataset 'data'. The result is in 'data_avg'

### Assumptions 
* The script assumes that the zip file with the data files was unzipped in the working directory.
  This means that the working directory should contain a folder 'UCI HAR Dataset'. If this is not
  the case please uncomment the three lines in the script that download and unzip the data file into
  the working directory.  
* The script also assumes that the dplyr packages is installed. If not, please
  install the package using install.packages("dplyr") before running the script.
