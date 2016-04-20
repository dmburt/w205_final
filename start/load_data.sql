CREATE TABLE providers (
    npi             varchar(10),
    taxonomycode    varchar(10),
    zipcode         varchar(9)
);

CREATE TABLE prescriptions (
    npi                 varchar(10),
    lastname            varchar(100),
    firstname           varchar(100),
    city                varchar(100),
    state               varchar(2),
    specialty           varchar(100),
    description_flag    varchar(1),
    drugname            varchar(100),
    genericname         varchar(100),
    benecount           int,
    claimcount          int,
    daysupply           int,
    drugcost            real
);

COPY providers FROM '/data/final/data/import/provider-import.csv' DELIMITER ',' CSV HEADER;

COPY prescriptions FROM '/data/final/data/import/prescription-import.csv' DELIMITER ',' CSV HEADER;
