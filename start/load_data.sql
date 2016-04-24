CREATE TABLE providers (
    npi             varchar(10),
    taxonomycode    varchar(10),
    zipcode         varchar(10)
);

CREATE TABLE prescriptions (
    npi   		varchar(10),
    lastname    	varchar(100),    
    firstname       	varchar(100),
    city            	varchar(100),
    state    		varchar(2),    
    specialty       	varchar(100),
    description_flag    varchar(1),
    drugname    	varchar(100),    
    genericname         varchar(100),
    benecount 		int,
    claimcount 		int,
    daysupply 		int,
    drugcost 		real,
    claimsperbene       real DEFAULT 0.0,
    costperbene         real DEFAULT 0.0,
    daysperclaim        real DEFAULT 0.0,
    daysperclaimperbene real DEFAULT 0.0
);



COPY providers FROM '/data/final/data/import/provider-import.csv' DELIMITER ',' CSV HEADER;

COPY prescriptions
(
    npi,
    lastname ,   
    firstname,
    city,
    state, 
    specialty,
    description_flag,
    drugname,
    genericname,
    benecount,
    claimcount,
    daysupply,
    drugcost
)
FROM '/data/final/data/import/prescription-import.csv' DELIMITER ',' CSV HEADER;


