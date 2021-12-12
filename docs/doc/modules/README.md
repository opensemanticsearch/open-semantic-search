---
title: Search engine components and architecture
authors:
    - Markus Mandalka
---

# Search engine components and architecture


**Open source search engine architecture (components and modules) and processing (data integration, data analysis and data enrichment)**
# Architecture overview


## Components and Modules


* **[User Interface](../search)**: Client and user interface
	+ **Search query forms**: Search query form for full text search
	+ **Explorer and navigator**: Search with full text search and navigate (exploratory search) the index or search results with **interactive filters (facets)**
	+ **Viewers**: Parts of the UI to show different views (i.e. analytics like wordlcouds or trend charts) and previews for special formats (i.e. photos, documents, email ...)
	+ **Annotators**: Web Apps for tagging documents or CMS with forms and fields to manage meta data like tags or annotations
	+ **Search Apps**: Applications and user interfaces for search like search with lists tool or named entities manager
* **Index and search server (Solr or Elastic Search)**: Search server managing the index (indexer) and running search queries (query handler)
* **[Open Semantic ETL](../../etl "Framework for data integration, data analysis and data enrichment")**: Framework for data integration, data analysis, data enrichment and ETL (Extract, transform, load) pipelines or chains
	+ **[Connectors, importers, ingestors or crawlers](../admin/connectors)**: Import data from a data source (i.e. file system, file directory, file share, website or newsfeed)
	+ **Parsers:** *Apache Tika* to extract text and metadata from different file formats and document formats
	+ **[Data enrichment plugins and enhancer](../data_enrichment)**: Enhancing content with additional data like meta data (i.e. tagging or annotations) or analytics (i.e. OCR)
	+ **ETL Exporter** or Loader for Solr or [Elastic Search](../../etl/elasticsearch): Indexing the data to search index
* **Trigger**: Your CMS or your file system (file system monitoring) will notify the web service (API) when there is new data or when content changed, so you dont have to burn resources for recrawl often to be able to find new or changed content very soon
* **[Web services (REST-API)](../admin/rest-api)**: Available via standard network protocol HTTP and waiting until you (i.e. using the web admin interface) or another service (i.e. using the REST-API) demands actions like crawling a directory or a webpage and starting this actions
* **[Queue manager (Celery on RabbitMQ)](../admin/config/queue)**: Managing task queue and starting of text extraction, analysis, data enrichment and indexing jobs by the right balance of parallel workers
* **[Scheduler](../admin/config/scheduler)**: Managing starting of scheduled indexing jobs. This can be crontab for Cron starting the command line tools. Or you schedule (re)crawl or data import jobs with the web interface of ManifoldCF which brings its own scheduler)


# Workflow of document processing, extract, transform, load (ETL) and enhancing by data enrichment and data analysis



How new data will be handled with this components and [ETL (extract, transform, load), document processing, data analysis and data enrichment](../../open-semantic-etl):
* A user manually or a Cron daemon automatically from time to time starts a command
* The command line tools or the web API getting this command starts a ETL (extract, transform, load), data analysis and data enrichment chain to import, analyze and index data
* A input plugin or [connector](../admin/connectors) (i.e. the connector for the file system or the connector for a website) reads from its datasource
* The connectors, an Apache Tika parser, or a file format based data converter or extractor extracts data from the given document or file format
* The ETL framework calls all configured [enhancer plugins for data enrichment](../data_enrichment) to get additional analysis for the data or annotations to this data from a CMS.
* The output storage plugin or indexer index the text and metadata to the Solr index or to the [Elastic Search index](../../etl/elastic_search), so all other tools can search this data
* The user uses an user interface like the search user interface or some other tools to search based on the search API of this index


# User Interface and search applications


## [Solr-PHP-UI](../../solr-php-ui)


User Interface (supports responsive design for mobiles and tablets) for search, facetted search, preview, different views and visualizations.

Based on Solr client *solr-php-client* (pure vanilla php) and standard User Interfaces (HTML5 and CSS with *Zurb Foundation*) and visualization libraries (*D3js*) so you can install and run it on standard PHP webspace without effort and wthout often not avaliable special PHP-modules)

[Learn more](../../solr-php-ui) ...


## Alternate search clients and user interfaces


* [Kibana](https://www.elastic.co/products/kibana)
* [Velocity](https://cwiki.apache.org/confluence/display/solr/Velocity+Search+UI
)
* [Solarium](http://www.solarium-project.org/)
* [Drupal Solr](https://drupal.org/project/apachesolr) or [Sarnia](https://drupal.org/project/sarnia)
* [Hue Hadoop User Interface](http://www.gethue.com/)
* [Blacklight](http://projectblacklight.org/)


# Index server


## [Solr search server (daemon)](../../solr)


Preconfigured Solr Server running as daemon (so you have only to install the package and no further configuration needed)

[Learn more](../../solr) ...

# Annotation


*Tools for editing and managing metadata like tags, notes, relations and content structure (i.e. taxonomies):*


## Open Semantic Tagger


[Tagger](../../tagger) is a light weight responsive web app for tagging web pages and documents.

[Learn more](../../tagger) ...


## Drupal CMS


[Drupal](../../enhancer/rdf-drupal) provides collaborative editing, structure (taxonomies and semantic web technologies) and forms (Fields)

[Learn more](../../enhancer/rdf-drupal) ...


## Semantic Mediawiki


[Semantic Mediawiki](http://www.semantic-mediawiki.org/) provides collaborative editing, structure (semantic web technologies), forms (Semantic Forms) and change-history


## Alternate annotation tools for collaborative semantic annotations


* [Neonion](http://neonion.org/)
* [Pundit](http://www.thepund.it/)
* [Hypothesis](http://hypothes.is/)
* [AnnotatorJS](http://annotatorjs.org/)



# Connectors


*Crawler, connectors, data importer and converter:*
## [Connector Files (with OCR)](../../connector/files)


Crawl and index directories, files and documents into Solr. Including automatic textrecognition (OCR) support for images and grafical formats included in PDF documents (i.e. scans)

[Learn more](../../connector/files) ...


## [Connector RSS (RSS-Feed)](../../connector/rss)


Indexes Webpages from a RSS-Newsfeed

[Learn more](../../connector/rss) ...

## [Connector Web (HTTP)](../../connector/web)


Crawl and index Websites into Solr index.

[Learn more](../../connector/web) ...


## [Connector DB (SQL, MySQL, Postgresql)](../../connector/db)


Index SQL databases like MySQL or PostgreSQL into Solr.

[Learn more](../../connector/db) ...



## [Connector Wiki (Mediawiki)](../../connector/wiki)


Index Wikis like Mediawiki into Solr.

[Learn more](../../connector/wiki) ...


## [Connector E-Mail (IMAP)](../../connector/email)


Index E-Mails into Solr.

[Learn more](../../connector/email) ...



## [Connector Scraper (Scraping with Scrapy)](../../connector/scraper)


ETL and webscraping framework to crawl, extract, transform and load structured data from websites (scraping).

[Learn more](../../connector/scraper) ...


## Connector Universal


[Apache Manifold Connector Framework](http://manifoldcf.apache.org/) imports many different formats and datastructures into Solr or Elastic search.

[Learn more](https://manifoldcf.apache.org/release/release-2.6/en_US/end-user-documentation.html) ...

## Other ETL and data integration and transformation frameworks for data warehouses



Ther are powerful [open source ETL-Frameworks for data integration, data enrichment, mapping and transformation](../../etl#frameworks).

If there is an output plugin for Solr or for a format, which you can import with one of the connectors, you can use this frameworks to integrate, transform or enrich and load data to the search engine.


# Scheduler



If you use our connectors and want most flexibility use Cron and write a cronjob using our [command line tools](../admin/cmd) within a crontab or call our [REST-API](../admin/rest-api) within another webservice (i.e. webcron).

If you use Apache ManifoldCF for imports, there is a scheduler built in there. Just set the time in the web admin interface.


# Queue manager


Reads and manages trigger signals for starting indexing queued files by batch mode (parallel processing but because of limited RAM resources with a maximum count of workers/processes at same time) with opensemanticsearch-etl-file.

Filenames can be append to the queue by the REST API, Webinterface or command line tool.

[Learn more](../admin/config/queue) ...


# Data enrichment (Enhancer)


Will enhance the indexed content with meta data or analytics

[Learn more](../data_enrichment) ...

## [Enhancer OCR](../../enhancer/ocr)


Automatic textrecognition (OCR) for image files and images and graphics inside PDF (i.e. scans).
[Learn more](../../solr-enhancer-ocr) ...

## [Enhancer RDF](../../enhancer/rdf)


Will enhance content with metadata in Resource Description Framework (RDF) format stored on a meta data server (i.e. tags and annotations in a Semantic Mediawiki or in [Drupal CMS](../../enhancer/rdf-drupal))

[Learn more](../../enhancer/rdf) ...

## [Enhancer XMP sidecar files](../../enhancer/xmp-sidecar-files)


Metadata like tags or descriptions for photos are often saved in XMP (Extensible Metadata Plattform) sidecar files (i.e. by *Adobe Photoshop Lightroom*. This enhancer adds the metadata of this sidecar files to the index of the original document.

[Learn more](../../enhancer/xmp-sidecar-files) ...

## [Enhancer ZIP](../../enhancer/zip)


This enhancer recognizes and unzips zip archives to index documents and files inside a zip files, too.

[Learn more](../../enhancer/zip) ...



## [Apache Stanbol Enhancement Engines](http://stanbol.apache.org/docs/trunk/components/enhancer/engines/list)


[Apache Stanbol Framework](http://stanbol.apache.org/) integrates many different enhancers and connectors to external APIs for data enrichment.

[Learn more](http://stanbol.apache.org/docs/trunk/components/enhancer/engines/list) ...


# Web Services


## Web admin interface


Admin interface to start actions like crawling a directory or a webpage via web interface without command line tools and starting this actions.

[Learn more](../admin/rest-api) ...

## [REST-API](../admin/rest-api)


Application programming interface (API) available via generic and standard network protocol HTTP and waiting until another (web) service or software demands for an action like crawling a directory or a webpage or indexing changed data (i.e. directly started after data change by a [trigger](#trigger) of the cms) and starting this actions.

[Learn more](../admin/rest-api) ...



# Trigger


Using triggers you dont need to recrawl often to be able to find new or changed content within seconds:

If there are hundrets of Gigabytes or some Terabytes of data and millions of files, standard recrawls can take hours in which your document can not be found and eat many resources.

With triggers that works the other way: your CMS or file server will send a signal if there is new content or a litte part has changed and the queue manager will index only this file or page very soon.


## [Trigger Filemonitoring](../../trigger/filemonitoring)


File system monitoring based on *itnotify*.

Monitors files and file folders and index them (again), so that new or changed documents or files can be found within seconds and without recrawl often (which would burn many ressources).

[Learn more](../../trigger/filemonitoring) ...


## Trigger Mediawiki


After saving a page the Semantic MediaWiki module notifies the search engine about changed or new content.

## Trigger Drupal


After saving a page the [Drupal module](https://www.drupal.org/project/rules) notifies the search engine about changed or new content.

[Learn more](https://www.drupal.org/project/rules) ...

## Generic triggers


Like for Drupal (see before) there are generic trigger modules available for many other software projects, too. So install them and configure them to the URL of our [REST-API](../admin/rest-api) to recrawl changed data of the other software or webservices.