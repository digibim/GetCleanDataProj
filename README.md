README file for run_analysis.R script to summarize the UCI HAR dataset
========================================================

run_analysis.R assumes that the working directory is the UCI HAR Dataset folder, and does not check ahead of time for the existence of files or directories, so you will need to unzip the HAR folder and setwd() appropriately. See the CodeBook markdown file for more information about the data itself.

run_analysis.R reads in all of the relevant HAR files and combines the data into a single dataframe. Appropriate labes are added by reading and sanitizing the features file. Only the variables containing the substrings "mean" or "std" are retained. The activity names are also read in and merged with the dataframe in order to provide meaningful identifiers. The 79 retained variables are averaged for each possible combination of subject and activity, and formatted in a dataframe in order to produce the output file.

The script produces R Environment variables and outputs a text file called "tidyavefile.txt". Note that the output file contains only 180 rows, but has 81 columns (2 identifier columns plus 79 response variables). Therefore, it is very wide.

Everything is produced by the single script, so you should be able to just source() it to produce the proper output.

There are two functions in the script:
* "cleanvars" strips unwanted characters from variable names
* "getaverages" aggregates the data across all variables, for all (180) combinations of subject and activity

After source()ing, there will be several intermediate variables and two final dataframes (see comments in the script for more details about the computation and the other variables):
* "finaldata" contains all of the raw HAR data for the identified (79) columns, with appropriately-named activities and meaningful variable names
* "tidyaves" is the dataframe containing means of all variables for each of the 180 possible combinations

As noted above, tidyaves has a column for each variable, so it is very wide. This dataframe is outputted to the current working directory as "tidyavefile.txt"
