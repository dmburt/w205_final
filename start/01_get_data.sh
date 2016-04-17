#!/bin/bash

green='\033[0;32m'
nocolor='\033[0m'

### ..::: Get data from Internet sources

cd /data
mkdir final
mkdir final/data
cd final/data


## ...::: Prescription data
#         Medicare Provider Utilization and Payment Data: Part D Prescriber
#         Source: Centers for Medicare and Medicaid Services

printf "\n${green}Getting: Medicare Provider Utilization and Payment Data\nExpected size: 489 MB (zipped), 2.7 GB (unzipped)${nocolor}\n"
wait && wget "http://download.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Downloads/PartD_Prescriber_PUF_NPI_DRUG_13.zip"
wait && unzip PartD_Prescriber_PUF_NPI_DRUG_13.zip


## ...::: Provider information
#         National Plan and Provider Enumeration System (NPPES)
#         Source: Centers for Medicare and Medicaid Services

printf  "\n${green}Getting: National Plan and Provider Enumeration System Data\nExpected size: ~600 MB (zipped), ~5 GB (unzipped)${nocolor}\n"
wait && wget "http://download.cms.gov/nppes/NPPES_Data_Dissemination_Apr_2016.zip"
wait && unzip NPPES_Data_Dissemination_Apr_2016.zip


## ...::: Drug information
#         National Drug Code Directory
#         Source: Food and Drug Administration

printf "\n${green}Getting: National Drug Code Directory\nExpected size: 20 MB (zipped), 33 MB (unzipped)${nocolor}\n"
wait && wget "http://www.accessdata.fda.gov/cder/ndc.zip"
wait && unzip ndc.zip
