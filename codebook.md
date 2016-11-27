---
title: "Getting and Cleaning Data Project:CodeBook"
output: html_document
---
This document describes the variables, the data, and the transformation work performed to clean up the data.

## Identifiers
 
 + `subject` - The ID of the test subject.
 + `activity` - The type of activity performed when the corresponding measurements were taken.

## Measurements
  The variables are in time and frequency domain and stored by different sensors.Mean and Std
 stands for Mean and Standard Deviation.
 
 + `timeBodyAccelerometerMeanX`  
 + `timeBodyAccelerometerMeanY` 
 + `timeBodyAccelerometerMeanZ` 
 + `timeBodyAccelerometerStdX`  
 + `timeBodyAccelerometerStdY`  
 + `timeBodyAccelerometerStdZ`  
 + `timeGravityAccelerometerMeanX`              
 + `timeGravityAccelerometerMeanY`              
 + `timeGravityAccelerometerMeanZ`              
 + `timeGravityAccelerometerStdX`               
 + `timeGravityAccelerometerStdY`               
 + `timeGravityAccelerometerStdZ`               
 + `timeBodyAccelerometerJerkMeanX`             
 + `timeBodyAccelerometerJerkMeanY`             
 + `timeBodyAccelerometerJerkMeanZ`             
 + `timeBodyAccelerometerJerkStdX`              
 + `timeBodyAccelerometerJerkStdY`              
 + `timeBodyAccelerometerJerkStdZ`              
 + `timeBodyGyroscopeMeanX`                     
 + `timeBodyGyroscopeMeanY`                     
 + `timeBodyGyroscopeMeanZ`                     
 + `timeBodyGyroscopeStdX`                      
 + `timeBodyGyroscopeStdY`                      
 + `timeBodyGyroscopeStdZ`                      
 + `timeBodyGyroscopeJerkMeanX`                 
 + `timeBodyGyroscopeJerkMeanY`                 
 + `timeBodyGyroscopeJerkMeanZ`                
 + `timeBodyGyroscopeJerkStdX`                  
 + `timeBodyGyroscopeJerkStdY`                  
 + `timeBodyGyroscopeJerkStdZ`                  
 + `timeBodyAccelerometerMagnitudeMean`         
 + `timeBodyAccelerometerMagnitudeStd`          
 + `timeGravityAccelerometerMagnitudeMean`      
 + `timeGravityAccelerometerMagnitudeStd`       
 + `timeBodyAccelerometerJerkMagnitudeMean`     
 + `timeBodyAccelerometerJerkMagnitudeStd`      
 + `timeBodyGyroscopeMagnitudeMean`             
 + `timeBodyGyroscopeMagnitudeStd`              
 + `timeBodyGyroscopeJerkMagnitudeMean`         
 + `timeBodyGyroscopeJerkMagnitudeStd`          
 + `frequencyBodyAccelerometerMeanX`            
 + `frequencyBodyAccelerometerMeanY`            
 + `frequencyBodyAccelerometerMeanZ`            
 + `frequencyBodyAccelerometerStdX`             
 + `frequencyBodyAccelerometerStdY`             
 + `frequencyBodyAccelerometerStdZ`             
 + `frequencyBodyAccelerometerJerkMeanX`        
 + `frequencyBodyAccelerometerJerkMeanY`        
 + `frequencyBodyAccelerometerJerkMeanZ`        
 + `frequencyBodyAccelerometerJerkStdX`         
 + `frequencyBodyAccelerometerJerkStdY`         
 + `frequencyBodyAccelerometerJerkStdZ`         
 + `frequencyBodyGyroscopeMeanX`                
 + `frequencyBodyGyroscopeMeanY`                
 + `frequencyBodyGyroscopeMeanZ`                
 + `frequencyBodyGyroscopeStdX`                 
 + `frequencyBodyGyroscopeStdY`                 
 + `frequencyBodyGyroscopeStdZ`    
 + `frequencyBodyAccelerometerMagnitudeMean`    
 + `frequencyBodyAccelerometerMagnitudeStd`     
 + `frequencyBodyAccelerometerJerkMagnitudeMean`
 + `frequencyBodyAccelerometerJerkMagnitudeStd` 
 + `frequencyBodyGyroscopeMagnitudeMean`        
 + `frequencyBodyGyroscopeMagnitudeStd`        
 + `frequencyBodyGyroscopeJerkMagnitudeMean`    
 + `frequencyBodyGyroscopeJerkMagnitudeStd`
 
## Activity Labels
 
 + `WALKING` (value `1`): subject was walking during the test
 + `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
 + `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
 + `SITTING` (value `4`): subject was sitting during the test
 + `STANDING` (value `5`): subject was standing during the test
 + `LAYING` (value `6`): subject was laying down during the test

## Transformation Work
 The raw data were processed with `run_analysis.R` and finally tidy data set obtained.

## Steps of Transformation
	1. Downloading the raw data
	2. unzipping the data
	3. Viewwing the files
	4. reading the training and testing data
	5. merging the training and testing data
	6. Appropriate column names were labelled
	7. Extracting only the columns containg mean and std
	8. Turning activities and subject as factor variables
	9. appropriate labelling the data by removing special characters like .,() etc.
	10.keeping the subject and activity column rest data melted(library `reshape2` is used)
	11.data mean calculated using `dcast` command and finally *tidaydata.txt* is written down.
 
