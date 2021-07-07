##### Set dataset directory
setwd("UCI HAR Dataset")


###### Load in columns
columnnames <-  readLines("./features.txt") #Reads in file


##### Read in the test set
testsubject <- read.delim("./test/subject_test.txt", header = FALSE) #ID list for subjects
testmeasurements <- read.delim("./test/X_test.txt", sep = "", header = FALSE) #Main data measurements
testactivities <- read.delim("./test/y_test.txt", header = FALSE) #Activity list
testset <- cbind(testsubject, testactivities, testmeasurements) #Attach all the components together column-wise
colnames(testset) <- c("id", "activity", columnnames) #Append appropriate column names


##### Repeat again for the training set
trainsubject <- read.delim("./train/subject_train.txt", header = FALSE) #ID list for subjects
trainmeasurements <- read.delim("./train/X_train.txt", sep = "", header = FALSE) #Main data measurements
trainactivities <- read.delim("./train/y_train.txt", header = FALSE) #Activity list
trainset <- cbind(trainsubject, trainactivities, trainmeasurements) #Attach all the components together column-wise
colnames(trainset) <- c("id", "activity", columnnames) #Append appropriate column names


##### Merge both trainset and testset
fullset <- rbind(testset, trainset) #Bind both sets together row-wise
library(dplyr) #Note: dplyr MUST be installed for this code to work
fullset <- arrange(fullset, id, activity) #Arranges the data frame by subject id, in ascending order


##### Find the columns with mean and std measurements
filteredset <- fullset[, c(1,2, 2+grep("mean\\()|std\\()", columnnames))]  #Obtain desired columns 



###### Improve column names' readability
filteredsetcolnames <- colnames(filteredset) #Get column names of filteredset
filteredsetcolnames <- gsub("[0-9]+", "", filteredsetcolnames) #Remove numbers
filteredsetcolnames <- gsub(" ", "", filteredsetcolnames) #Remove whitespace
filteredsetcolnames <- gsub("-", "", filteredsetcolnames) #Remove '-'
filteredsetcolnames <- gsub("\\()", "", filteredsetcolnames) #Remove Brackets
filteredsetcolnames <- tolower(filteredsetcolnames) #lowercase everything
filteredsetcolnames <- gsub("^t", "time", filteredsetcolnames)
filteredsetcolnames <- gsub("^f", "freq", filteredsetcolnames)
colnames(filteredset) <- filteredsetcolnames #Append new column names for filteredset



##### Replacing activity codes with names for tidiness
activitycodes <- filteredset$activity
activitycodes <- gsub(1, "walking",activitycodes)
activitycodes <- gsub(2, "walking_upstairs",activitycodes)
activitycodes <- gsub(3, "walking_downstairs",activitycodes)
activitycodes <- gsub(4, "sitting",activitycodes)
activitycodes <- gsub(5, "standing",activitycodes)
activitycodes <- gsub(6, "laying",activitycodes)
filteredset$activity <- activitycodes


##### Create a tidy data set
grouping <- group_by(filteredset, id, activity)
tidydata <- summarise_all(grouping, mean)



##### Write tidydata.txt file
write.table(tidydata, file = "./tidydata.txt", sep = " ")



##### Code for reading in tidydata.txt
tidydata <- read.table(file = "./tidydata.txt", sep = " ")
