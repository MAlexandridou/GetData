Data: Experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

Variables:
SubjectId: Number that indicates which of the 30 volunteers each observation is
Activity:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, what the Subject was doing
tBodyAcc.mean...X,Y,Z: Total Body Accelerator mean measure on 3 dimensional space
tGravityAcc.mean...X,Y,Z: Total Gravity Acceleration singals' mean measure on 3 dimensional space
tBodyAccJerk.mean...X,Y,Z: Total Body Acceleration jerk signals' mean measure on 3 dimensional space
tBodyGyro.mean...X,Y,Z: Total Body Gyroscope  mean measure on 3 dimensional space
tBodyGyroJerk.mean...X,Y,Z: Total Body Gyroscope jerk signal mean measure on 3 dimensional space
tBodyAccMag.mean..,tGravityAccMag.mean..,tBodyAccJerkMag.mean..,tBodyGyroMag.mean..,tBodyGyroJerkMag.mean..: The magnitude of these three-dimensional signals 
fBodyAcc.mean...X,Y,Z : the acceleration frequency domain signal mean measure on 3 dimensional space  
fBodyAccJerk.mean...X,Y,Z : the acceleration frequency domain jerk signal mean measure on 3 dimensional space     
fBodyGyro.mean...X,Y,Z :  the gyroscope frequency domain jerk signal mean measure on 3 dimensional space        
fBodyAccMag.mean.., fBodyBodyAccJerkMag.mean.., fBodyBodyGyroMag.mean..,fBodyBodyGyroJerkMag.mean..: The magnitude of these three-dimensional signals wer
tBodyAcc.std...X,Y,Z:  Total Body Accelerator standard deviation measure on 3 dimensional space   
tGravityAcc.std...X,Y,Z:  Total Gravity Acceleration singals' standard deviation measure on 3 dimensional space   
tBodyAccJerk.std...X,Y,Z:     Total Body Acceleration jerk signals' standard deviation measure on 3 dimensional space
tBodyGyro.std...X,Y,Z:          Total Body Gyroscope  standard deviation measure on 3 dimensional space
tBodyGyroJerk.std...X,Y,Z:   Total Body Gyroscope jerk signal  measure on 3 dimensional space   
tBodyAccMag.std.., tGravityAccMag.std..,tBodyAccJerkMag.std..,tBodyGyroMag.std..,tBodyGyroJerkMag.std..: The magnitude of these three-dimensional signals wer  
fBodyAcc.std...X,Y,Z:  the acceleration frequency domain signal standard deviation measure on 3 dimensional space          
fBodyAccJerk.std...X,Y,Z: the acceleration frequency domain jerk signal standard deviation measure on 3 dimensional space     
fBodyGyro.std...X,Y,Z:  the gyroscope frequency domain jerk signal standard deviation measure on 3 dimensional space        
fBodyAccMag.std.., fBodyBodyAccJerkMag.std..,fBodyBodyGyroMag.std..,fBodyBodyGyroJerkMag.std..: The magnitude of these three-dimensional signals wer

Transformations:
xtest<- X_test.txt
ytrain<- y_test.txt
features<- features.txt
xunited<-xtest+ytrain
a<-xunited Columns that have mean measures
b<-xunited Columns that have standard deviation measures
clean<-a+b
ytest<-y_test.txt
ytrain<-y_train.txt
activity<-activity_labels.txt
yunited<-ytest+ytrain
almostclean<-yunited+activity joined according to the common Column ActivityId
stest<-subject_test.txt
strain<-subject_test.txt
sunited<-stest+strain
beyondclean<-sunited
cleaner<-beyondclean+almostclean+clean
melted<-melted cleaner by leaving SubjectId and Activity Columns intact and reshaping the rest
tidy<-casted data with the wanted result, computed the average of each variable for each SubjectId and each Activity

