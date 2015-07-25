# Codebook

## Study Design

A description of how the data was collected can be found at the following link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Code Book

The dataset contains an 81-feature vector

All variables are formatted according to the following specifications:

*timeOrFrequencyDomain_MotionComponenetAndMeasurement_Function_Direction*

Note: Direction does not apply to every variable

**timeOrFrequencyDomain**: Either timeDomain or freqDomain. Describes the domain of the measurement. The time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. A Fast Fourier Transform was applied to obtain any frequency domain measurements. 

**MotionComponenet**: Either Body or Gravity. Indicates whether the force came from the body's motion or from the gravitation force on the sensor. The acceleration signal was separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

**Measurement**: Either Acceleration, AccelerationJerk, AccelerationMagnitude, AccelerationJerkMagnitude, Gyro, GyroJerk, GyroMagnitude, or GyroJerkMagnitude. Indicates the type of signal catpured from either the Samsung Galaxy S II's embedded accelerometer or gyroscope. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. The magnitude of these three-dimensional signals were calculated using the Euclidean norm.

**Function**: Either Mean, StdDev, or MeanFreq. Indicates the function applied to the signal to produce the value. MeanFreq is the weighted average of the frequency components to obtain a mean frequency.

**Direction**: Either X, Y, or Z. Indicates the direction of the signal from the 3-axial accelerometer and gyroscope.

**Units**: Accelerometer values are measured in standard gravity units 'g'. Gyroscope values are measured in radians/second. All features are normalized and bounded within [-1,1].

**Examples**:

timeDomain_BodyAcceleration_Mean_Y  
freqDomain_BodyGyro_StdDev_X  
freqDomain_BodyAccelerationJerk_MeanFreq_Z  

The dataset includes two additional columns, activity and subjectID, which represent the activity the subject was performing while the measurements were taken and the id of the subject performing the experiment, respectively. The activites are either WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING and the subject ids range from 1 to 30.


The choice was made to exclude angle measurements (i.e. angle(tBodyGyroJerkMean,gravityMean)), which measure the angle between two vectors because it does not represent a mean or standard deviation measurement, rather just makes use of those features to calculate the angle.

