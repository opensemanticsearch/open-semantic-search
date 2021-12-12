---
title: Fuzzy search
authors:
    - Markus Mandalka
---

# Fuzzy search


## How to find results despite incomplete or imperfect search queries, misspelled names, typos and low text quality or low OCR quality



If you're sure that all search query terms are in the document(s) you search, you can search with the default operator AND.

If you search for a exact sentence or phrase (all search terms in exact this form and order with no other words in between), you can switch to "Phrase search".

But if you're not sure about all terms, you can use and combine different search techniques like the OR operator and scoring, wildcards, stemming, synonyms and fuzziness:


![](../../../screenshots/semantic.png)

## Use OR operator and sort by scoring


If you use / switch to the OR operator, you will often find results without all search terms in the documents (but often relevant, since one your searched term may occur in other form).

But even getting many irrelevant results in which only a small part or even a single word of your search query occurs, if using this search paradigma:

The more of your search terms occur in the document, the higher is the document is scored and you will see documents with most matches on top.

So you will often find documents even if one of your search terms is misspelled or not exact the same concept used in the document.


## Find alternate word forms (Stemming)


Considering [grammar rules to find other word forms, too (stemming)](../../admin/config/stemming), the search engine will find more.

For example if you search for *company corruption* you will find *companies corrupted*, too.

If you want only results matching exactly the spelling in your search query, you can disable stemming by disabling the option "Find other word forms, too".

If you enable stemming for the whole search query, you can disable it for single words / terms by using the operator `exact:`

But such automatic heuristics can fail, especially for example on irregular verbs, where for example another grammatical form like "went" is not only "go" with a suffix (like f.e. -ing).

### Human curated dictionary of grammar forms and synonyms (Linked Data Knowledge Graph of Lexemes as Open Data from WikiData)


By considering lexemes by import of Wikidata Lexemes as Solr search engine synonyms you find documents including many such more complicated / irregular grammar forms, too.

Hint: For manually find variants for your search, you can browse the structured data of lexemes and synonyms in the structured data base and linked open data knowledge graph [WikiData](https://www.wikidata.org) by the web user interface [Ordia](https://tools.wmflabs.org/ordia/).

#### Import Wikidata lexemes to synonyms config



The lexemes import tool can be configured by [command line parameters](../../../lexemes) and will be integrated to our web UI next.



## Find unknown word parts with wildcards


Multiple character wildcard searches with * looks for 0 or more characters.

So
`corrupt*`
will find corrupt, corrupt*ion*, corrupt*ed* ... but not *anti*corruption

`*rupt`
will find corrupt or interrupt but wont find corrupt*ion* or interrupt*ion*...

`*rupt*`
will find corrupt, corruption, anticorruption, interrupt and interruption ...

You can also use the wildcard searches in the middle of a term:
`co*upt`
will find corupt or corrupt


## Find results with typos (or if not sure how to spell a name) by edit distance (Levensthein distance)



Fuzziness by edit distance is useful if you search for names you don't know how to spell exactly.

Or if you want to consider typos or misspelled names in the documents.

Or if some documents are images or scanned documents (like PDF documents containing scanned pages only in graphical formats instead of digital text), so you maybe find more documents for your query even if the [results of automated text-recognition (OCR) are not perfect](../../admin/config/ocr), i.e. because single chars were recognized wrong.

To do a fuzzy search use the tilde, "~", symbol at the end of a single word / term you want to search with fuzziness.

For example to search for a term similar in spelling to "*roam*" use the fuzzy search:

`roam~`

This search will find terms like *foam* and *roams*.

`similar~ words~`
would find not only *similar words* but *similer works*, too because both words are set to fuzzy search.


### Setting maximal edit distance (number of chars, that may differ)


If you use the ~ operator for fuzziness, the default maximal edit distance is two chars. This is the maximal number of chars that can be changed, added or deleted to match a term that is searched with fuzziness.

To change the maximum number of changeable chars, set the number after the ~ operator.

Example:
`searchterm~3`
## Proximity search to find name variants with additional name parts in between



A proximity search looks for terms or name parts that are within a specific distance from one another.

So a proximity search for
`"Barack Obama"~2`
will find name variants like *Barack Hussein Obama*, too, which would not be found by a phrase search for "Barack Obama".

To perform a proximity search, add the tilde character ~ and a numeric value to the end of a search phrase.

The numeric value sets how many words may maximal occur in between (the maximal distance of term movements needed to match the specified phrase).


## Find synonyms and hyponyms


If you don't switch that off for your query by disabling search for synonyms in advanced search options and you don't use the operator "exact:" for the search term, the search engine can find synonyms (f.e. if you search for car you want to find automobile, too) and hyponyms (if you search for a car, you want to find truck, too).

You can [setup synonyms](../../admin/config/synonyms) with the [thesaurus manager](../../datamanagement/thesaurus). Just add a name or concept with the synonym as an alias or import a thesaurus or ontology with synonyms to the [ontologies manager](../../datamanagement/ontologies).

Please donate so we can integrate (technically existing) features with open data from Wiktionary, so most synonyms and more forms of irregular verbs ("went" is not only "go" with a suffix) will be preconfigured out of the box.


## More like this (Term vector model)


Based on a relevant document find other documents with many same words ("more like this").

Please donate...

## Find similarity by machine learning (Latent Dirichlet allocation (LDA), clustering, classification, co-ocurrences)


Find documents with related words (not only the same words in other forms or synonyms).

Please donate...