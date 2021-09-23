#Put all the files in a folder
#Set the working directory in R-console of the folder using #setwd()
#Install the "Biostring" package of Bioconductor
#library(Biostrings)
# Read the dataset of positive, negative and test splice site datasets
# The example dataset of positive, negative and test sequences are also provided.
# readDNAStringSet("example_positive_donor_data.txt")

#Computing of compositional and structural features

# Run the command provided in "comp_str_feature.R"
#Keep in mind to supply the sequence data to the function readDNAStrinSet()
#A file in the name "comp_structure_feat.txt" will be generated that comprises the compositional and structural features


#Computing sequence-derived features

# Run the command provided in "seq_derive_feature.R"
#Keep in mind to supply the sequence data to the function readDNAStrinSet()
#The file in the name "FDTF_feat.txt","MM1_feat.txt","MM2_feat.txt","Bayes_feat.txt" will be generated that comprises the FDTF, MM1, MM2 and Bayes encoded features respectively

#For prediction using support vector machine
#install the package "e1071"
# Read positive and negative encoded datasets
# Run the function svm() available in the packge.
# If you are facing any problem in generating the features or predicting using SVM, kindly write a mail to meherprabin@yahoo.com

