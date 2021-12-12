---
title: Crawl, import and load data or ingest documents into the search index (Connectors & ETL)
authors:
    - Markus Mandalka
---

# Crawl, import and load data or ingest documents into the search index (Connectors & ETL)


## Crawler, connectors, data importer, data integration, document ingestion, transformation and converter



We provide some light weight import / index tools / connectors i.e. for files and directories based on our [open source framework for data integration, data extraction, data analysis and data enrichment](../../../etl).

Since our open architecture is based on Solr with its open REST-API for which there are many powerful libraries for all programming languages and open standards for linked data and semantic web, you can use all other powerful frameworks, programming languages or services for crawling, ETL or web scraping which are interoperable with Solr or some open standards for databases (f.e. SQL) or data integration (f.e. RDF).

For most cases there are many ready to use connectors for standard imports yet:

## [Connector Files (filesystem and directories)](../../../connector/files)


Crawl and index directories, files and documents into Solr. Including automatic textrecognition (OCR) support for images and grafical formats included in PDF documents (i.e. scans)

[Learn more](../../../connector/files) ...


## [Connector RSS (RSS-Feed)](../../../connector/rss)


Indexes Webpages from a RSS-Newsfeed

[Learn more](../../../connector/rss) ...

## [Connector Web (HTTP)](../../../connector/web)


Crawl and index Websites into Solr index.

[Learn more](../../../connector/web) ...


## [Connector DB (SQL, MySQL, Postgresql)](../../../connector/db)


Index SQL databases like MySQL or PostgreSQL into Solr.

[Learn more](../../../connector/db) ...



## [Connector Wiki (Mediawiki)](../../../connector/wiki)


Index Wikis like Mediawiki into Solr.

[Learn more](../../../connector/wiki) ...


## [Connector E-Mail (IMAP)](../../../connector/email)


Index E-Mails into the search index.

[Learn more](../../../connector/email) ...



## [Connector Scraper (Web scraping)](../../../connector/scraper)


ETL and webscraping framework to crawl, extract, transform and load structured data from websites (scraping).

[Learn more](../../../connector/scraper) ...


## Connector Universal (ManifoldCF)


[Apache Manifold Connector Framework (ManifoldCF)](http://manifoldcf.apache.org/) imports many different formats and datastructures into Solr or Elastic search.

[Learn more](http://manifoldcf.apache.org/release/trunk/en_US/end-user-documentation.html) ...

## Other data integration or extract, transformation and load frameworks for data warehouses (ETL)



There are powerful open source ETL frameworks (extraction, transformation and load) for data integration, mapping, filtering and transformation for data warehousing with powerful features and graphical user interfaces (GUI).

![](../../../screenshots/spoon_job.png)
![](../../../screenshots/spoon_transformation.png)

If there is an output plugin for Solr or if the tools can export data in a format which can be imported by one of the connectors, you can use such frameworks to integrate, transform or enrich and load (index) data into the search engine.

Learn more about [data integration and extract, transform, load (ETL)](../../../etl) ...
