import petl as etl


provider_data_file = "/data/final/data/import/provider-mini.csv"
provider_import_file = "/data/final/data/import/provider-import.csv"

pres_data_file = "/data/final/data/import/prescription-mini.tab"
pres_data_file_csv = "/data/final/data/import/prescription-mini.csv"
pres_import_file = "/data/final/data/import/prescription-import.csv"


##Process provider data file
#Load the table
table1 = etl.fromcsv(provider_data_file)

# Select the colums
table2 = etl.cut(table1, 'NPI','Healthcare Provider Taxonomy Code_1','Provider Business Practice Location Address Postal Code')

# Save to import file
etl.tocsv(table2, provider_import_file)


##Process prescription data file
#Load tab file and save as csv first
table_tab = etl.fromtsv(pres_data_file)
etl.tocsv(table_tab,pres_data_file_csv)
table_csv = etl.fromcsv(pres_data_file_csv)

#Select the columns
extracted = etl.cut(table_csv,'NPI','NPPES_PROVIDER_LAST_ORG_NAME','NPPES_PROVIDER_FIRST_NAME', \
'NPPES_PROVIDER_CITY','NPPES_PROVIDER_STATE','SPECIALTY_DESC','DESCRIPTION_FLAG', \
'DRUG_NAME','GENERIC_NAME','BENE_COUNT','TOTAL_CLAIM_COUNT','TOTAL_DAY_SUPPLY','TOTAL_DRUG_COST')

#Save to import file
etl.tocsv(extracted,pres_import_file)


##Process prescription national data file
#Load the table
table3 = etl.fromcsv(pres_natl_file)

# Select the columns
table4 = etl.cut(table3, 'drug_name','bene_count','prescriber_count','total_claim_count','total_drug_cost')

# Save to import file
etl.tocsv(table4, pres_natl_import_file)

