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



## [Connector Scraper (Web scraping)](../../../connector/scraper)


ETL and webscraping framework to crawl, extract, transform and load structured data from websites (scraping).

[Learn more](../../../connector/scraper) ...

