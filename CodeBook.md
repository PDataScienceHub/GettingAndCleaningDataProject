# CodeBook for Getting and Cleaning Data Coursera Project

README accompanying this code book contains the goal and overall information on this project along with details of the accompanying R script.

# Study Design
* The raw data for this project was obtained from the 
**Human Activity Recognition Using Smartphones** experiment. This data is available at following site
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
* The raw data contained data for training and test subjects seperately. In addition, each of the training and test data set had X (values for feature variables), y (activity values) and subject ids for each record in a seperate table. So, first the X, y and subject values were merged into one table. This generated one  table each for training and test data set. Next, these two tables were merged in one table.
* The above merged data had values for around 561 variables.  Only the mean and standard deviation for each mesaurement was extracted from this data set.
* The variable names and the y values in the above extracted data set were not descriptive. The y values were converted from a numeric vector to a factor with descriptive levels (e.g. walking, sitting). The variable names were made more user friendly by removing "()" and "-", changing to lower case, expanding abbreviated words (e.g. replacing "acc" with "acceleration"), removing duplicates (e.g. replacing "bodybody" with "body").

# Summary Information
Once the data was cleaned and extracted as described above, a tidy data set was created with the average of each variable for each activity and each subject.

# Information on Variables
The above mentioned tidy data set contains following 81 variables.
* **subjectid:** Identity of the subject (volunteer) performing the experiment. Its range is from 1 to 30.
* **activity:** Activity performed. This can be one of {walking, walksingupstairs, walkingdownstairs, sitting, standing, laying}
* **Average of each of following 79 mesurement variables for each activity and each subject**.

## Explanation of the Measurement Variables in the Tidy Data. 
* No other processing (other than the one mentioned above) was done on these variables. README and the features_info file accompanying the raw data (see above link) contains detailed information about the variables. That information is not repeated here. This code book provides high level explanation on the variables, primarily how to interpret various variable names.
* All variables are normalized and bounded within [-1,1].
* All variables that have "acceleration" in their name contain the mesurements from an accelerometer and are in standard gravity units 'g'.
* All variables that have "body" in their name contain the body measurements and all variables that have "gravity" in their name contain the gravity measurements.
* All variables that have "gyro" in their name contain mesurements from a gyroscope and have units radians/second.
* All variables that have "time" in their name contain time domain signal and those with "frequency" in their name contain frequency domain signals.
* Experiment captured data along 3 axis - X, Y and Z. All variables with either "x", "y" or "z" at the end of their name denote the axis along which the measurement was taken.
* All variables that have "mean" in their name contain mean of the mesurements and those with "standard deviation" in their name contain standard deviation values.
* All variables that have "jerk" in their name contain the Jerk values and those with "magnitude" in their name contain magnitude values calculated using the Euclidean norm.

## List of the Measurement Variables in the Tidy Data.
 [1] "timebodyaccelerationmeanx"                              
 [2] "timebodyaccelerationmeany"                              
 [3] "timebodyaccelerationmeanz"                              
 [4] "timegravityaccelerationmeanx"                           
 [5] "timegravityaccelerationmeany"                           
 [6] "timegravityaccelerationmeanz"                           
 [7] "timebodyaccelerationjerkmeanx"                          
 [8] "timebodyaccelerationjerkmeany"                          
 [9] "timebodyaccelerationjerkmeanz"                          
[10] "timebodygyromeanx"                                      
[11] "timebodygyromeany"                                      
[12] "timebodygyromeanz"                                      
[13] "timebodygyrojerkmeanx"                                  
[14] "timebodygyrojerkmeany"                                  
[15] "timebodygyrojerkmeanz"                                  
[16] "timebodyaccelerationmagnitudemean"                      
[17] "timegravityaccelerationmagnitudemean"                   
[18] "timebodyaccelerationjerkmagnitudemean"                  
[19] "timebodygyromagnitudemean"                              
[20] "timebodygyrojerkmagnitudemean"                          
[21] "frequencybodyaccelerationmeanx"                         
[22] "frequencybodyaccelerationmeany"                         
[23] "frequencybodyaccelerationmeanz"                         
[24] "frequencybodyaccelerationmeanfreqx"                     
[25] "frequencybodyaccelerationmeanfreqy"                     
[26] "frequencybodyaccelerationmeanfreqz"                     
[27] "frequencybodyaccelerationjerkmeanx"                     
[28] "frequencybodyaccelerationjerkmeany"                     
[29] "frequencybodyaccelerationjerkmeanz"                     
[30] "frequencybodyaccelerationjerkmeanfreqx"                 
[31] "frequencybodyaccelerationjerkmeanfreqy"                 
[32] "frequencybodyaccelerationjerkmeanfreqz"                 
[33] "frequencybodygyromeanx"                                 
[34] "frequencybodygyromeany"                                 
[35] "frequencybodygyromeanz"                                 
[36] "frequencybodygyromeanfreqx"                             
[37] "frequencybodygyromeanfreqy"                             
[38] "frequencybodygyromeanfreqz"                             
[39] "frequencybodyaccelerationmagnitudemean"                 
[40] "frequencybodyaccelerationmagnitudemeanfreq"             
[41] "frequencybodyaccelerationjerkmagnitudemean"             
[42] "frequencybodyaccelerationjerkmagnitudemeanfreq"         
[43] "frequencybodygyromagnitudemean"                         
[44] "frequencybodygyromagnitudemeanfreq"                     
[45] "frequencybodygyrojerkmagnitudemean"                     
[46] "frequencybodygyrojerkmagnitudemeanfreq"                 
[47] "timebodyaccelerationstandarddeviationx"                 
[48] "timebodyaccelerationstandarddeviationy"                 
[49] "timebodyaccelerationstandarddeviationz"                 
[50] "timegravityaccelerationstandarddeviationx"              
[51] "timegravityaccelerationstandarddeviationy"              
[52] "timegravityaccelerationstandarddeviationz"              
[53] "timebodyaccelerationjerkstandarddeviationx"             
[54] "timebodyaccelerationjerkstandarddeviationy"             
[55] "timebodyaccelerationjerkstandarddeviationz"             
[56] "timebodygyrostandarddeviationx"                         
[57] "timebodygyrostandarddeviationy"                         
[58] "timebodygyrostandarddeviationz"                         
[59] "timebodygyrojerkstandarddeviationx"                     
[60] "timebodygyrojerkstandarddeviationy"                     
[61] "timebodygyrojerkstandarddeviationz"                     
[62] "timebodyaccelerationmagnitudestandarddeviation"         
[63] "timegravityaccelerationmagnitudestandarddeviation"      
[64] "timebodyaccelerationjerkmagnitudestandarddeviation"     
[65] "timebodygyromagnitudestandarddeviation"                 
[66] "timebodygyrojerkmagnitudestandarddeviation"             
[67] "frequencybodyaccelerationstandarddeviationx"            
[68] "frequencybodyaccelerationstandarddeviationy"            
[69] "frequencybodyaccelerationstandarddeviationz"            
[70] "frequencybodyaccelerationjerkstandarddeviationx"        
[71] "frequencybodyaccelerationjerkstandarddeviationy"        
[72] "frequencybodyaccelerationjerkstandarddeviationz"        
[73] "frequencybodygyrostandarddeviationx"                    
[74] "frequencybodygyrostandarddeviationy"                    
[75] "frequencybodygyrostandarddeviationz"                    
[76] "frequencybodyaccelerationmagnitudestandarddeviation"    
[77] "frequencybodyaccelerationjerkmagnitudestandarddeviation"

[78] "frequencybodygyromagnitudestandarddeviation"            
[79] "frequencybodygyrojerkmagnitudestandarddeviation"
