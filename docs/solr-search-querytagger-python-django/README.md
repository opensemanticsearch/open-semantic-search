---
title: Web interface for tagging all results of a Solr search query
authors:
    - Markus Mandalka
---

# Web interface for tagging all results of a Solr search query


Tagging all results of a search query.

## Usage



See the [user documentation](../doc/search/tagging_results_of_search_query)
## Installation


* download the module *solr-search-querytagger-python-django*
* Copy the directory *querytagger* from the zip file into your Django apps directory
* Enable the new app:

Add "*querytagger*" to your INSTALLED\_APPS setting like this:


`INSTALLED_APPS = (
 ...
 'querytagger',
 )`* Include the querytagger URLconf in your project urls.py like this:
`url(r'^querytagger/', include('querytagger.urls')),`
