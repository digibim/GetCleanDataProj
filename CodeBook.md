Codebook for summary of UCI HAR dataset
========================================================

This project uses data obtained from the "Human Activity Recognition Using Smartphones" dataset, referenced below:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data was collected from 30 individuals, each of whom performed 6 different activities:
* walking
* walking upstairs
* walking downstairs
* sitting
* standing
* laying

Each individual was wearing a Samsung Galaxy S II smartphone, which recorded information about their movements and positioning.

The original dataset contains 561 variables, but only the 79 involving means or standard deviations are used here.

There are 10,299 data points for each variable, which were averaged across within each of the 180 conditions (30 subjects by 6 activities). The summarized data was then exported into a text file named "tidyavefile.txt".

tidyavefile.txt has 81 columns; the first two are "subjects" and "activitynames", which identify the 180 condition combinations. The remaining 79 columns are the means of the 79 HAR variables.

The 79 variables are:
tbodyacc{mean or std}{x, y,or z} - accelerometer data in 3 spatial dimensions
tgravityacc{mean or std}{x, y,or z} - separated componant of gravity
tbodyaccjerk{mean or std}{x, y,or z} - derivation to determine instantaneous forces
tbodygyro{mean or std}{x, y,or z} - gyroscopic data in 3 spatial dimensions
tbodygyrojerk{mean or std}{x, y,or z} - derivation for jerk signal
tbodyaccmag{mean or std} - accelerometer magnitude of signals
tgravityaccmag{mean or std} - gravity componant of accelerometer magnitude
tbodyaccjerkmag{mean or std} - magnitude of accelerometer jerk signals
tbodygyromag{mean or std} - gyroscopic magnitude
tbodygyrojerkmag{mean or std} - gyroscopic jerk magnitude
fbodyacc{mean or std}{x, y,or z} - "f" variables contain FFT transfomation of signals...
fbodyaccmeanfreq{x, y,or z} - 
fbodyaccjerk{mean or std}{x, y,or z} - 
fbodyaccjerkmeanfreq{x, y,or z} - 
fbodygyro{mean or std}{x, y,or z} - 
fbodygyromeanfreq{x, y,or z} - 
fbodyaccmag{mean or std} - 
fbodyaccmagmeanfreq - 
fbodybodyaccjerkmag{mean or std} - 
fbodybodyaccjerkmagmeanfreq - 
fbodybodygyromag{mean or std} - 
fbodybodygyromagmeanfreq - 
fbodybodygyrojerkmag{mean or std} - 
fbodybodygyrojerkmagmeanfreq - 
