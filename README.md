# Anomalous Prescribing Detection
## W205 Final Project by D. M. Burt and J. Luo


### Description of the project

__PROBLEM__

* Prescription drugs accounted for about 9 percent
of national health expenditure in the U.S. in 2013.
* A major concern is that some prescribing patterns
in health care lead to unnecessary cost and health
outcomes burdens.

CMS has recently changed its position for release
of physician-level prescribing data for public use.
Using this physician-level prescription information
in concert with the NPPES Physician Registry, we
are finding unexpected prescribing patterns among
physicians, based on prescriptions and costs per
person.

__SOLUTION__

* CMS has recently changed its position for release
of physician-level prescribing data for public use.
* Using this physician-level prescription information
in concert with the NPPES Physician Registry, we
are finding unexpected prescribing patterns among
physicians, based on prescriptions and costs per
person.

__DATA SETS__

* CMS Part D Prescriber PUF, 2013
  - Prescriptions, units, days supply, and costs by physician and drug
  - 2.7GB; 23M lines
* CMS Part D Prescriber National Summary
  - Prescriptions, units, and costs by drug aggregated to a national level
  - 3K lines
* National Plan and Provider Enumeration System (NPPES)
  - Office location and specialty (credential) by physician
  - 5.7GB; 4.8M lines

__ETL / CLEANUP__

* CMS Part D Prescriber PUF, 2013
  - Missing values: requires imputation
  - Non-numeric values in numeric fields
* CMS Part D Prescriber National Summary
  - Excel: requires conversion to CSV
* National Plan and Provider Enumeration System (NPPES)
  - Over 200 fields: requires extraction of key attributes

__ROADMAP / FUTURE DEVELOPMENT__

* Larger data volume and velocity
  - Implement system as a stream reader.
  - Recompute specialty aggregations as data cubes.
* Aggregate drugs to therapeutic classes
  - The drugs in the data set are very specific.
  - Grouping similar drugs together could help establish patterns.
  - This can be done using a graph database solution (see _devel folder).
  

### Instructions for setup (using UCB W205 Spring 2016 Standard AMI):

Within /start directory, run:
`00_setup_environment.sh
01_get_data.sh
02_prep_data.sh
03_load_data.sh`

Within /process directory, run:
`04_populate_calc_fields.sh
05_impute_missing_values.sh
06_specialty_rollup.sh`



