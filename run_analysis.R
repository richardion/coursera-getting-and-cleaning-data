# This is the script for the Week 4 assignment of the Getting & Cleaning Data course
# We will assume all the required files are located at the root the current working directory
# For reading the "activity_labels.txt" file and turning it into a data frame, we will need the stringr library
library(stringr)
#1 Merging the training and test sets to create one dataset
#1.1 We read the (.txt) data files and put them into data frames using read.table()
#1.1.1 Train set
subject_train <- read.table ("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("Y_train.txt")

#1.1.2 Test set
subject_test <- read.table ("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("Y_test.txt")

#1.1.3 Features
features <- read.table("features.txt")

#1.1.4 Activity labels
# After reading the file, we want to turn it into a data frame
activities <- read.table("activity_labels.txt", sep = "\n")
activities<-str_split_fixed(activities$V1, " ", 2)
activities<-as.data.frame(activities)

#1.2 After reading the files, we will label the data sets
#1.2.1 Train set
names(subject_train) <- "subject"
names(y_train) <- "activity"
names(x_train) <- features$V2

#1.2.2 Test set
names(subject_test) <- "subject"
names(y_test) <- "activity"
names(x_test) <- features$V2

#1.2.3 Activities
names(activities)<- c("activityID", "activityLabel")

#1.3 Once all the data sets are labeled, we merge them into one dataset as required (except for the activities data set).
# For more convenience, we will order columns this way: subject, activity, all the measurements
train_set <- cbind(subject_train, y_train, x_train)
test_set <- cbind(subject_test, y_test, x_test)
complete_set <- rbind(train_set, test_set)

#2 Extracting only the measurements on the mean and standard deviation for each measurement
#2.1 Using grep, we select only the columns containing "mean()" OR "std()", as well as the subject and activity IDs
column_filter <- grepl("mean\\(\\)|std\\(\\)", names(complete_set))
column_filter[1] <- TRUE
column_filter[2] <- TRUE
#2.2 Finally, we remove the unwanted columns
filtered_set <- complete_set[,column_filter==TRUE]

#3 Using descriptive activity names to name the activities in the data set
#3.1 We replace the activity IDs in filtered_set with their values in activities
filtered_set$activity<-activities$activityLabel[filtered_set$activity]

#4 Appropriately labeling the data set with descriptive variable names
#4.1 Now let's tidy the variable names by replacing the "-std()" and "-mean()" with more appropriate names
names(filtered_set)<-gsub("-std\\(\\)","Std",names(filtered_set))
names(filtered_set)<-gsub("-mean\\(\\)","Mean",names(filtered_set))

#5 From the data set in step 4, creating a second, independant tidy data set with the average of each variable for each activity and each subject
#5.1 Defining the activity and subject columns as factors
filtered_set$activity <- as.factor(filtered_set$activity)
filtered_set$subject <- as.factor(filtered_set$subject)

#5.2 Now we create a new data frame called tidy_set, grouped by the two factors we have defined in 5.1
tidy_set<- aggregate(filtered_set, by=list(activity=filtered_set$activity, subject=filtered_set$subject), mean)
#Because the means of the factors are pointless, we drop those resulting columns
tidy_set[3:4]<-NULL

#5.3 Finally, we write the tidy data set into a csv file
write.csv2(tidy_set, "tidy_set.csv",row.names=FALSE)