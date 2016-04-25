#run_analysis.R

* downloads data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzips the downloaded Dataset.zip file
* Read Training and Test Datasets
* Read X_train.txt, Y_train.txt, subject_train.txt
      - X_train contains the features data 
      - Y_train contains the activity labels
      - subject_train contains the subject ids
* Read X_test.txt, Y_test.txt, subject_test.txt
      - X_test contains the features data 
      - Y_test contains the activity labels
      - subject_test contains the subject ids
* Merge test and train dataset
* Read features.txt used for column names of X dataset
* Assign appropriate column names to X, Y and subject datset
* create combined dataset "har" that includes X,Y and subject
* Extract measurements on mean and standard deviation of each measurements
* Read activity_labels.txt
* Assign activity labels read from activity_labels.txt to Y
* Prepare tidy dataset with the average of each variable for each activity and each subject
* saves the mean and std into Measurements_MeanAndStd.csv
* saves the tidy dataset into TidyDataset.csv


#Measurements_MeanAndStd.csv
  10299 observations of 81 variables 
  
Variables:

SubjectID  
Activity                     
tBodyAcc-std()-X               
tBodyAcc-std()-Y  
tBodyAcc-std()-Z   
tGravityAcc-std()-X            
tGravityAcc-std()-Y  
tGravityAcc-std()-Z  
tBodyAccJerk-std()-X           
tBodyAccJerk-std()-Y 
tBodyAccJerk-std()-Z  
tBodyGyro-std()-X              
tBodyGyro-std()-Y  
tBodyGyro-std()-Z    
tBodyGyroJerk-std()-X          
tBodyGyroJerk-std()-Y 
tBodyGyroJerk-std()-Z 
tBodyAccMag-std()              
tGravityAccMag-std() 
tBodyAccJerkMag-std() 
tBodyGyroMag-std()             
tBodyGyroJerkMag-std() 
fBodyAcc-std()-X   
fBodyAcc-std()-Y               
fBodyAcc-std()-Z  
fBodyAccJerk-std()-X   
fBodyAccJerk-std()-Y           
fBodyAccJerk-std()-Z  
fBodyGyro-std()-X    
fBodyGyro-std()-Y              
fBodyGyro-std()-Z   
fBodyAccMag-std()     
fBodyBodyAccJerkMag-std()      
fBodyBodyGyroMag-std() 
fBodyBodyGyroJerkMag-std()    
tBodyAcc-mean()-X              
tBodyAcc-mean()-Y     
tBodyAcc-mean()-Z      
tGravityAcc-mean()-X           
tGravityAcc-mean()-Y   
tGravityAcc-mean()-Z   
tBodyAccJerk-mean()-X          
tBodyAccJerk-mean()-Y  
tBodyAccJerk-mean()-Z  
tBodyGyro-mean()-X             
[tBodyGyro-mean()-Y  
tBodyGyro-mean()-Z       
tBodyGyroJerk-mean()-X         
tBodyGyroJerk-mean()-Y    
tBodyGyroJerk-mean()-Z   
tBodyAccMag-mean()             
tGravityAccMag-mean()  
tBodyAccJerkMag-mean() 
tBodyGyroMag-mean()            
tBodyGyroJerkMag-mean() 
fBodyAcc-mean()-X    
fBodyAcc-mean()-Y              
fBodyAcc-mean()-Z   
fBodyAcc-meanFreq()-X   
fBodyAcc-meanFreq()-Y          
fBodyAcc-meanFreq()-Z  
fBodyAccJerk-mean()-X  
fBodyAccJerk-mean()-Y          
fBodyAccJerk-mean()-Z  
fBodyAccJerk-meanFreq()-X  
fBodyAccJerk-meanFreq()-Y      
fBodyAccJerk-meanFreq()-Z   
fBodyGyro-mean()-X         
fBodyGyro-mean()-Y             
fBodyGyro-mean()-Z         
fBodyGyro-meanFreq()-X    
fBodyGyro-meanFreq()-Y         
fBodyGyro-meanFreq()-Z   
fBodyAccMag-mean()          
fBodyAccMag-meanFreq()         
fBodyBodyAccJerkMag-mean()   
fBodyBodyAccJerkMag-meanFreq() 
fBodyBodyGyroMag-mean()        
fBodyBodyGyroMag-meanFreq()  
fBodyBodyGyroJerkMag-mean()    
fBodyBodyGyroJerkMag-meanFreq()

#TidyDataset.csv
  180 observations of 81 variables
  
Variables:

SubjectID       
Activity            
Average_tBodyAcc-std()-X               
Average_tBodyAcc-std()-Y   
Average_tBodyAcc-std()-Z      
Average_tGravityAcc-std()-X            
Average_tGravityAcc-std()-Y    
Average_tGravityAcc-std()-Z    
Average_tBodyAccJerk-std()-X           
Average_tBodyAccJerk-std()-Y   
Average_tBodyAccJerk-std()-Z   
Average_tBodyGyro-std()-X              
Average_tBodyGyro-std()-Y   
Average_tBodyGyro-std()-Z     
Average_tBodyGyroJerk-std()-X          
Average_tBodyGyroJerk-std()-Y  
Average_tBodyGyroJerk-std()-Z  
Average_tBodyAccMag-std()              
Average_tGravityAccMag-std()   
Average_tBodyAccJerkMag-std()   
Average_tBodyGyroMag-std()             
Average_tBodyGyroJerkMag-std()  
Average_fBodyAcc-std()-X       
Average_fBodyAcc-std()-Y               
Average_fBodyAcc-std()-Z     
Average_fBodyAccJerk-std()-X  
Average_fBodyAccJerk-std()-Y           
Average_fBodyAccJerk-std()-Z  
Average_fBodyGyro-std()-X          
Average_fBodyGyro-std()-Y              
Average_fBodyGyro-std()-Z         
Average_fBodyAccMag-std()        
Average_fBodyBodyAccJerkMag-std()      
Average_fBodyBodyGyroMag-std()    
Average_fBodyBodyGyroJerkMag-std() 
Average_tBodyAcc-mean()-X              
Average_tBodyAcc-mean()-Y        
Average_tBodyAcc-mean()-Z        
Average_tGravityAcc-mean()-X           
Average_tGravityAcc-mean()-Y     
Average_tGravityAcc-mean()-Z    
Average_tBodyAccJerk-mean()-X          
Average_tBodyAccJerk-mean()-Y    
Average_tBodyAccJerk-mean()-Z    
Average_tBodyGyro-mean()-X             
Average_tBodyGyro-mean()-Y      
Average_tBodyGyro-mean()-Z          
Average_tBodyGyroJerk-mean()-X         
Average_tBodyGyroJerk-mean()-Y     
Average_tBodyGyroJerk-mean()-Z     
Average_tBodyAccMag-mean()             
Average_tGravityAccMag-mean()      
Average_tBodyAccJerkMag-mean()      
Average_tBodyGyroMag-mean()            
Average_tBodyGyroJerkMag-mean()      
Average_fBodyAcc-mean()-X            
Average_fBodyAcc-mean()-Y              
Average_fBodyAcc-mean()-Z           
Average_fBodyAcc-meanFreq()-X       
Average_fBodyAcc-meanFreq()-Y          
Average_fBodyAcc-meanFreq()-Z      
Average_fBodyAccJerk-mean()-X     
Average_fBodyAccJerk-mean()-Y          
Average_fBodyAccJerk-mean()-Z     
Average_fBodyAccJerk-meanFreq()-X  
Average_fBodyAccJerk-meanFreq()-Y      
Average_fBodyAccJerk-meanFreq()-Z  
Average_fBodyGyro-mean()-X         
Average_fBodyGyro-mean()-Y             
Average_fBodyGyro-mean()-Z         
Average_fBodyGyro-meanFreq()-X     
Average_fBodyGyro-meanFreq()-Y         
Average_fBodyGyro-meanFreq()-Z     
Average_fBodyAccMag-mean()           
Average_fBodyAccMag-meanFreq()         
Average_fBodyBodyAccJerkMag-mean()   
Average_fBodyBodyAccJerkMag-meanFreq()
Average_fBodyBodyGyroMag-mean()        
Average_fBodyBodyGyroMag-meanFreq()  
Average_fBodyBodyGyroJerkMag-mean()   
Average_fBodyBodyGyroJerkMag-meanFreq()

