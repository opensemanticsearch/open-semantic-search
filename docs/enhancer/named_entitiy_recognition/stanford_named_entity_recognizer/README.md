---
title: Named Entity Recognition by Stanford Named Entity Recognizer (NER)
authors:
    - Markus Mandalka
---

# Named Entity Recognition by Stanford Named Entity Recognizer (NER)


## Automatic Named Entity Recognition by machine learning (ML) for automatic classification and annotation of text parts


[Extracted named entities like Persons, Organizations or Locations (Named entity extraction) are used for structured navigation, aggregated overviews and interactive filters (faceted search)](../../../doc/datamanagement/named_entity_recognition).

Additionally to known [named entities in a thesaurus](../../../doc/datamanagement/thesaurus) or [imported ontologies](../../../doc/datamanagement/ontologies) this data analysis plugin integrates [Named Entity Recognition (NER)](../../../doc/admin/config/named_entity_recognition) by [Stanford Named Entity Recognizer (Stanford NER)](http://nlp.stanford.edu/software/CRF-NER.shtml).

## Named Entity Extraction of yet unknown entities or names


So by integration of machine learning for analysing the structure of the text and classifying parts/words of the sentences to categories like person, location or organization, many yet unknown named entities can be extracted, which aren't configured or listed yet in the thesaurus Named entities Manager or a list or ontology.

Therefore it uses models trained with existing annotations of a large text corpus, so after that they can predict / guess if a part of a sentence is a name of a person, a name of an organization, a verb or a place.

## Configuration of the Stanford NER plugin


To enable the automatic named entity recognition with Stanford Named Entitiy Recognizer (NER), enable this plugin to your document processing chain in your ETL config `/etc/opensemanticsearch/etl` or a connector config:
`config['plugins'].append('enhance_ner_stanford')`
### Config language (machine learning model)


You can config alternate classifiers, i.e. for a machine learning model for another language than english or for your own domain knowledge model by the config option `config['stanford_ner_classifier']` or dependent on autodetected document language in the config option `config['stanford_ner_classifiers']` in the same config file, where you find additional information on this options.

## How to improve performance


Named Entity Extraction of [named entities managed by the Named Entities Manager](../../../doc/datamanagement/named_entities) or lists of names works very fast for (not complex queries) like static names or strings. So if you know many names yet, you should setup them by the Lists and Ontologies Manager, since that works more precise and so you get faster and more complete results for known names.

In comparison to the integration of lists of entitiy names while indexing process the machine learning plugin for Stanford NER works very slow. Not only because Named Entities Recognition of unknown entities by machine learning needs much more CPU power and RAM than [Entity Linking of known entities](../../../doc/datamanagement/named_entities) by Solr standard text analysis methods using limited well known names/words instead of much more complex probability and cluster based classification models.

The architecture of calling Stanford Named Entitiy Recognizer (NER) from the used Python library Natural Language Toolkit (NLTK) is not optimized for speed if you want to analyse many texts, since it loads the JAR and the whole classification model for each text analysis,.

For more performance for faster analysis of many documents you should setup an Stanford Stanford Named Entitiy Recognizer server instead of using this default NER plugin using NLTK which uses the Stanford Named Entitiy Recognizer command line tool. So the analysis of each document would take a few seconds less time (the time the Java based command line tool need to load and to load and initialize the machine learning model).

Or wait, until the existing Stanford NER integration with Apache Tika will be default feature working out of the box, since our Apache Tika is running as server that has to load only once.

## Dependencies and used libraries


* [Stanford Named Entity Recognizer (NER)](http://nlp.stanford.edu/software/CRF-NER.shtml)
* [Stanford Tagger Module](http://www.nltk.org/api/nltk.tag.html#module-nltk.tag.stanford) from the Python natural language processing library [Natural Language Toolkit (NLTK)](http://www.nltk.org)
Debian package: [python-nltk](https://packages.debian.org/stable/python-nltk)
