# Anomalous Prescribing Detection
## W205 Final Project by D. M. Burt and J. Luo

#### 04_populate_calc_fields.sh  
At this stage, we begin populating the calculated fields:
* claims / beneficiary
* cost / beneficiary
* days supply / claim

These will be used to provide some normalization to this provider-aggregated data, and also tells us what we could expect on any particular claim.

#### 05_impute_missing_values.sh
Unfortunately, a fair number of rows in the prescription data set have no beneficiary count.  The original data set from CMS contained asterisks in those fields, which we removed during ETL (leaving `NULL` values after the load to Postgres), and represent a number below CMS' privacy-related lower bound for data dissemination.  However, this information is important, especially as we will need to aggregate the data in the prescription table to a provider specialty level.  We have missing values, but which methodology for handling them would be appropriate?
* __Set to zero__
  - There are several issues with this, including division by zero errors when calculating X-per-beneficiary, as well as understating the impact of these prescriptions in the specialty-level aggregation.
* __Leave as null__
  - This will leave null X-per-beneficary values, which will lead to dropped rows in later steps when we try to discover unusual prescribing.
* __Fill down__
  - Pulling a number of beneficiaries from another, unrelated row would be entirely inappropriate.  For this system to work, we need reliable estimates.
* __Impute based on average__
  - __This is the methodology we have chosen__.  CMS provided a national-level prescribing summary that we can use to impute missing values.  If we calculate a national average claims-per-beneficiary number for a particular drug, then it isn't unreasonable to assume--in the absence of other information--that any particular physician with a missing number of beneficiaries may have a similar number of claims per beneficiary.  And because we have a number of claims for the provider with a `NULL` beneficiary count, we can use the national average claims/bene and the number of claims prescribed by a physician to estimate the number of beneficiaries she may have prescribed a particular drug to.

SAMPLE BEFORE IMPUTATION (Claims per Beneficiary is from national average)
![Sample of rows with missing values before imputation](https://raw.githubusercontent.com/dmburt/w205_final/master/documentation/images/Impute%20Missing%20Values%20-%20Step%201.png)

SAMPLE AFTER IMPUTATION
![Sample of rows with missing values before imputation](https://raw.githubusercontent.com/dmburt/w205_final/master/documentation/images/Impute%20Missing%20Values%20-%20Step%202.png)

