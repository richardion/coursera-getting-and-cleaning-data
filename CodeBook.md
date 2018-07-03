# Code Book
This code book describes the data used in the project and the processing needed to create the tidy data set.

## Context
The experiment consisted in measuring 30 people performing 6 activities while wearing a smartphone on the waist, which used its accelerometer and gyroscope to measure various movement data.

## Used Files
All the files have a .txt extension, which will be omitted in the following list.

### General files
* features: names of the 561 features
* activity_labels: Ids and names of the 6 activities

### Training set
* X_train: 7352 observations of the 561 features
* subject_train: a 7352-integer vector containing the ID of the subject for each observation
* y_train: a 7352-integer vector containing the ID of the activity for each observation

### Test set
* X_test: 2947 observations of the 561 features
* subject_test: a 2947-integer vector containing the ID of the subject for each observation
* y_test: a 2947-integer vector containing the ID of the activity for each observation

Further information about the files can be found in the README file.
Further information about the features can be found in the features_info file.

## Unused files
The project analysis was made using only the files described above. We ignored the other files which contain the raw data, located in the "Inertial Signals" subfolder of each set. 

## Analysis steps
1. The used files were read into data frames, as well as the corresponding headers. Both sets were merged into one data set.
2. Removal of the columns that did not contain the strings "std()" and "mean()", except the subject and activity columns. The resulting data set comprised of 68 columns.
3. In the activity column: replacement of the activity ID with its descriptive label, for each observation.
4. Aggregating the data set using the subject and activity as factors, and calculating the mean of each feature (one row per activity per subject). With 30 subjects and 6 activities, the resulting data set was comprised of 180 observations.
5. Outputting the tidy data set into a csv file, using the write.csv2() function.
