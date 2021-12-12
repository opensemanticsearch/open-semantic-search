---
title: Finds more with grammar rules (Stemming)
authors:
    - Markus Mandalka
---

# Finds more with grammar rules (Stemming)


Considering grammar rules the search engine will find more.

So if you search for *company corruption* you will find *companies corrupted*, too, even if for stupid computers this are different words or strings.

## Reducing words to their root form (stemming)

That works because a stemming algorithm reduces words to their root form.

For example the stemmer cuts suffixes like *-ing* or *-ed* or plural-*s*, so the search engine can find more forms of a word.

So the words *corrupt*, *corrupted* and *corruption* will be indexed and searched all only with their root form *corrupt*.

Preconfigurated stemming

The search engine packages are preconfigurated to stemming with following grammar out of the box for documents which language is autodetected by OpenNLP integrated in Apache Tika:
* English (EN)
* Spanish (ES)
* German / Deutsch (DE)
* French / Francais (FR)
* Portuguese (PT)
* Dutch (NL)
* Italian (IT)
* Czech (CZ)
* Romanian (RO)
* Russian (RU)
* Arabic (AR)
* Persian (FA)



More languages can be configured out of the box on demand (by the way would be nice, if you could donate us an translation of the search UI, too).


Change the stemmer
There is no perfect stemming algorithm for all situations but different more or less working stemming algorithms and implementations (stemmers).

To switch to a more or less aggressive stemmer, edit the field definition of your language fields.

For English grammar the field names are: `text_en` and `synonyms_en`, for German grammar the field names are `text_de` and `synonyms_de` and so on.

Learn more about stemming algorithms, free open source stemmers and their configuration:

[Stemming algorithms](https://en.wikipedia.org/wiki/Stemming)
[Choosing a stemmer](https://www.elastic.co/guide/en/elasticsearch/guide/current/choosing-a-stemmer.html)
[Stemming for Solr](https://wiki.apache.org/solr/LanguageAnalysis#Stemming)
[Stemming for Elastic Search](https://www.elastic.co/guide/en/elasticsearch/guide/current/stemming.html
)
Thesaurus (dictionary of linked words) and other ontologies (Linked Data)

Another feature to find more is to use a [thesaurus (a connected dictionary or a network of linked words or concepts)](../../../datamanagement/thesaurus) or other [ontologies (linked data structures)](../../../datamanagement/ontologies).

So for example the search engine can consider irregular verbs (for example *went* is not *go* with a suffix) and other irregular word forms, too.

Additionally you will be able to find not only different forms of the same words but additionally connected words like synonyms or hyponyms.

For example if you search for *purple* you would find *violet*, too.

An out of the box integration of a dictionary and thesaurus based on open data from [Wiktionary](https://www.wiktionary.org/) (the dictionary of Wikipedia) could be released next, if enough donations for that.

Please [donate](../../../../donate) with the subject Wiktionary for an earlier out of the box integration or if needed earlier, ask us for the config steps to setup this for your language (while setup you need a triplestore yet).

