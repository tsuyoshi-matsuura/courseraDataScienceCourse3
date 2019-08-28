# Codebook for the Getting and Cleaning Data Course Project

This code book describes the data source, data cleaning process and final data for the "Getting and Cleaning Datat Course Project"

### Back ground
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used in the "Getting and Cleaning Data Course Project" represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the Website:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data source Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiments captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

This data set is available for download from:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Description of the source data used in the project 
The data set includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features (561 variables)

- 'activity_labels.txt': Links the activity labels (1-6) with their activity name.

- 'train/X_train.txt': Training set. Size: 7352 x 561

- 'train/y_train.txt': Training activity labels (1-6). Size: 7352 x 1

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. Size: 7352 x 1

- 'test/X_test.txt': Test set. Size: 2947 x 516

- 'test/y_test.txt': Test activity labels (1-6). Size: 2947 x 1

- 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. Size: 2947 x 1

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

The data in the 'Inertial Signals' sub-folders were not used in this project

Detailed information on how the variables in the training and test data sets were obtained can be found in the file 'features_info.txt'. The list of resulting 561 variables is tabulated in the file 'features.txt'.

For convenience the content of 'features_infor.txt' is reproduced below. 

#### Start content 'features_info.txt'
Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag 
 
The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: 

gravityMean 
tBodyAccMean 
tBodyAccJerkMean 
tBodyGyroMean 
tBodyGyroJerkMean 

The complete list of variables of each feature vector is available in 'features.txt' 

#### End content 'features_info.txt'

### Data cleaning process 
The objective of the project is to create a tidy data set for a subset of the source data. The following criteria were used to define a tidy data set, viz.
1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table 

The source data already fulfil these criteria to a large extent, as each variable forms a column and each observation forms a row in the X_train.txt and X_test.txt data files. However, to make the data sets complete the data in X_train and X_test need to be combined with the activity and subject data sets in y_train/test and subject_train/test data.
Moreover, in this project we would like to restrict the data to the mean and standard deviation for each measurement which requires reduction of the data set.

To arrive at the desired reduced, tidy data set the following actions were performed:
  1) Merge the training and the test sets to create one data set.
  2) Extract only the measurements on the mean and standard deviation for 
     each measurement.
  3) Use descriptive activity names to name the activities in the data set
  4) Appropriately label the data set with descriptive variable names.
Actions 1 - 4 result in an intermediate tidy data set. The final tidy data set is
obtained by averaging each variable in the the intermediate data set for each
activity and subject.
  
To execute the above the following choices were made:
1. The descriptive variable names were taken from the 'features.txt' file which tabulates
   the variable name for each column in the the X_train and X_test data
2. The descriptive activity names were taken from the 'activity_labels.txt' files which tabulates the activity id's 
   (used in the y_train and y_test data) agains the activity name chosen by the authors of the source data.
3. The mean and standard deviation data were identified by the variable name which should contain either '-mean('
   or '-std(' respectively.
   
The above procedure was implemented in the script contained in 'run_analysis.R'.
After sourcing the script the intermediate data set in in 'data' and the final
data set is in 'data_avg'.

### Description of the final tidy data set 'data_avg'

The dimension of the data set is 180 x 68. The rows form all combination of 6 activities 
and 30 subjects whos performed the activities.  
The data set has the following columns:  
1 activity: description of the activity performed by the subject: WALKING,
  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING   
2 subject: subject id ranges from 1 to 30   
3 tBodyAcc-mean()-X   
4 tBodyAcc-mean()-Y   
5 tBodyAcc-mean()-Z   
6 tBodyAcc-std()-X   
7 tBodyAcc-std()-Y   
8 tBodyAcc-std()-Z   
9 tGravityAcc-mean()-X   
10 tGravityAcc-mean()-Y   
11 tGravityAcc-mean()-Z   
12 tGravityAcc-std()-X   
13 tGravityAcc-std()-Y   
14 tGravityAcc-std()-Z   
15 tBodyAccJerk-mean()-X   
16 tBodyAccJerk-mean()-Y   
17 tBodyAccJerk-mean()-Z   
18 tBodyAccJerk-std()-X   
19 tBodyAccJerk-std()-Y   
20 tBodyAccJerk-std()-Z   
21 tBodyGyro-mean()-X   
22 tBodyGyro-mean()-Y   
23 tBodyGyro-mean()-Z   
24 tBodyGyro-std()-X   
25 tBodyGyro-std()-Y   
26 tBodyGyro-std()-Z   
27 tBodyGyroJerk-mean()-X   
28 tBodyGyroJerk-mean()-Y   
29 tBodyGyroJerk-mean()-Z   
30 tBodyGyroJerk-std()-X   
31 tBodyGyroJerk-std()-Y   
32 tBodyGyroJerk-std()-Z   
33 tBodyAccMag-mean()   
34 tBodyAccMag-std()   
35 tGravityAccMag-mean()   
36 tGravityAccMag-std()   
37 tBodyAccJerkMag-mean()   
38 tBodyAccJerkMag-std()   
39 tBodyGyroMag-mean()   
40 tBodyGyroMag-std()   
41 tBodyGyroJerkMag-mean()   
42 tBodyGyroJerkMag-std()   
43 fBodyAcc-mean()-X   
44 fBodyAcc-mean()-Y   
45 fBodyAcc-mean()-Z   
46 fBodyAcc-std()-X   
47 fBodyAcc-std()-Y   
48 fBodyAcc-std()-Z   
49 fBodyAccJerk-mean()-X   
50 fBodyAccJerk-mean()-Y   
51 fBodyAccJerk-mean()-Z   
52 fBodyAccJerk-std()-X   
53 fBodyAccJerk-std()-Y   
54 fBodyAccJerk-std()-Z   
55 fBodyGyro-mean()-X   
56 fBodyGyro-mean()-Y   
57 fBodyGyro-mean()-Z   
58 fBodyGyro-std()-X   
59 fBodyGyro-std()-Y   
60 fBodyGyro-std()-Z   
61 fBodyAccMag-mean()   
62 fBodyAccMag-std()   
63 fBodyBodyAccJerkMag-mean()   
64 fBodyBodyAccJerkMag-std()   
65 fBodyBodyGyroMag-mean()   
66 fBodyBodyGyroMag-std()   
67 fBodyBodyGyroJerkMag-mean()   
68 fBodyBodyGyroJerkMag-std()   

Variables in columns 3 to 68 are described in 'features_info.txt', see also the
inserted text above. Note that in this data set each variable is the mean
of the measurement for each activity and each subject,
