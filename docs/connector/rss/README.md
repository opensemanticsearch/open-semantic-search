---
title: RSS-Feed or Newsfeed
authors:
    - Markus Mandalka
---

# RSS-Feed or Newsfeed


Indexing a RSS-Newsfeed to Solr.

Will download and index the linked websites or documents, not only the content of the rss (often only teaser).


## Usage


### Using the web user interface *RSS-Feed manager*


If you want to manage many feeds and import feeds periodically, you might want to use the [web user interface RSS-Feed manager](../../doc/datamanagement/rss).

### Using the web admin interface


* Open the page *RSS-Feeds*
* Enter the URL of the feed to the form
* Press button "crawl"


### Using the commandline


`opensemanticsearch-index-rss *http://www.opensemanticsearch.org/feed*`
### Using the REST-API


`http://127.0.0.1/search-apps/api/index-rss?uri=*http://www.opensemanticsearch.org/feed*`
## Alternates


You can use Apache ManifoldCF to import RSS-Feeds into to Solr.