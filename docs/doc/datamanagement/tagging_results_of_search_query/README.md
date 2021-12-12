---
title: Tagging by search query
authors:
    - Markus Mandalka
---

# Tagging by search query


You don't have to tag each document of a search result manually i.e. by the [tagger app](../annotation) to be able to use the interactive filter (faceted search) for the tag(s).

## How to tag all results of a search query automatically



The module [Multi-Tagger or Query-Tagger app](../../../solr-search-querytagger-python-django) searches for all results of a given search query and tags all found documents or files with the given tag in the given facet (i.e. "Tags", "Organization" or "Location")

So you can tag many documents at once with easy or with complex search queries.

## Usage



Insert a query (this can be a name or a [complex search query](../../search)).

Select the facet to which the tag should be added.

Optionally insert a value or tag.

Press submit and wait for a status how many documents were tagged.

## Use the user interface for creating search queries


If you don't want to type in a complex query, use the standard search user interface with its comfortable web interface for exploratory search and interactive filters (facets) and press "tag all results" there or select the view "show query" if you want to copy paste it to change or add some parts.


## Thesaurus for management of automatic tagging or rules based classification



This tool is for quick and dirty one time tagging, i.e. to structure an small one time investigation where no new documents will be indexed and where you don't have to store or manage this query.

If you want to store, manage and reuse such tagging queries and tag automatically and continuesly for all new data or documents matching a search query you might want to use the [thesaurus for named entities like organizations, persons, locations or concepts](../thesaurus), doing the same but automatically.