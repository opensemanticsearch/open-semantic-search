---
title: SKOS thesaurus to Solr synonyms (SKOS to Solr)  
authors:  
    - Markus Mandalka
---

# SKOS thesaurus to Solr synonyms (SKOS to Solr)

To be able to find words, concepts and names and URIs by synonyms, aliases or (alternate) labels, too, the [thesaurus manager](../doc/datamanagement/thesaurus) and [ontologies manager](../doc/datamanagement/ontologies) apps are integrated with the [Solr search server](../solr).

## Converts Simple Knowledge Organization System (SKOS) thesaurus to Apache Solr synonyms config file

This Python component converts or exports the thesauri from the open standard **[Simple Knowledge Organization System (SKOS)](http://www.w3.org/TR/skos-primer/)** to an **Solr synonyms** configuration file for for a [Solr synonym filter](https://cwiki.apache.org/confluence/display/solr/Filter+Descriptions#FilterDescriptions-SynonymFilter).

## Find words by alternate labels, synonyms, RDFS labels and URIs

Therefore it adds to the Solr synonym config file all alternate SKOS labels or aliases from thesaurus entries as synonym for their prefered labels.

So you will find documents containing only alternate labels, too.

It supports synonyms like SKOS:altLabel or SKOS:hiddenlabel adding them as synonyms for SKOS:prefLabel and RDFS:label.

Additionally it adds the labels of an URI of an entity as synonym for this URI, so you can find and filter documents containing only the URIs by the URIs labels, too.

## Alternate Solr plugin

An alternate for expansion of terms by SKOS vocabularies is to use the Solr plugin [Lucene SKOS](https://github.com/behas/lucene-skos).

The disadvantage of this alternate is, that the plugin version has to be compatible with your Solr version and its more complex plugin interface, which could change more often than the simple Solr synonym config format.
