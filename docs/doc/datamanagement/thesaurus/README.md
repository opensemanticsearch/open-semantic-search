---
title: Thesaurus editor for editing, structuring & linking vocabulary or dictionary of topics, concepts & names
authors:
    - Markus Mandalka
---

# Thesaurus editor for editing, structuring & linking vocabulary or dictionary of topics, concepts & names


## User interface for editing, linking and managing vocabulary (words, topics, terms or concepts) and named entities (i.e. persons or organizations) of a custom thesaurus for structuring semantic search & document analysis by domain knowledge



![](../../../screenshots/named_entities_manager.png)


Open Semantic Thesaurus Editor and Thesaurus Manager is the integrated Django (Python) based open source web app as user interfaces for editing, linking, management and structuring of a controlled vocabulary or domain knowledge.

So you can manage important terms, words or concepts, names, topics, persons, organizations or places in a custom thesaurus for [editing names, entities or concepts](#editor), their [alternate labels like aliases (i.e. nickname), synonyms (a car is a vehicle, too)](#synonyms) or [typos and misspellings](#hiddenlabel) and its [structure or relations](#relations) like hyponyms (even if not every car is a truck, every truck is a vehicle, too).

The structured data will be used for structuring [faceted search](../../search) and [analysis or text mining of indexed documents](../../analytics/textmining) and to be able to find more by semantic search by considering alternate spellings or synonyms:


## How to manage structure like names, organizations, locations, places, persons of interest or important words or concepts



Therefore open the webapp clicking on "Thesaurus" in the topbar of the search interface and use its web user interface to insert or edit entities and to manage their aliases or groups.

With the thesaurus user interfaces you can manage relevant named entities like organizations or company names, persons of interest, locations or concepts for automatic tagging (autotagging) and for automatic analysis for exploratory search:


## Easy adding of new entities: Just add a name, a word or a query



Just add a new entity, set a name or word and save it:

![](../../../screenshots/named_entities_manager.png)


Just click on the "Add new entity" button (in your entity list or in the topbar of the entities manager), set a name like a company name or a concept like an interessting or important word into the field "Name" and click the "Save" button.

All other more complex but very powerful features like alternate labels for synonyms, hidden labels for typos or relations to other concepts are optional.

## Structures search navigation and document analysis like overviews, interactive filters, semantic search (Faceted search by Thesaurus based Named Entity Extraction & Named Entity Linking)



![](../../../screenshots/facets.png)


The entries of the thesaurus are used for automatic tagging for additional structure for analysis and named entity extraction or named entity linking for exploratory search or as tags for news pipes or alerts:

Based on the thesaurus entries the named entity tagger or named entity extraction can find the name or label, alternate labels like synonyms and misspellings and add the name (prefered label) to the configured facets for aggregated overview, interactive filters and analytics.

For example if you add the entity "Open Semantic Search" with/to the facet "Software", you will be able to use this entity or name as interactive filter and will get an aggregated overview of the count of documents matching this entity while searching for other queries.

Additionally using the alternate labels, aliases or synonyms, the semantic search can not only find exactly the terms the user search for, but the search engine will find documents with alternate terms like synonyms, too.


## Alternate labels and synonyms


Alternate spellings, aliases or synonyms of a concept can be added to "Alternate labels".

Different [fuzzy search methods](../../search/fuzzy) are integrated to [recommend alternate Labels](recommender).



## Manage misspellings or typos and errors by automatic textrecognition (OCR)


Since no [automatic textrecognition (OCR)](../ocr) is perfect and there are typos in documents you didn't write yourself and can not change or since your users will write terms wrong in their queries, you can manage typos and OCR errors:

For each concept or name you can define hidden labels or misspellings i.e. with misspelled variants of the name or concept, so the name or concept will be found, too, even if it is misspelled in the documents.

### Recommender for misspelled names or OCR errors


The [thesaurus recommender can generate automatic recommendations of such hidden labels or misspelled names from variants of misspelled text](recommender) inside your documents (corpus).


## Broader concept


You can link to broader concepts up in the hierarchy or taxonomy.

## Narrower concept


You can link to narrower concepts down in the hierarchy or taxonomy.

You can use the [recommender for compounded words to automatically find some recommendations for narrower terms](recommender) you can add with one click.

## Related terms


You can link to related terms which are not on higher level or lower level of the hierarchy or taxonomy.

### Recommendation of related terms


Please donate for automatic recommendations of other related terms (often co-ocurences) which can be found by topic modelling (machine learning by LDA)


## Search query (optional)


Mostly you need only to set a name of a entity to tag it for exploratory search, aggregated overviews and interactive filters (faceted search) .

If there is no (optional) search query in the tab query, this name will be used as the search query per default.

But optional you can set a little bit different (i.e. including wildcards) or more complex queries than the name in the tab "Query".

For example
`"shooting in my town" AND NOT "photo shooting in my town"`
## Custom tags (optional) - i.e. for alerts or newsfeeds or for classification


For example you can setup to tag all new articles with a keywords or search queries like `myCompanyname` or with more words like `myTown murder` or more complex queries like `myTown AND shooting AND NOT "shooting star" AND NOT "photo shooting"` with the tag *maybe urgent and or important* and subscribe this tag as alert.


## Groups / Lists (optional)



You can add named entities to groups.

For example if you add the entity "shooting" to the group "violence", documents with "shooting" will be tagged with "violence", too, even if not containig the word violence.

If you search or filter with the group "violance", documents with the named entity "shooting" (which was assigned to this group/list) and all other named entities assigned to this group will be found, too.

So you get an aggregated overview by groups/lists or you are able to filter or search not only by single entities but by whole groups/lists.



## Taxonomies: Navigate and filter with groups, lists or collections and find and navigate subtopics (optional)


Since you can set groups to a parent group, you can build a hierarchy or taxonomy to be able to find, overview or navigate subtopics.

For example if you search or filter for the facet violence all terms of the group like "shooting" or "murder" will be found too and you get an aggregated overview over all forms together and over the different forms.

Or for example if you add the entity or product "Open Semantic Search" with the alias "@OpenSemSearch" to the group "Solr" which has the parent group "Search engine" which has the parent group "Open Source Software" the documents with the content "Open Semantic Search" or tweets from @OpenSemSearch will be tagged and found with "Open source" and with "search engine" and "Solr" even if not containing this words.




## Import external lists of names, thesaurus or ontologies


You don't need to enter each entity like persons, organizations, locations or concepts, if there is an exisiting list or if the entries are available in other structured format yet.

You can import existing, shared or external list of names, thesauri, dictionaries, vocabularies or semantic web ontologies with the [lists and ontologies manager](../ontologies):


[![](../../../screenshots/import_ontology.png)](../ontologies)


Learn more about [how to import a lists, a dictionary, a vocabulary, a thesaurus or an ontology](../ontologies).


### Interoperability by open standard for a Simple Knowledge Organization System (SKOS)


For interoperability reasons the thesaurus can be imported from and exported to the open standard formats Resource Description Framework (RDF) and Simple Knowledge Organization System (SKOS).


### Integrate and import thesauri from other RDF or SKOS compatible tools or open data sources


Since the [ontologies manager](../../datamanagment/ontologies) for named entities extraction is able to import the open semantic web standard Resource Description Framework (RDF) and Simple Knowledge Organization System (SKOS) you can import or integrate (additional) thesauri from other thesaurus editors or thesaurus management tools by importing their thesauri.

### Open thesauri and Open Data vocabularies


You don't have to create an own thesaurus for common concepts or topics.

In many cases it is less effort to integrate or import public thesauri from the [linked open data (LOD)](../opendata) cloud.

## Export thesaurus to RDF and SKOS


The thesaurus will be exportable to the open standard format Resource Description Framework (RDF) and [Simple Knowledge Organization System (SKOS)](https://www.w3.org/TR/skos-primer/), so you can use it in other software and knowledge management tools or share or publish it.


## Methods for managing a vocabulary for semantic search


* [Thesaurus](https://en.wikipedia.org/wiki/Thesaurus) for linking concepts and managing aliases and synonyms
* Simple Knowledge Organization System (SKOS): Open standard for thesauri from W3C
* Managing [Named Entities](https://en.wikipedia.org/wiki/Named_entity) like names, persons, organizations, places, terms and concepts as database or knowledge base for [Named Entity Linking](https://en.wikipedia.org/wiki/Entity_linking)
* Synonyms
* Hyponyms (narrower terms)
* [Taxonomy](https://en.wikipedia.org/wiki/Taxonomy_(general)) (defining hierarchy or tree by links to narrower or broader terms) for [taxonomy based search navigation](https://en.wikipedia.org/wiki/Taxonomy_for_search_engines)


## Alternate free software and open source tools for thesaurus editing



Alternate Simple Knowledge Organization System (SKOS) standard compatible free software open source tools and for editing and managing thesauri:
* [Skosmos](http://skosmos.org/) (PHP & SPARQL)
* [SkosJS](https://github.com/tkurz/skosjs) (Javascript & SPARQL)
* [Unilexicon](https://unilexicon.com/)
* [Vocbench](http://vocbench.uniroma2.it/)
* [TemaTres](http://www.vocabularyserver.com)
* [OpenSKOS](http://openskos.org)
* [iQvoc](http://iqvoc.net/) (Ruby on rails)


[More in W3C Wiki](https://www.w3.org/2001/sw/wiki/SKOS) ...
