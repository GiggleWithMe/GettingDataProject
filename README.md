# GettingDataProject
A repo for Getting and Cleaning Data's course project.

##Introduction
First, thank you very much for taking the time to mark my assignment. Please, if you have time, jot down some constructive 
commentary at the end. It will be greatly appreciated.

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

