#!/bin/bash

CREATE INDEX idx_specialty_drug ON prescriptions (specialty, drugname, genericname);
 
CREATE TABLE AS SELECT specialty, drugname, genericname, sum(benecount) as benecount, sum(claimcount) as claimcount, sum(daysupply) as daysupply, sum(drugcost) as drugcost, 0.0 as claimsperbene, 0.0 as costperbene, 0.0 as daysperclaim, 0.0 as sd_claimsperbene, 0.0 as sd_costperbene, 0.0 as sd_daysperclaim from prescriptions group by specialty, drugname, genericname;
