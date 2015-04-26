# GettingDataProject
A repo for Getting and Cleaning Data's course project.

##Introduction
First, thank you very much for taking the time to mark my assignment. Please, if you have time, jot down some constructive 
commentary at the end. It will be greatly appreciated. I have in many cases made the script intentionally verbose to make the 
process as clear as possible. I also try to clean teh kept objects as often as possible.

##Contents
This repo contains four files:
1. The R script that transforms the dataset into a tidy dataset and ultimately produces an array of averages,
2. A Codebook that describes the variables in the final dataset,
3. The textfile output of the averages for each variable of each Subject/Activity combination,
4. This readme

##Requirements
My script makes use of the reshape2 package for R. I tried to minimise the use of non-core packages, however I found this one
necessary. Please run this package before running the script.
You can find the package at: http://cran.r-project.org/web/packages/reshape2/index.html
You can find package instructions at: http://cran.r-project.org/web/packages/reshape2/reshape2.pdf

##Part 2
For Part 2 of the set of instructions, it asks only for the mean and std titled variables. I used a broader set of these that 
others might have prefered. I could not find a definitive answer for this and erred on the side of keeping data than deleting 
it.

##Objectives
Both the dataset produced, and the averages table try to comply with the tidy data principle. That is:
1. Clear headings
2. One column per variable
3. One row per observation.

It is my belief that the "wide" version of the dataset meets this for the projects goals. 

##Script structure
The script does not follow the steps as outlined in the assignment description, however it DOES achieve all the steps
in an order that makes more sense to me. I have tried to break the script up with internal commentary which will allign with 
the description I have here:
###Reading in the data
This section merely reads in all the necessary data is a collection of objects. I use the getwd() command in case you use an 
atypical work directory.
###Condensing groups (Part 1a)
This condenses the above set of objects into logical tables, following the tidy data principle. It deletes unused objects as it 
moves past them. I chose to put the id variables at the front of the table to make easy identification.
###Condensing to single set (Part 1b)
Similar to the step above. I chose to do this separately to more easily keep the test and train data frames if they are later 
desired.
###Creating headers (Part 4)
This takes the variable names from features.txt file and apply them to the relevant data frame headers. It also names the header
 for Subjects and Activity
###Limiting columns to means, standard deviation, and identifiers (Part 2)
This step uses character string lookup to identify those columns which contain "Subjects", "Activity", "mean" or "std". It 
builds an index of the columns that fit the requirement, and discards the rest. Please see the above disclaimer about the choice
of columns.
###Creating table of averages (Part 5)
This step uses the reshape2 package to melt and recast the dataframe to find the averages as described in the project 
description. I had difficultly with the core packages to get this step done, hence my choice to use the reshape2 package. 
However use of the package makes the code extremely sussinct. 
###Using descriptive activity variables (Part 3)
This final step applies the descriptive names rather than coded ids for each activity. It also includes a hashed-out line which 
repeats the step for the second table of average results, however this extra step created problems in writing a .txt file 
(relating to the dimensionality of lists as applied to write.table()). I chose to move on without fixing this step as it seems 
relatively unnessecary given we are already using coded ids for the subjects anyway.

