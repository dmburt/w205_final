CREATE UNIQUE INDEX pk_prescriptions_natl ON prescriptions_natl (drugname, genericname);

CREATE UNIQUE INDEX pk_providers ON providers (NPI);

CREATE UNIQUE INDEX pk_prescriptions ON prescriptions (NPI, drugname, genericname);

CREATE INDEX idx_specialty_drug ON prescriptions (specialty, drugname, genericname);
