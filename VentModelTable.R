#this script is to query the MIMICII labevents table for the ventmodel project 
#install and load required packages 

install.packages("sqldf")
install.packages("gsubfn")
install.packages("R.utils")

library(R.utils)
library(gsubfn)
library(proto)
library(RSQLite)
library(sqldf)
library(tidyr)
library(plyr)

#read in labevents table 


labevents= read.csv("LABEVENTS.csv")

head(labevents)


#subset data for only needed lab values

labevents= subset(labevents, ITEMID ==50803| ITEMID ==50813| ITEMID == 50815| ITEMID ==5081
                  | ITEMID ==50817| ITEMID ==50818| ITEMID ==50820| ITEMID ==50819| ITEMID ==50821
                  | ITEMID ==50826| ITEMID ==224690| ITEMID ==615| ITEMID == 50816| ITEMID == 50800)
                    


#convert from long to wide format 

labevents2 <- spread(labevents, ITEMID,VALUENUM)

#remove uncecessary columns 
labevents$VALUE = NULL
labevents$VALUEUOM = NULL
labevents$FLAG = NULL


#rename columns 
VentModelIII$BICARB = VentModelIII$`50803`
VentModelIII$`50803` = NULL

head(VentModelIII)

VentModelIII$

labevents$LACTATE = labevents$`50813`
labevents$`50813` = NULL


labevents$FIO2 = labevents$`50816`
labevents$`50816` = NULL


labevents$SO2 = labevents$`50817`
labevents$`50817`= NULL

labevents$PEEP = labevents$`50819` 
labevents$`50819` = NULL

labevents$PH = labevents$`50820`
labevents$`50820` = NULL

labevents$PO2 = labevents$`50821`
labevents$`50821` = NULL

VentModelIII$tidalvolume = labevents$`50826`
VentModelIII$`50826` = NULL

labevents$PCO2 = labevents$`50818`
labevents$`50818` = NULL

head(labevents)
labevents$`50800`= labevents$specimen
labevents$`50815`= labevents$flow

labevents$flow


labevents$HADM_ID

#Merge with outcome data

head(outcomes2)
head(labevents2)


VentModelIII= merge(x = outcomes2, y =labevents2, by.x = 'subject_id', by.y = "SUBJECT_ID", all = TRUE)

head(VentModelIII)




# NEED RESPIRATORY RATE AND PLATEAU

##extract plateau pressures and respiratory rate from chartevents table
gunzip("CHARTEVENTS.csv.gz")
chartevents= read.csv("CHARTEVENTS.CSV")
head(chartevents)

# ELIMINATE VBG

summary(ventmodel$specimen)

Ventmodel= subset(ventmodel, specimen == "art") #check summary report prior to execution  

# MODIFY RAM USAGE IN R

memory.limit()

?memory.limit

memory.limit(size = 10000)


memory.limit()




#add predicted body weight column 
if (VentModelIII$gender == 'M') {
  VentModelIII$PBW =50 + 0.91*(VentModelIII$height - 152.4)
} 



if (VentModelIII$gender == 'F') {
  VentModelIII$PBW =45.5 + 0.91*(VentModelIII$height - 152.4)
} 



#exclude patients with vt outside of 4 to 8 ml/kg
VentModelIII$tidalvolume = labevents$`50826`
VentModelIII$`50826` = NULL

VentModelIV = subset(VentModelIII, `50826` >(3.9*VentModelIII$PBW) & (< 8.1*VentModelIII$PBW))


VentModelIII$gender
