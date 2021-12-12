---
title: REST API
authors:
    - Markus Mandalka
---

# REST API


Application programming interface (API) available via generic HTTP waiting for another (web) service or software demanding for an action like crawling a directory or a webpage or indexing changed data (i.e. directly started after data change by a [trigger](../../modules#trigger) of the CMS) and starting this actions.

## Crawling directories


Crawl a directory and all subdirectories and index all files:
`http://127.0.0.1/search-apps/api/index-dir?uri=/usr/share/doc`
## Index a file


Index a single file:
`http://127.0.0.1:/search-apps/api/index-file?uri=/home/opensemanticsearch/readme.txt`
## Index a web page


Index a single web page:
`http://127.0.0.1:/search-apps/api/index-web?uri=http://www.opensemanticsearch.org/`
## Index a RSS-Feed


Index each webpage from a RSS-Newsfeed:
`http://127.0.0.1:/search-apps/api/index-rss?uri=http://www.opensemanticsearch.org/feed`
## Delete a file or document from index


Delete a webpage or removed document file from index:
`http://127.0.0.1:/search-apps/api/delete?uri=file:///home/user/Documents/document.doc`
## Search or read data



We won't reinvent all wheels, so use the [Rest-API of Solr](http://lucene.apache.org/solr/quickstart.html#searching) for searching or / and getting data in XML or [JSON](https://cwiki.apache.org/confluence/display/solr/Using+JavaScript) format or use [Solr Client APIs](https://cwiki.apache.org/confluence/display/solr/Client+APIs) to get data with your favorite programming language.
