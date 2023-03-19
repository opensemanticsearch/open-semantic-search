---
title: Full text search, faceted search & textmining in a database (SQL DB)  
authors:  
    - Markus Mandalka
---

# Full text search, faceted search & textmining in a database (SQL DB)


## Connectors for Relational Database Management Systems (RDBMS) & Structured Query Lanaguage (SQL) to Solr or Elastic Search


To be able to use simple and powerful [search user interfaces (UI)](../../doc/search) for [full text search](../../doc/search), faceted search, semantic search and ontology or thesaurus based [text mining](../../doc/analytics/textmining) research tools (on structured data from fields of a SQL database), import their tables to the search index:

## Index SQL databases like MySQL or Postgresql


There are multiple ways (open source connectors) for importing SQL databases like MySQL, MariaDB, PostgreSQL and other SQL databases based on Structured Query Language (SQL) or supported by Open Database Connectivity (ODBC) or Java DataBase Connectivity (JDBC) to an Apache Solr index:

## Import SQL database to Solr search index


Free Software for indexing SQL to Apache Solr:
* [Apache Manifold JDBC Connector](http://manifoldcf.apache.org/release/trunk/en_US/end-user-documentation.html#jdbcrepository)
* [Apache Nifi](https://nifi.apache.org/) - Read from `ExecuteSQL` and write to Solr index
* Setup the built in [RDBMS data import handler](http://wiki.apache.org/solr/DataImportHandler#Usage_with_RDBMS) for your database
* Export your database to a CSV format and use the build in the CSV import of Solr
* Write a short Python script for database import based on [Open Semantic ETL](../../etl) with a concrete SQL query, write the columns to the `data` variable (data type is a Python dictionary i.e. `data['columnname'] = columnvalue`) and export/write it to the index by calling `etl.process(data=data)`
* Other [Extract Transform Load (ETL) - Frameworks](../../etl) like Talend Open Studio


## Import SQL database to Elastic Search index


Free Software for indexing SQL to Elastic Search:
* [Apache Manifold JDBC Connector](http://manifoldcf.apache.org/release/trunk/en_US/end-user-documentation.html#jdbcrepository)
* [Apache Nifi](https://nifi.apache.org/) - Read from `ExecuteSQL` and write to Elastic Search index
* [Elastic search JDBC Importer](https://github.com/jprante/elasticsearch-jdbc)
* Export your database to a CSV format and use the build in CSV import of Solr
* Write a short Python script for database import based on [Open Semantic ETL](../../etl) with a concrete SQL query, write the columns to the `data` variable (data type is a Python dictionary i.e. `data['columnname'] = columnvalue`) and export/write it to the index by calling `etl.process(data=data)`
* Other [Extract Transform Load (ETL) - Frameworks](../../etl) like Talend Open Studio


