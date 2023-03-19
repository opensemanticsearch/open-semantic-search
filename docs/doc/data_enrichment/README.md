---
title: Data enrichment & content enrichment: Merge data & combine data analysis & document analysis tools (Enhancer)  
authors:  
    - Markus Mandalka
---

# Data enrichment & content enrichment: Merge data & combine data analysis & document analysis tools (Enhancer)

## Combining and merging multiple data sources & analytics of multiple content analysis and document analysis tools

Data enrichment is done by modular **document analysis, content analysis or data enrichment plugins** managed with our lightweight, flexible, extendable and interoperable [open source ETL (extract, transform, load) and data enrichment framework and toolset](../../open-semantic-etl) for **document processing, automated content analysis and media analysis, merge and data enrichment pipelines**.

## Document processing, data integration, content analysis, content enrichment and data enrichment pipeline (Enhancement chain)

The document processing pipeline or chain is a list of data enrichment plugins (enhancer), which will be run for each document to enrich, analyse or link them with additional data or analysis.

A part of the default [document processing pipeline configuration](#config) is for example:
* Extract text (enhance-text)
* OCR images (enhance-ocr)
* Adding annotations and tags (enhance-rdf)
* Indexing to database and/or search index (f.e. Solr or Elastic Search)

## Semantic data enrichment plugins

Such modular data enrichment plugins (enhancer) will enhance or enrich the content with additional meta data or analytics.

For example the plugins for [named entities recognition](../datamanagement/named_entities) or [automatic text recognition (OCR) for image files](../../enhance/ocr).

You can analyze your data with internal [webservices (or if you don't need privacy with external webservices or "the cloud")](../../open-semantic-etl#enrichment-webservices) or with your favorite programming language in a [custom data enrichment plugin](../../dev/enhancer).

## Configuration of a custom document processing, content analysis and data enrichment pipeline

The pipeline or the enabled plugins are configured for all data sources in `/etc/opensemanticsearch/connector` or can be overwritten or extended for each data source or connector in their specialized configs like `connector-files`.

The analysis chain is run in order, since some plugins depend on data analysis of other plugins.

You can add additional or new data enrichment plugins to `config['plugins']`.

Or you can overwrite this config option to define a custom data enrichment pipeline with only a few needed plugins.

## Enrich parts, enrich later, add additional enrichments, update data enrichments or distributed data enrichment

The tool `opensemanticsearch-enrich` can run data enrichment parts or plugins which are not enabled in your default document processing pipe later or from time to time.

For example sometimes its better to index all documents without OCR in the short term and after that to do the OCR of the documents with images which will take a long time. So the users are able to search in most documents and text, not having to wait until only a few parts and only for a few documents like some text in images are recognized in a long time process first before other documents after them are indexed, which takes only very little time, because there are no images.

Or you can do expensive data enrichment like OCR at night or on low server load or distribute this work on different processors (parallel processing) or servers (cluster) or web services (cloud).

Another possibility is to enrich with tools or webservices that improved or updated their results because of better analytics quality or more available data from time to time to integrate newer data or analytics results.

Or to enrich later with an additional webservice, without having to run the full document processing chain again.

Or if a webservice was not available while indexing to enrich data with its analytics later.

You can run the tool from REST-API or on the command line:
`opensemanticsearch-enrich --plugins *pluginname*`

Optionally you can add a search query or filter query, so only the interesting or important data or document(s) will get enriched:
`opensemanticsearch-enrich --plugins *pluginname* *query*`

## Integration of other frameworks for data integration for data warehouse or for extraction, transformation and load (ETL)

There are powerful [open source ETL frameworks](../../etl#projects) (extraction, transformation and load) for data integration, mapping, filtering and transformation for data warehousing with powerful features and graphical user interfaces (GUI).

## Linked Data with open Semantic Web Standards

Modern Semantic Web and Linked Data standard formats help you to [integrate linked open data to improve data analysis, navigation and filtering](../datamanagement/opendata).

## Enrich your data with free databases and Open Data

You can enrich your data with many free knowledge bases like WikiData (the structured database of Wikipedia) by using its lists of names or structures for analytics or import a Wiktionary as a thesaurus to find more verb forms especially of irregular verbs or synonyms.

## Data integration and data enrichment frameworks

Learn more about [Semantic Web, Linked Data, data integration, data analysis and data enrichment frameworks](../../etl).