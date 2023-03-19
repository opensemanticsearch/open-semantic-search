---
title: Web scraping: Extract structured data from websites  
authors:  
    - Markus Mandalka
---

# Web scraping: Extract structured data from websites


## Import structured data scraped from websites to the search server


[This connector](http://searchhub.org/2013/06/13/indexing-web-sites-in-solr-with-python/) integrates the Open-Source Scraping-Framework [Scrapy](http://www.scrapy.org), a Python framework for ETL (Extract, transform and load) to build a customized crawler, parser, data scraper and converter for extracting structured data from websites.

This is for websites which don't yet offer their data in structured open standard formats (like RDF, XML, JSON or CSV for which there are comfortable and easy to use connectors yet), so we have to extract all data from HTML pages with a more complicated individual scraper.

## Where to write the data: Solr dynamic fields


If you don't want to use standard fields like title, author and content you don't have to change the config file schema.xml (which defines the fields of the Solr index).

Our Solr server is preconfigurated with [dynamic fields](https://cwiki.apache.org/confluence/display/solr/Dynamic+Fields) so that you can fill standard fields like title or content or additional dynamic fields like *yourfield\_b* for one boolean, *yourfield\_bs* for booleans, *yourfield\_s* for a string and *yourfield\_ss* for some strings or *yourfield\_t* for a text or *yourfield\_tt* for some texts to be filled with data.

Have a look at `schema.xml` or managed-schema to see all possible data types of dynamic fields, like boolean, string, dates, text and so on.

## Enable new fields or facets in the user interface


If you did not use preconfigurated fields like tags (fieldname is *tag\_ss*) and want to use them not only to find data but as interactive filters (facets) for the navigation:

To enable your own additional fields as facets (interactive filters) in the user interface just [map the technical Solr fieldnames to user friendly labels in the config of the user interface with the option *$cfg[facet]*](../../doc/admin/config).