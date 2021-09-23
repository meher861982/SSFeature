#_________________________________________________
#GC content
#______________________________________
my_gc<- function(s){

sz <- unlist(strsplit(s, split=""))
mg <- length(which(sz=="G"))
mc <- length(which(sz=="C"))
mg+mc
}

#____________________________
#GC ratio
#_______________________________________________
my_GbyC<- function(s){
sz <- unlist(strsplit(s, split=""))
mg <- length(which(sz=="G"))
mc <- length(which(sz=="C"))
mg/mc
}

#__________________________________________________________________#
#Calculating the number of loops #
#__________________________________________________________________#
sec_str<- function(s){
kk <- system("C:/Users/USER/Desktop/rnafold/RNAfold.exe",input=s, intern=T) # the directory of RNAFold program must be changed
st <- substr(kk[2], start=1, stop=nchar(s))
st
}


#________________________________________________________
#Computing number of stems present in the secondary structure
#__________________________________________________________________#

stm <- function(s){
sz <- unlist(strsplit(s, split=""))
mm <- as.numeric(which(sz=="("))
lm <- length(mm)
km2 <- mm[2:lm]
km1 <- mm[1:(lm-1)]
zm <- km2-km1
sum((zm>=2)*1)
}


#__________________________________________________________________#
#Computing thermodynamic feature
#___________________________________________________________________#

energy<- function(ms){
kk <- shell("C:/Users/USER/Desktop/rnafold/RNAfold.exe  -p ", input= ms, intern=TRUE) # the directory of RNAFold program must be changed

mfe <- substr(kk[2], start=(nchar(kk[1])+4), stop=(nchar(kk[1])+8))# minimum free energy
efe <- substr(kk[3], start=(nchar(kk[1])+4), stop=(nchar(kk[1])+8)) # free energy of ensemble

efrq <- substr(kk[5], start=41, stop=47) #frequency of mfe structure in ensemble

pp <- which(unlist(strsplit(kk[5], split=""))==";")
end <- substr(kk[5], start=pp+21, stop=pp+25) #ensemble diversity

as.numeric(c(mfe, efe, efrq, end))
}

