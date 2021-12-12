---
title: How to index Linked Data from Resource Description Framework (RDF) to Solr or Elastic Search
authors:
    - Markus Mandalka
---

# How to index Linked Data from Resource Description Framework (RDF) to Solr or Elastic Search


## Import and index linked data from semantic knowledge graph for full text search, faceted search and text mining


The open source extract transform load (ETL) plugin `enhance_rdf` for granular indexing of Resource Description Framework (RDF) knowledge graphs is a data enrichment plugin for RDF files or RDF connector for SPARQL endpoints or triplestores.

Since files in [Resource Description Framework (RDF)](https://www.w3.org/RDF/) format are a structured graph and more like a dataset or database with multiple or many different entries than a single document, it doesn't extract and index a RDF file only as one whole single file or document like standard document files.

It is indexing the RDF data more granular by distinguishing different entities or RDF subjects:

## Aggregates RDF triples to Solr or Elastic search documents


For each entity or RDF subject in all RDF triples it generates an own searchable semi-structured (for faceted search) but text based (for full text search) document with the content type *[knowledge graph](../../doc/search/graph)*.

Or in other words it creates for each entity or subject from the RDF graph a database row with columns for each property containing all readable and searchable text.

Therefore it index each URI/subject as Solr or Elastic Search document with its properties (RDF predicates) as facets/fields/database columns and its objects (RDF objects) as values.


## Transform references like URIs to human readable and searchable labels


For full text search capabilities this Extract Transform Load (ETL) plugin transforms referenced URIs to their label(s), i.e. from properties like [`rdfs:label`](https://www.w3.org/TR/rdf-schema/#ch_label) or [SKOS labels](https://www.w3.org/TR/skos-reference/#labels) from an [Simple Knowledge Organisation System (SKOS) based thesaurus](../../doc/datamanagement/thesaurus).


## User interfaces for full text search, faceted search, fuzzy search & text analysis in linked data knowledge graphs



So you can use easy [search user interfaces (UI) for full text search, interactive filters (faceted search) & text mining on Resource Description Framework (RDF) knowledge graphs](../../doc/search/graph)
## How to import and index an linked data graph from a file in Resource Description Framework (RDF)


The RDF enhancer plugin (free open source software) is enabled if not disabled by exclude `enhance_rdf` from `config['plugins']`.

Then just **index the RDF file** by one of the following methods or tools for [indexing files](../files):
* copy it to an folder that is configured for indexing in your desktop search environment
* copy it to an folder with active file monitoring
* use the [command line tool `opensemanticsearch-index-file`](../../doc/admin/cmd)
* or call the [file indexing API](../files) in a scheduler like Cron or from your own tools and scripts


## How to import and index an linked data from a graph database or triple store (SPARQL)


Use the command line tool etl\_sparql to import graphs or part of graphs from triple stores like Apache Jena by SPARQL queries.

`opensemanticsearch-index-sparql *endpoint* "*SPARQL query*"`
## Open Source tools for import RDF to Solr or Elastic Search


Alternate free software and open source tools for import of RDF data or SPARQL results to [Solr](../../etl/export/solr) or [Elastic Search](../../etl/export/elasticsearch):
* [SolrRDF](https://github.com/agazzarini/SolRDF) - Solr plugin for RDF
- [Elastic Search River for RDF](https://github.com/eea/eea.elasticsearch.river.rdf)

- [Elastic Search Plugin for importing RDF from Apache Jena](https://github.com/jprante/elasticsearch-plugin-rdf-jena)


