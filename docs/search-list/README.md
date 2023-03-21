---
title: Search Solr with lists  
authors:  
    - Markus Mandalka
---

# Search Solr with lists

Searching a list of queries and show for each entry if there are results.

## Usage

Read the [user documentation](../doc/search/list).

## Installation

Download and install the module *solr-search-list*.

### Setup the Django Webapp

If you want to use the web user interface (webapp):
* download the module `opensemanticsearch-search-list-python-django`
* Copy the directory `search_list` from the zip file into your Django apps directory
* Enable the new app:

Add "`search_list`" to your `INSTALLED_APPS` setting like this:

```python
INSTALLED_APPS = (
 ...
 'search_list',
 )
 ```

 * Include the `search_list` URLconf in your project `urls.py` like this:
`url(r'^search-list/', include('search_list.urls')),`
