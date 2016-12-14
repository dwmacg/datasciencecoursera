The run_analysis.R file contains an R script that takes the data linked in the final project for the getting and cleaning data course and does the following:
   <br>1. Merges the training and the test sets to create one data set.
    <br> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
     <br>3. Uses descriptive activity names to name the activities in the data set
     <br>4. Appropriately labels the data set with descriptive variable names.
     <br>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity  
       and each subject.
 <br>Details and comments on each step:
     <br>1. a. In this step, the script first reads the "subject" text file from the "test" folder, and assigns the variable name "subject" 
          to it.
        <br>b. Next, it reads the "y" file from the "test" folder, and assigns the variable name "activity" to it.
        <br>c. Next, it reads the "x" file from the "test" folder, and, using the "features.txt" file provided in the download, assigns 
          variable names. 
        <br>d. Next, it combines the three dataframes created in steps 1a-1c in one file.
        <br>e. Next, it repeats the steps 1a-1d for the files in the "train" folder.
        <br>f. Finally, it combines the test data and the training data into one dataframe ("combineddata").
     <br>2. In this step, a subset of the dataframe created in 1f is created which includes only the variables "subject", "activity", and 
          variables that have measurements on mean and standard deviation, using the "grepl" command. Note that, for the purpose of this 
          exercise, I have assumed that we need to exclude "frequency" variables; I have done that using "-grep" to exclude any variable 
          that begins with "f".
     <br>3. In this step, I use the "mutate" command from the dplyr library to assign descriptive names to the activities.
     <br>4. In this step, I clean up the names of the variables created in step 1c a bit following the principles in the course lecture: 
          first, I change "t" to "time"; next, I make sure all letters are lowercase, and finally, I get rid of the dots.
     <br>5. In this step, I create the final tidy data set with means for all variables by subject and activity, using the following steps:
         <br>a. Using the "ddply" command from the "plyr" library, I create a file that has means for each combination of subject and activity.
         <br>b. Next, I create a unique id for each case by combining the subject and the activity.
         <br>c. Finally, I put the unique id in the first column.
        
 <br>For the purposes of this assignment, I'm treating each combination of subject and activity as a case, so my dataset is long rather than wide. I have a unique id for each case which combines the subject and activity, but have also kept subject and activity as separate variables. While this is redundant, in my experience it's nice to have that information stored separately for purposes of sorting or summarizing. The resulting file is 180 rows by 43 columns. 
          
