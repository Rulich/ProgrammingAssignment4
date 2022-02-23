---
title: "Code Book"
author: "Ruslan Haziyev"
output:
  html_document:
    df_print: paged
---


### Project Description

This project contains a data transformation script to process initial dataset of 
"Human Activity Recognition Using Smartphones" project.
The output dataset contains tidy and easy to use data.

### Initial Dataset

A full description is available at the site where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the initial data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The initial dataset is automatically extracted into **'UCI HAR Dataset'** folder and includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

### Data Transformation Script

The R script **run_analysis.R** requires **dplyr** package to be installed on the R environment.
It executes the data transformation in the following steps:

- Downloads and extracts the initial dataset
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Output Dataset

The output file **tidy_data.txt** contains data set in a table format.
The data set has the following self-descriptive columns:

- 'subject'                                                           
- 'activity'                                                          
- 'time_body_acceleration_mean_x'                                     
- 'time_body_acceleration_mean_y'                                     
- 'time_body_acceleration_mean_z'                                     
- 'time_body_acceleration_standard_deviation_x'                       
- 'time_body_acceleration_standard_deviation_y'                       
- 'time_body_acceleration_standard_deviation_z'                       
- 'time_gravity_acceleration_mean_x'                                  
- 'time_gravity_acceleration_mean_y'                                  
- 'time_gravity_acceleration_mean_z'                                  
- 'time_gravity_acceleration_standard_deviation_x'                    
- 'time_gravity_acceleration_standard_deviation_y'                    
- 'time_gravity_acceleration_standard_deviation_z'                    
- 'time_body_acceleration_jerk_mean_x'                                
- 'time_body_acceleration_jerk_mean_y'                                
- 'time_body_acceleration_jerk_mean_z'                                
- 'time_body_acceleration_jerk_standard_deviation_x'                  
- 'time_body_acceleration_jerk_standard_deviation_y'                  
- 'time_body_acceleration_jerk_standard_deviation_z'                  
- 'time_body_gyroscopic_mean_x'                                       
- 'time_body_gyroscopic_mean_y'                                       
- 'time_body_gyroscopic_mean_z'                                       
- 'time_body_gyroscopic_standard_deviation_x'                         
- 'time_body_gyroscopic_standard_deviation_y'                         
- 'time_body_gyroscopic_standard_deviation_z'                         
- 'time_body_gyroscopic_jerk_mean_x'                                  
- 'time_body_gyroscopic_jerk_mean_y'                                  
- 'time_body_gyroscopic_jerk_mean_z'                                  
- 'time_body_gyroscopic_jerk_standard_deviation_x'                    
- 'time_body_gyroscopic_jerk_standard_deviation_y'                    
- 'time_body_gyroscopic_jerk_standard_deviation_z'                    
- 'time_body_acceleration_magnitude_mean'                            
- 'time_body_acceleration_magnitude_standard_deviation'              
- 'time_gravity_acceleration_magnitude_mean'                         
- 'time_gravity_acceleration_magnitude_standard_deviation'           
- 'time_body_acceleration_jerk_magnitude_mean'                       
- 'time_body_acceleration_jerk_magnitude_standard_deviation'         
- 'time_body_gyroscopic_magnitude_mean'                              
- 'time_body_gyroscopic_magnitude_standard_deviation'                
- 'time_body_gyroscopic_jerk_magnitude_mean'                         
- 'time_body_gyroscopic_jerk_magnitude_standard_deviation'           
- 'frequency_body_acceleration_mean_x'                                
- 'frequency_body_acceleration_mean_y'                                
- 'frequency_body_acceleration_mean_z'                                
- 'frequency_body_acceleration_standard_deviation_x'                  
- 'frequency_body_acceleration_standard_deviation_y'                  
- 'frequency_body_acceleration_standard_deviation_z'                  
- 'frequency_body_acceleration_jerk_mean_x'                           
- 'frequency_body_acceleration_jerk_mean_y'                           
- 'frequency_body_acceleration_jerk_mean_z'                           
- 'frequency_body_acceleration_jerk_standard_deviation_x'             
- 'frequency_body_acceleration_jerk_standard_deviation_y'             
- 'frequency_body_acceleration_jerk_standard_deviation_z'             
- 'frequency_body_gyroscopic_mean_x'                                  
- 'frequency_body_gyroscopic_mean_y'                                  
- 'frequency_body_gyroscopic_mean_z'                                  
- 'frequency_body_gyroscopic_standard_deviation_x'                    
- 'frequency_body_gyroscopic_standard_deviation_y'                    
- 'frequency_body_gyroscopic_standard_deviation_z'                    
- 'frequency_body_acceleration_magnitude_mean'                       
- 'frequency_body_acceleration_magnitude_standard_deviation'         
- 'frequency_body_body_acceleration_jerk_magnitude_mean'             
- 'frequency_body_body_acceleration_jerk_magnitude_standard_deviation'
- 'frequency_body_body_gyroscopic_magnitude_mean'                    
- 'frequency_body_body_gyroscopic_magnitude_standard_deviation'      
- 'frequency_body_body_gyroscopic_jerk_magnitude_mean'               
- 'frequency_body_body_gyroscopic_jerk_magnitude_standard_deviation'
