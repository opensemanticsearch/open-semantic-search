---
title: Meta data enrichment or annotator from Resource Description Framework (RDF) to Solr or Elasticsearch
authors:
    - Markus Mandalka
---

# Meta data enrichment or annotator from Resource Description Framework (RDF) to Solr or Elasticsearch


## Annotator for labels from ontologies or RDF datasets to Solr or Elastic Search documents


This enhancer will **enrich** existing files, content or URIs with **additional metadata** in **Resource Description Framework (RDF)** standard format stored on the semantic web or intranet i.e. on a **meta data server, annotation server or CMS** (i.e. tags and annotations in a Semantic Mediawiki or in [Drupal CMS](../rdf-drupal)) and annotates the index of Elastic Search or Solr with the labels of the RDF annotations.

Therefore it calls the meta data server with the URI as parameter or query.

If you want to [import whole RDF graphs from RDF files or (parts) from a triplestore as content or **data source** for search and text mining, use the RDF connector](../../connector/rdf) instead.


## Configuration



Config file: `*/etc/opensemanticsearch/enhancer/rdf*`
### Servers


Set the url of your meta data server or a list of meta data servers delivering RDF meta data for other URLs.

As parameter you can use *[uri]* as template for the URL or *[uri\_md5]* for the MD5 Checksum of the URL, so the CMS is able to search for the meta data of the URL of the original content you want to enrich while indexing.

`config['metaserver'] = {
 'http://localhost/drupal/rdf?uri=[uri]',
 'http://localhost/mediawiki/index.php/Special:ExportRDF?page=[uri_md5]',
}`
### Mappings RDF properties to Solr fields or facets


So you can map RDF properties to Solr fields / facets / interactive filters:

`config['property2facet'] = {
 'http://purl.org/dc/terms/Tags': 'tag_ss',
 'http://purl.org/dc/terms/location': 'location_ss'
}`

You can use standard fields like title, author or content or tags (Solr field name: tag\_ss).

### Custom fields / facets



If there are no convenient fields / facets yet, you can map the RDF properties to additional custom fields/facets:

If you dont want to use standard fields like title, author and content you dont have to change the config file `managed-schema` (which defines the fields of the Solr index).

#### Dynamic fields


Our Solr server is preconfigurated with [dynamic fields](https://cwiki.apache.org/confluence/display/solr/Dynamic+Fields) so that you can fill standard fields like title or content or additional dynamic fields like *yourfield\_b* for one boolean, *yourfield\_bs* for booleans, *yourfield\_s* for a string and *yourfield\_ss* for some strings to be filled with data.

#### Enable new fields or facets in the user interface


If you did not use preconfigurated fields like tags (fieldname is *tag\_ss*) and want to use them not only to find data but as interactive filters (facets) for the navigation:

To enable your own additional fields as facets (interactive filters) in the user interface just [map the technical solr fieldnames to user friendly labels in the config of the user interface with the option *$cfg[facet]*](../../doc/admin/config).
