---
title: RSS-Feed Manager  
authors:  
    - Markus Mandalka
---

# RSS-Feed Manager

## Managing newsfeeds and imports

RSS-Feed manager is a web app and user interface for managing imports of RSS-Newsfeeds.

## Usage

Read the [user documentation](../doc/datamanagement/rss).

## Installation

* download the module `solr-search-rss-feed-manager-python-django`
* Copy the directory `rss_manager` from the zip file into your Django apps directory
* Enable the new app:

Add "`rss_manager`" to your `INSTALLED_APPS` setting like this:


```python
INSTALLED_APPS = (
 # ...
 'rss_manager',
 )
```

* Include the querytagger URLconf in your project urls.py like this:
`url(r'^rss_manager/', include('rss_manager.urls')),`
* Setup a cron getting `http://localhost:8000/rss_manager/import` periodically (i.e. every 5 minutes).

## Roadmap

Plans for the feature ([please donate](../donate)):

We want to add tagging functionality to the RSS importer, so you can add metadata or tags to all news imported with this feed, i.e. a special topic).

We want to add tagging for RSS-Feed management, so you can organize many newsfeeds in the management interface with tags.
