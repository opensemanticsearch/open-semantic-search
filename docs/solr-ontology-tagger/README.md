---
title: Ontology tagger for Solr (Automatic tagging by RDF ontologies & SKOS thesaurus)  
authors:  
    - Markus Mandalka
---

# Ontology tagger for Solr (Automatic tagging by RDF ontologies & SKOS thesaurus)

## Annotator for Apache Solr by Resource Description Framework (RDF) ontology & Simple Knowledge Organization System (SKOS) thesaurus

The auto-tagger **Ontology Tagger** for **Apache Solr** is the preconfigured search engine component for **automatic tagging** or auto-classification of **documents** in an Apache Solr index for faceted search by labels in data structures like **ontologies** in the open standard **RDF** & **thesauruses** in the open standard **SKOS** or [linked open data sources and databases](../doc/datamanagement/opendata) like [Wikidata](../doc/datamanagement/opendata#wikidata).

## Automatic tagger for faceted search with Solr

You can [structure, filter and navigate your indexed documents or datasets by faceted search](../doc/search#faceted_search) based on structures like [thesauri, knowledge bases, lists of entities, ontologies or taxonomies](../doc/datamanagement/thesaurus) available in open standards for the semantic web or linked data formats like Resource Description Format (RDF) or [Simple knowledge organization system (SKOS)](../doc/datamanagement/thesaurus#skos).

## Free Open Source Software (FOSS)

Since the Ontology based auto-tagging tool and library is free Open Source Software based on Python & rdflib, the full source code is included inside the downloadable packages and hosted on [Github](https://github.com/opensemanticsearch/solr-ontology-tagger).

## User interface (UI) for managing ontologies and thesauri for automatic tagging

A simple web app based user interface (UI) for easily configuring Solr with ontologies or thesauri for faceted search is provided by the [Python Django App Ontologies Manager](../doc/datamanagement/ontologies), and it's code is available inside our distribution packages and on [Github](https://github.com/opensemanticsearch/open-semantic-search-apps) too.

## Poor mans entity linking without disambiguation

Since for most use cases not so important if you work mainly with your own datasets and domain specific knowledge instead of universal databases with many ambigous concepts or names, at the moment there is no disambiguation integrated for automatic tagging or poor mans entity linking. *Please donate so we can integrate methods and UIs to disambiguate homonyms and different entities with same names or same labels.*

## Automatic ontology tagger and annotator for Elastic search

Our search engine distribution is based on Apache Solr. *Please donate with the subject "Elasticsearch ontology tagger" if you want to use these integrated tools for Elasticsearch*, since a generalization of this relatively small part of the search engine specific code would cost only few hours of effort or configure an alternate Ontology Annotator with an [Elastic search plugin](https://github.com/flaxsearch/BioSolr/tree/master/ontology/ontology-annotator/elasticsearch-ontology-annotator).

## Open Source tools for entity linking, dictionary based entity extraction or dictionary based annotation

Other methods, open source frameworks and free tools for automatic tagging, entity linking, entity extraction or disambiguation by machine learning:

* [Apache Stanbol Entity Linking Engine](https://stanbol.apache.org/docs/trunk/components/enhancer/engines/entitylinking)
* [BioSolr ontology annotator](https://github.com/flaxsearch/BioSolr/tree/master/ontology/ontology-annotator) - Ontology tagger for Solr or Elastic Search
* [Fast entity linker](https://github.com/yahoo/FEL) - Entity linking with disambiguation by machine learning
* [Dexter](http://dexter.isti.cnr.it/)
* [NEL](https://github.com/wikilinks/nel)
* [SolrTextTagger](https://github.com/OpenSextant/SolrTextTagger)
* [Solr Dictionary Annotator](https://github.com/elsevierlabs-os/soda) - Microservice for Spark
* [Datafari OntologyUpdateProcessor](https://datafari.atlassian.net/wiki/display/DATAFARI/Link+an+ontology) - Solr update processor plugin
* [Apache UIMA dictionary annotator](https://uima.apache.org/d/uima-addons-current/DictionaryAnnotator/DictionaryAnnotatorUserGuide.html)
* [Apache UIMA concept mapper](https://uima.apache.org/d/uima-addons-current/ConceptMapper/ConceptMapperAnnotatorUserGuide.html#dict)
