
source("str_function.R")
library(Biostrings)
seq_data<- readDNAStringSet("sequence_data.txt")# sequence dataset to be supplied by the user (Positive, negative or test dataset)
loplist <- as.character(read.table("str_loop.txt")[,1])
#__________________________________________#
#nucleotide and di-nucleotide frequency
#______________________________________________#

nuf <- oligonucleotideFrequency(seq_data, width=1, as.prob=TRUE)
dinuf <- oligonucleotideFrequency(seq_data, width=2, as.prob=TRUE)

sq <- as.character(as.character(seq_data))
sq_len <- nchar(sq)# sequence length

GC_content <- as.numeric(sapply(sq, my_gc))# GC content in the sequence
GC_ratio <- as.numeric(sapply(sq, my_GbyC))# G/C ratio in the sequence


sstr <- sapply(sq, sec_str)#predicting secondary structure
LP <- sapply(sstr ,function(s)sapply(loplist,function(m)grepl(m,s, fixed=TRUE)*1))
nLp <- as.numeric(apply(LP, 2, sum))# number of loop in the secondary structure


nTm <- as.numeric(sapply(sstr[1:5], stm))# number of stems

energy_feat <- t(sapply(sq, energy))
mfe <- energy_feat[,1]
enfe <- energy_feat[,2]
enfrq <- energy_feat[,3]
enfrq[is.na(enfrq)]<-0
endvt <- energy_feat[,4]
mfe_ind1 <- mfe/GC_content 
diff_mfe_efe <- abs(mfe-enfe)/sq_len
adj_mfe <- mfe/sq_len
mfe_ind2 <- adj_mfe/nTm
mfe_ind2[is.na(mfe_ind2)]<-0
mfe_ind3 <- adj_mfe/nLp
mfe_ind3[is.na(mfe_ind3)]<-0
mfe_ind4 <- adj_mfe/GC_content

comp_structure_feat <- cbind(round(cbind(nuf, dinuf, GC_content, GC_ratio),4), mfe, enfe, mfe_ind1, diff_mfe_efe, adj_mfe,mfe_ind2, mfe_ind3, mfe_ind4, enfrq, endvt) # compositional and strucural features

write.table(comp_structure_feat, "comp_structure_feat.txt", sep="\t", row.names=FALSE, col.names=FALSE)












