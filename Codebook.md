 

##Feature Selection 


 #The features selected for this dataset come from the remix of data in "Human Recognition 
 #Using Smartphones Dataset Version 1.0", which in turn have been taken from experiments carried out with 
 #a group of 30 colunteers within the age bracked of 19-48 years of age. The subjects performed six activities
 #(WALKING, WALKING_UPSTAIRS, WAKING_DOWNSTAIRS,SITTING, STANDING and LAYING) wearing a smartphone (Samsung Galaxy SII) 
 #on their waste. 

 #Signals were used to estimate variables of the feature vector for each pattern:  
 #'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

 #tBodyAcc-XYZ
 #tGravityAcc-XYZ
 #tBodyAccJerk-XYZ
 #tBodyGyro-XYZ
 #tBodyGyroJerk-XYZ
 #tBodyAccMag
 #tGravityAccMag
 #tBodyAccJerkMag
 #tBodyGyroMag
 #tBodyGyroJerkMag
 #fBodyAcc-XYZ
 #fBodyAccJerk-XYZ
 #fBodyGyro-XYZ
 #fBodyAccMag
 #fBodyAccJerkMag
 #fBodyGyroMag
 #fBodyGyroJerkMag

 #Additional vectors obtained by averaging the signals in a signal window sample.
 #These are used on the angle() variable:

 #gravityMean
 #tBodyAccMean
 #tBodyAccJerkMean
 #tBodyGyroMean
 #tBodyGyroJerkMean

##Relevent vector variables include:

 #mean()
 #std()
 #activity_id
 #activity_name
 #subject_id 

##Relevent dimensions include:
 #X_train.txt  7352*561
 #X_test.txt   2947*561
 #features.txt  561*2
 
 #The complete list of variables of each feature vector is available in 'features.txt'