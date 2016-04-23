# Anomalous Prescribing Detection

### Drug classification

We found that the drug name supplied by CMS (the data source) in the prescription data set was not exactly the same as what appears in the FDA drug directory, rendering the drug directory less useful for drug classification.  Because the drugs are listed in the prescription data set as names (both by brand and generic names), other drug classification data sets, such as the World Health Organization's [ATC classification scheme] (http://apps.who.int/medicinedocs/en/d/Js4876e/6.2.html#Js4876e.6.2), are similarly difficult to link.

While this does not pose a significant problem to detecting unusual patterns in prescribing, it would be very helpful to cluster similar drugs into larger classification sets and establish prescribing patterns using those classifications.  Doing so would lessen false positive identifications that may arise from scanning prescriptions for relatively rare drugs.

We attempted a drug classification using the following methodology:

1) Build files for drug nodes and drug-link edges
  - Build a list `druglist` from the `prescriptions` table that is a set of (unique) drugs prescribed.
  - For each drug in `druglist`, query Wikipedia.
  - Using the first page hit returned by that query, scan the page and store a list of all linked page names.
  - Build a dictionary or a list of lists that contains drugs and related linked pages.
  - Write drugs to a nodes file.
  - Write drug-and-links to an edges file.
  
2) Build a file for disease nodes
  - Starting with the Wikipedia page for "Disease", build a list of linked page names.
  - For each page linked from "Disease", add to the list.
  - Write disease nodes file.
  
3) Load node files and edge file to Neo4J graph database.

4) Query Neo4J for drugs linked by particular diseases.
  - For example, Tylenol and prednison may share a link through "inflammation", as they are both anti-inflammatory drugs, but would not be expected to share a link through "fever".
