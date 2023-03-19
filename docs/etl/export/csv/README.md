---
title: CSV Export  
authors:  
    - Markus Mandalka
---

# CSV Export

Write data to a CSV spreadsheet, so you can import the data with other software or with Open Office Calc, Libreoffice Calc or Excel.

If you use output plugins to index your data to a search index like [Solr](../../../open-semantic-etl/export/solr) or [Elastic Search](../../../open-semantic-etl/export/elastic_search), you can read and filter the data with their powerful search APIs.

Just set the Solr result writer to CSV format by using the `wt` paramater:
`localhost:8983/solr/core1/select?q=*:*&wt=csv`