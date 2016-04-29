#!/bin/bash

rm -rf /data/final/data/import
mkdir /data/final/data/import

head -20000 /data/final/data/npidata_20050523-20160410.csv > /data/final/data/import/provider-mini.csv
head -20000 /data/final/data/PARTD_PRESCRIBER_PUF_NPI_DRUG_13.tab > /data/final/data/import/prescription-mini.tab

# National prescription data provided by CMS as an Excel file.
# This conversion utility produces a CSV file from the Excel source.
wait && python convert_ntl_rx.py /data/final/data/PartD_Prescriber_PUF_Drug_Ntl_13.xlsx
cp /data/final/data/PartD_Prescriber_PUF_Drug_Ntl_13.csv /data/final/data/import/prescription-natl.csv

# Provider file is encoded in UTF-8, but petl library expects ASCII.
# This utility will do the conversion, creating a new copy with "_ascii" in the file name.
wait && python convert_utf_ascii.py /data/final/data/import/provider-mini.csv
#wait && python convert_utf_ascii.py /data/final/data/import/provider-import.csv

wait && python apd_etl.py


