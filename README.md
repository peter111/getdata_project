## Script description ##

This script doesn't require any data imput from user. 

In order to obtain result dataset this 11 steps were realized:
 
1. Dowloading Samsung data from the Internet to Working directory, unziping dataset and installing package dplyr. 
2. Loading every table from Samsung database.
3. Creating whole dataset by merging train and test data using rbind function
4. Assigning variable names from features table
5. Extracting columns with a mean() or std() postfix
6. Renaming extracted variable names
7. Merging actvities and test subjects from test and train dataset using rbind function
8. Adding activities and test subjects to dataset
9. Assigning activity labels from activity label table
10.Computing mean values of measurement variables for every combination of subject and activity using function agreggate
11. Exporting tidy dataset using write.table function in txt format

This repository contains one extra file tidy_data.txt. Just in case it is not possible to read an attachment.
