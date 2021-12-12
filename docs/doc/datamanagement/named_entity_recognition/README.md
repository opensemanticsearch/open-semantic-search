---
title: Automatic extraction of named entities like persons, organizations or locations by named entity recognition
authors:
    - Markus Mandalka
---

# Automatic extraction of named entities like persons, organizations or locations by named entity recognition


## How to automatically extract named entities like persons, organizations or locations by machine learning for named entity recognition


[![](../../../screenshots/facets.png)](../../../screenshots/faceted_search.png)

Extracted named entities like persons, organizations or locations (Named entity extraction) are used for [structured navigation, aggregated overviews and interactive filters (faceted search)](../../search#faceted_search) and to be able to get leads for connections and networks because you can analyze which persons, organizations or places occor together in how many documents.

## Automatic Named Entity Recognition by machine learning (ML) for automatic classification and annotation of text parts



Additionally to known [named entities in a thesaurus](../thesaurus) or [imported ontologies](../ontologies) other data analysis plugins integrate Named Entity Recognition (NER) by [spaCy](https://spacy.io) and/or [Stanford Named Entities Recognizer (Stanford NER)](http://nlp.stanford.edu/software/CRF-NER.shtml).

## Named Entity Extraction of yet unknown entities or names


So by integration of machine learning for analysing the structure of the text and classifying parts/words of the sentences to categories like person, location or organization, many yet unknown named entities can be extracted, which aren't configured or listed yet in the thesaurus or a list of names or ontology.

Therefore it uses models trained with existing annotations of a large text corpus, so after that they can "predict" or better: guess by probability if a part of a sentence is a name of a person, a name of an organization, a verb or a place.

## Find more by combination with thesaurus and ontologies



Since no machine learning algorithm and machine learning model is perfect, the search engine combines the analysis with other methods and data which is curated by human editors.

Therefore you can add important names to the [thesaurus](../thesaurus), so the search engine will extract them even if the named entities recognition fails.

You don't have to add each name yourself:

By the [ontologies manager](../ontologies) you can [import thousands of names from Open Data like Wikidata](../opendata/wikidata) which offers an universal structured database with names of people like for example [lists of names of politicians and members of parliament(s)](../opendata/wikidata#politics).


## Configuration of the Spacy NER plugin


The SpaCy Named Entity Recognition NER plugin is enabled by default, if not disabled because not needed or because of performance issues.

The NER plugin is configured with language specific classifiers for English, German, Spanish, Portuguese, French, Dutch and Italian.

## Configuration of the Stanford NER plugin



The [Stanford Named Entitiy Recognizer (NER) plugin](../../../enhancer/named_entitiy_recognition/stanford_named_entity_recognizer) can be enabled instead or additional and is configured with language specific classifiers for English, German and Spanish.
