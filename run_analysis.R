##1. Reading the subject and test files, and giving them descriptive variable names
subject <- read.table("test/subject_test.txt")
names(subject)[1] <- "subject"
y <- read.table("test/y_test.txt")
names(y)[1] <- "activity"
##2. Reading the X file, and giving it descriptive variable names 
##3. using the "features.txt" file
features <- read.table("features.txt")
colnames <- features$V2
x <- read.table("test/X_test.txt", col.name = colnames)
##4. creating datasets for the test data
test <- cbind(subject, y, x)
##5. Repeating steps 1-4 for training data
subject <- read.table("train/subject_train.txt")
names(subject)[1] <- "subject"
y <- read.table("train/y_train.txt")
names(y)[1] <- "activity"
x <- read.table("train/X_train.txt", col.name = colnames)
train <- cbind(subject, y, x)
##6. Combining test data and training data
combineddata <- rbind(test, train)
##7. Creating a dataset with only the variables that show mean or standard deviation,
##relabels the activities, and simplifies the variable names using the principles 
##in the week 4 lectures
mydata <- combineddata[ , grepl("subject|activity|mean|std", names(combineddata))]
mydata <- mydata[ , -grep("^f", names(mydata))]
library(dplyr)
mydata <- mutate(mydata, activity = gsub(1, "walking", activity))
mydata <- mutate(mydata, activity = gsub(2, "walkingupstairs", activity))
mydata <- mutate(mydata, activity = gsub(3, "walkingdownstairs", activity))
mydata <- mutate(mydata, activity = gsub(4, "sitting", activity))
mydata <- mutate(mydata, activity = gsub(5, "standing", activity))
mydata <- mutate(mydata, activity = gsub(6, "laying", activity))
names(mydata) <- gsub("^t", "time", names(mydata))
names(mydata) <- tolower(names(mydata))
names(mydata) <- gsub("\\.", "", names(mydata))
##8. creating final dataset
library(plyr)
means <- ddply(mydata, .(subject, activity), colwise(mean))
means <- mutate(means, id = paste(subject, activity))
means <- means[,c(ncol(means),1:ncol(means)-1)]

