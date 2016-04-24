#!/bin/bash

psql -h localhost -U postgres -d apd -c "UPDATE prescriptions rx SET benecount = rxn.claimsperbene * rx.claimcount, claimsperbene = rxn.claimsperbene, costperbene = rxn.costperbene, daysperclaimperbene = rx.daysupply / rx.claimcount / (rxn.claimsperbene * rx.claimcount) FROM prescriptions_natl rxn WHERE rx.drugname = rxn.drugname AND rx.genericname = rxn.genericname AND rx.benecount IS NULL;"
