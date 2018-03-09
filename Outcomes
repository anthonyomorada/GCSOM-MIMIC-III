#this script creates a dataframe from the MIMICIII dattabase that includes outcome data for all patients
#this script requires the following CSV files: "Vendays.csv", "OutcomeData.CSV"

#read in dataframe for outcome data and and ventiltor days
ventdays = read.csv("VenDays.csv")

outcomes = read.csv("OutcomeData.csv")

#perform complete outer merge of both dataframes 
outcomes2= merge(x = ventdays, y = outcomes, by = "icustay_id", all = TRUE)

#check columns in new dataframe
head(outcomes2)
