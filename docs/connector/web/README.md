---
title: Crawler for indexing websites  
authors:  
    - Markus Mandalka
---

# Crawler for indexing websites


## Index a single Webpage


You can index a single webpage (or image or pdf file on a webserver, including automatic text recognition by OCR, if enabled in the connector config `/etc/opensemanticsearch/connector-web`):

### Start indexing by web interface


To start indexing a single web page via the web interface (i.e. *http://localhost/search/admin/crawl*):

Just write the url into the uri field and submit the form.

### Command line tool


Or use or integrate (i.e. in a crontab or in your own scripts) this command line tool:
`opensemanticsearch-index-web *http://www.opensemanticweb.org/*`

### REST-API


Using the REST-API:
`http://127.0.0.1/search-apps/api/index-web?uri=*http://www.opensemanticsearch.org/*`

## Crawl whole websites or parts of a website


You can index a whole website with the web crawler module of Apache ManifoldCF.

With its web interface you can setup a homepage, a sitemap or a RSS-Feed as the start point and set how deep the crawl should be.

Its possible to setup rules which parts to crawl and which to exclude.

Another software for crawling a website is Scrapy (see [documentation on using Scrapy with Open Semantic Search](../scraper/README.md)).