---
title: Recommender for thesaurus entries
authors:
    - Markus Mandalka
---

# Recommender for thesaurus entries


## Recommender for misspelled names or OCR errors


Since no automatic textrecognition (OCR) is perfect and there are typos in documents you didn't write yourself and can not change or since your users will write terms wrong in their search queries, you can [manage typos and OCR failures in the thesaurus](../../thesaurus#hiddenlabel):

For each concept or name you can define hidden labels or misspellings i.e. with misspelled variants of the name or concept, so the name or concept will be found, too, even if it is misspelled in the documents.

The recommender can generate automatic recommendations of such [hidden labels](../../thesaurus#hiddenlabel) of misspelled names by [finding such typos by edit distance (levensthein distance) on variants of misspelled text](../../../search/fuzzy#editdistance) inside your documents (text corpus).


## Grammar based recommender for alternate labels



Using [stemming](../../../search/fuzzy#stemming) you can analyse and add other word forms of same term despite morphology of verbs (decline) on the base of multiple stemmers.


## Compounded words linking by semi-automatic recommender



For easy managing of compounded words, the recommender shows you automated recommendations for compounded words from your documents (corpus), so you can add and link them with only a few clicks.

You have the choice to link them as a synonym or as a broader or narrower term.

Compounded words are found by [wildcards](../../../search/fuzzy#wildcards).

## Solr config


To be able to work with the recommender you have to switch the option "stored" to true for the fields \_text\_ and stemmed in the managed-schema config and setup all cach-all fields for all stemmers you want to use with the option stored enabled.

