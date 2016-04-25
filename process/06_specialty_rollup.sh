#!/bin/bash

psql -h localhost -U postgres -d apd -c "CREATE INDEX idx_specialty_drug ON prescriptions (specialty, drugname, genericname);"
 
psql -h localhost -U postgres -d apd -c "CREATE TABLE specialty_drug_agg AS SELECT specialty, drugname, genericname, sum(benecount) as benecount, sum(claimcount) as claimcount, sum(daysupply) as daysupply, sum(drugcost) as drugcost, 0.0 as claimsperbene, 0.0 as costperbene, 0.0 as daysperclaim, abs(avg(claimcount^2/benecount^2)-(avg(claimcount/benecount))^2)^0.5 as sd_claimsperbene, abs(avg(drugcost^2/benecount^2)-(avg(drugcost/benecount))^2)^0.5 as sd_costperbene, abs(avg(daysupply^2/claimcount^2)-(avg(daysupply/claimcount))^2)^0.5 as sd_daysperclaim from prescriptions group by specialty, drugname, genericname;"

psql -h localhost -U postgres -d apd -c "UPDATE specialty_drug_agg SET claimsperbene = 1.0 * claimcount / benecount, costperbene = 1.0 * drugcost / benecount, daysperclaim = 1.0 * daysupply / claimcount;"

psql -h localhost -U postgres -d apd -c "CREATE index pk_specialty_drug_agg ON specialty_drug_agg (specialty, drugname, genericname);"

