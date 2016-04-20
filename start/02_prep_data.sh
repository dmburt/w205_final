#!/bin/bash

rm -rf /data/final/data/import
mkdir /data/final/data/import

head -20000 /data/final/data/npidata_20050523-20160410.csv > /data/final/data/import/provider-mini.csv
head -20000 /data/final/data/PARTD_PRESCRIBER_PUF_NPI_DRUG_13.tab > /data/final/data/import/prescription-mini.tab

python apd_etl.py


