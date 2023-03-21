---
title: Solr-PHP-UI: Solr client and user interface for search (UI)  
authors:  
    - Markus Mandalka
---

# Solr-PHP-UI: Solr client and user interface for search (UI)

![](../screenshots/search.png)

This search user interface component of the open source search engine Open Semantic Search is a PHP based lightweight search client with complete and responsive user interface for searching with Apache Lucene / Solr (open source enterprise search server).

So you can install / run an search engine on standard LAMP or standard PHP webspace without effort (based on vanilla PHP and Solr-PHP-Client). It doesn't need a database but only connection to or an installation of a standard Solr server/service (ready packages available).

Just install the Debian GNU/Linux or Ubuntu Linux package or copy the source to PHP webspace and search with a flexible responsive UI:

## Features

* [Fulltext search](../doc/search)
* Facetted search (interactive filters)
* Viewer for preview
* Analyze text
* Sorting
* Different views

### Views

* Result list (with snippets and highlighted search terms)
* Preview
* Images* Table (sortable and filterable)
* Analyze search results or all documents with data visualizations:
	+ Wordcloud
	+ Trend chart
	+ Networks, connections and relations (graph)

## Configuration

Edit `/etc/solr-php-ui/config.php` (if installed from a package) or `config/config.php` (if installed from source) for setting another language or for adding custom facets (additional fields and interactive filters).

## Used libraries

*Used libraries and frameworks (all included in the package)*
* solr-php-client (Solr client library for PHP)
* jquery (javascript library for easier accessing the dom model)
* Zurb Foundation (CSS and UI lib for responsive web design)
* d3js (javascript library for visualizations)
* nvd3 (d3js based javascript library for charts)
* Cytoscape.js (graph)

## Dashboards

Solr-PHP-UI is a lightweight solution which doesn't need a database or special libraries. So the configuration options for the users are limited.

If you want to configure dashboards, add some calls of a view into iframes, show some Solr-PHP-UI RSS feeds (i.e. show results of some configured search feeds in Drupal views) or you have to setup a user interface with a database like Hue (Django/Python) or Sarnia (Drupal/PHP):

## Alternates

Alternate components (Open Source user interfaces for Solr):
* [Velocity](https://cwiki.apache.org/confluence/display/solr/Velocity+Search+UI) (Java)
* [Solarium](http://www.solarium-project.org/) (PHP)
* [Drupal Solr](https://drupal.org/project/apachesolr) and [Sarnia](https://drupal.org/project/sarnia) (PHP and Drupal)
* [Hue Hadoop User Interface](http://www.gethue.com/) (Python and Django)
* [Blacklight](http://projectblacklight.org/) (Ruby on rails)
