---
title: Developing own data analysis and data enrichment plugins  
authors:  
    - Markus Mandalka
---

# Developing data analysis and data enrichment plugins

There are different ways to [enrich data](../../doc/data_enrichment "Document processing, contet analysis and data enrichment pipeline") with custom enhancer plugins:

* Write your own [data enrichment plugin for our connectors with a few lines of Python](python) code for our Open Semantic ETL framework.
* Data enrichment web service or API: Develop or use a web service or REST-API for additional data or analytics and read the results with our [RDF enhancer](../../enhancer/rdf) or call such a webservice in a custom Python data enrichment plugin.
* If you use Solr as your database or index, develop a [Plugin for the Solr Update Processor (i.e. in Javascript or in Java)](http://searchhub.org/2013/06/27/poor-mans-entity-extraction-with-solr/)
* Write your own [enhancer engine for Apache Stanbol](http://stanbol.apache.org/docs/trunk/components/enhancer/) in Java
* Write analysis or data enrichment in whatever programming language you use, read needed data from Solr, Elastic Search or SPARQL interface with programming libraries or tools of your choice and write your results into the index or database yourself, for example using the update mechanism (instead of an overwriting insert command) in Solr extending the existing document with additional values or fields / facets / properties instead of overwriting it with new values.
