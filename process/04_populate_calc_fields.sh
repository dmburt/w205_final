#!/bin/bash

psql -h localhost -U postgres -d apd -c "UPDATE prescriptions_natl SET claimsperbene = 1.0 * claimcount / benecount, costperbene = 1.0 * drugcost / benecount"

psql -h localhost -U postgres -d apd -c "UPDATE prescriptions SET claimsperbene = 1.0 * claimcount / benecount, costperbene = 1.0 * drugcost / benecount, daysperclaim = 1.0 * daysupply / claimcount, daysperclaimperbene = 1.0 * daysupply / claimcount / benecount"
