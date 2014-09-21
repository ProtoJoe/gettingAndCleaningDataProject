This code book describes the tidy data found by following the steps in the readme file. The tidy data has also helpfully been provided in tidyData.txt, and can be read in by calling 

    read.table("tidyData.txt", header=TRUE)

For each record, the following is provided:
====================================================

- The user ID of the user performing the activity.
- The name of the activity being performed.
- Each subsequent field contains the mean value over a number of tests for that user and activity.

Field Descriptions:
====================================================

NOTE: All values are normalized between -1 and 1 (except for, of course, userID and activity).

All fields that begin with "time" are time domain signals, captured at a constant rate of 50 Hz. All fields that begin with "frequency" are frequency domain signals.

 userID: The numeric identifier assigned to a user. These number from 1 to 30.
 activity: The string description of the activity taking place. Valid values are "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", and "Laying".
 timeBodyAccMeanX/Y/Z: The mean of the time domain body acceleration on the X/Y/Z axis.
 timeBodyAccStdX/Y/Z: The standard deviation of the time domain body acceleration on the X/Y/Z axis.
 timeGravityAccMeanX/Y/Z: The mean of the time domain gravity acceleration on the X/Y/Z axis.
 timeGravityAccStdX/Y/Z: The standard deviation of the time domain gravity acceleration on the X/Y/Z axis.
 timeBodyAccJerkMeanX/Y/Z: The mean of the time domain body acceleration jerk on the X/Y/Z axis.
 timeBodyAccJerkStdX/Y/Z: The standard deviation of the time domain body acceleration jerk on the X/Y/Z axis.
 timeBodyGyroMeanX/Y/Z: The mean of the time domain body gyro on the X/Y/Z axis.
 timeBodyGyroStdX/Y/Z: The standard deviation of the time domain body gyro on the X/Y/Z axis.
 timeBodyGyroJerkMeanX/Y/Z: The mean of the time domain body gyro jerk on the X/Y/Z axis.
 timeBodyGyroJerkStdX/Y/Z: The standard deviation of the time domain body gyro jerk on the X/Y/Z axis.
 timeBodyAccMagMean: The mean of the time domain body acceleration magnitude.
 timeBodyAccMagStd: The standard deviation of the time domain body acceleration magnitude.
 timeGravityAccMagMean: The mean of the time domain gravity acceleration magnitude.
 timeGravityAccMagStd: The standard deviation of the time domain gravity acceleration magnitude.
 timeBodyAccJerkMagMean: The mean of the time domain body acceleration jerk magnitude.
 timeBodyAccJerkMagStd: The standard deviation of the time domain body acceleration jerk magnitude.
 timeBodyGyroMagMean: The mean of the time domain body gyro magnitude.
 timeBodyGyroMagStd: The mean of the time domain body gyro magnitude.
 timeBodyGyroJerkMagMean: The mean of the time domain body gyro jerk magnitude.
 timeBodyGyroJerkMagStd: The standard deviation of the time domain body gyro jerk magnitude.
 frequencyBodyAccMeanX/Y/Z: The mean of the frequency domain body acceleration on the X/Y/Z axis.
 frequencyBodyAccStdX/Y/Z: The standard deviation of the frequency domain body acceleration on the X/Y/Z axis.
 frequencyBodyAccJerkMeanX/Y/Z: The mean of the frequency domain body acceleration jerk on the X/Y/Z axis.
 frequencyBodyAccJerkStdX/Y/Z: The standard deviation of the frequency domain body acceleration jerk on the X/Y/Z axis.
 frequencyBodyGyroMeanX/Y/Z: The mean of the frequency domain body gyro on the X/Y/Z axis.
 frequencyBodyGyroStdX/Y/Z: The standard deviation of the frequency domain body gyro on the X/Y/Z axis.
 frequencyBodyAccMagMean: The mean of the frequency domain body acceleration magnitude.
 frequencyBodyAccMagStd: The standard deviation of the frequency domain body acceleration magnitude.
 frequencyBodyBodyAccJerkMagMean: The mean of the frequency domain body body(?) acceleration jerk magnitude.
 frequencyBodyBodyAccJerkMagStd: The standard deviation of the frequency domain body body(?) acceleration jerk magnitude.
 frequencyBodyBodyGyroMagMean: The mean of the body body(?) gyro magnitude.
 frequencyBodyBodyGyroMagStd: The standard deviation of the body body(?) gyro magnitude.
 frequencyBodyBodyGyroJerkMagMean: The mean of the body body(?) gyro jerk magnitude.
 frequencyBodyBodyGyroJerkMagStd: The standard deviation of the body body(?) gyro jerk magnitude.
