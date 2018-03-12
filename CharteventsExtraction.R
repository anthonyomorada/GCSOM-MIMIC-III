#set your working directory using you address

setwd("C:/Users/garri/Desktop/R scripts")

#read in dataframe
chartevents= read.csv("CHARTEVENTS.CSV")

#check data format 
head(chartevents) 


#subset data by relevant documentation  
chartevents= subset(labevents, ITEMID ==618| ITEMID ==615|ITEMID == 543|ITEMID == 220210| ITEMID ==  224690)


# code ID for documentation
# RESPIRATORY RATE
			  ##618,--	Respiratory Rate
			  ##615,--	Resp Rate (Total)
			  ##220210,--	Respiratory Rate
			  ##224690, --	Respiratory Rate (Total)
			  ## 543--      --Plateau Pressures

#convert from long to wide format
chartevents <- spread(chartevents, ITEMID,VALUENUM)

#check data format 
head(chartevents) 
