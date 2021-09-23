#positive_class: splice site dataset 
#negative_class: non-splice dataset
#test_seq: dataset to be encoded (it may be positive set, negative set or test set)
#All the sequence dataset must be read with readDNAStringSet command available in Biostring package#

#readDNAStringSet("positive.txt")
#readDNAStringSet("negative.txt")
#readDNAStringSet("test.txt")

library(Biostrings)

source("FDTF.Feature.R")
fdtf <- PN.Fdtf.Feature(positive_class, negative_class, test_seq) #FDTF features

write.table(fdtf, "FDTF_feat.txt", row.names=FALSE, col.names=FALSE, sep="\t")

source("MM1.Feature.R")
mm1 <- MM1.Feature(positive_class, test_seq) # MM1 features

write.table(mm1, "MM1_feat.txt", row.names=FALSE, col.names=FALSE, sep="\t")

source("MM2.Feature.R")
mm2 <- MM2.Feature(positive_class, test_seq) #MM2 features

write.table(mm2, "MM2_feat.txt", row.names=FALSE, col.names=FALSE, sep="\t")

source("Bayes.Feature.R")
bayes <- Bayes.Feature(positive_class, negative_class, test_seq) #Bayes features

write.table(bayes, "Bayes_feat.txt", row.names=FALSE, col.names=FALSE, sep="\t")

