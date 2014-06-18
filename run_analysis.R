##This reads the txt file "X_test"
xtest<-read.table("X_test.txt")
##This reads the txt file "X_train"
xtrain<-read.table("X_train.txt")
##This reads the txt file "features_labels"
features<-read.table("features.txt")

##This row binds the xtest and xtrain
xunited<-rbind(xtest,xtrain)

##This inserts the names given from the features to xunited
names(xunited)<-features[,2]

##This created a data frame only with the Columns which include information about mean
a<-xunited[grep("-mean()",names(xunited),fixed=T)]
##This created a data frame only with the Columns which include information about standard deviation
b<-xunited[grep("-std()",names(xunited),fixed=T)]
##This Column binds the two data frames to create a new data frame which has Columns related to mean and standard deviation
clean<-cbind(a,b)

##This reads the txt file "y_test"
ytest<-read.table("y_test.txt")
##This reads the txt file "y_train"
ytrain<-read.table("y_train.txt")
##This reads the txt file "activity_labels"
activity<-read.table("activity_labels.txt")
##This inserts the names ActivityId for first Column and Activity for second Column
names(activity)<-c("ActivityId","Activity")

##This row binds the ytest and ytrain
yunited<-rbind(ytest,ytrain)
##This inserts the names ActivityId for first Column 
names(yunited)<-"ActivityId"
##This joins yunited with activity according to the common Column ActivityId  
almostclean<-sqldf("select Activity from yunited inner join activity on yunited.ActivityId=activity.ActivityId")

##This reads the txt file "subject_test"
stest<-read.table("subject_test.txt")
##This reads the txt file "subject_train"
strain<-read.table("subject_train.txt")
##This row binds the stest and strain
sunited<-rbind(stest,strain)
##This inserts the name SubjectId to the one column of sunited
names(sunited)<-"SubjectId"
##Renaming because of reasons
beyondclean<-sunited

##This column binds beyondclean, almostclean and clean
cleaner<-cbind(beyondclean,almostclean,clean)

##This melts cleaner by leaving SubjectId and Activity Columns intact and reshaping all others
melted<-melt(cleaner,id=c("SubjectId","Activity"))
##This computed the average of each Variable for each SubjectId and each Activity
tidy<-dcast(melted, SubjectId + Activity ~ variable, mean)
