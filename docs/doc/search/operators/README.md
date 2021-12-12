---
title: Search operators and wildcards
authors:
    - Markus Mandalka
---

# Search operators and wildcards


*You can use and combine different search operators and wildcards in your search queries*:

# Wildcard searches


To perform a single character wildcard search use the "?" symbol.

To perform a multiple character wildcard search use the "*" symbol.

## Unknown or all parts with *


Multiple character wildcard searches with * looks for zero, one or more characters.

So
`corrupt*`
will find corrupt, corrupt*ion*, corrupt*ed* ... but not *anticorruption*
`*rupt`
will find corrupt or interrupt but wont find corrupt*ion* or interrupt*ion*...

`*rupt*`
will find corrupt, corruption, anticorruption, interrupt and interruption ...

You can also use the wildcard searches in the middle of a term:
`co*upt`
will find corupt or corrupt

## Single character wildcard


The single character wildcard search looks for terms that match that with the single character replaced.

For example, to search for "text" or "test" you can use the search:
`te?t`
# Boolean operators


Boolean operators allow terms to be combined through logic operators. Lucene supports AND, "+", OR, NOT and "-" as Boolean operators(Note: Boolean operators must be ALL CAPS).

## AND


`search engine`
will find all documents which contains the word *engine* AND the word *search*
`search AND engine`
would return the same results

## OR


`search OR research`
will find all documents which contains the word *search* or the word *research*
## Exclusion with - or NOT


The "-" or prohibit operator excludes documents that contain the term after the "-" symbol:

`search -engine`
or
`search NOT engine`
or
`search AND NOT engine`

will find all documents which contain the word search and do not contain the word engine

# Phrase searches


## Phrase search with double quotes



A Phrase is a group of words surrounded by double quotes such as
`"search engine"`
which will find exactly this phrase and will not find *i search an engine*
# Fuzzy searches


## Find results with typos or names not exactly pronounced by edit distance (Levensthein distance)



Fuzziness by edit distance is useful if you search for names you don't know how to spell exactly or if you want to consider typos in the documents or if some documents are images or scanned documents (like PDF documents containing scanned pages only in graphical formats instead of digital text), so you maybe find more documents for your query even if the results of automated text-recognition (OCR) are not perfect).

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
# Grammar (Stemming)


Considering [grammar rules to find other word forms, too (stemming)](../../admin/config/stemming), the search engine will find more.

For example if you search for *company corruption* you will find *companies corrupted*, too.

If you want only results matching exactly the spelling in your search query, you can disable stemming by disabling the option "Find other word forms, too".

If you disable stemming for the whole search query, you can enable it for single terms by using the operator `stemmed:`

If you enable stemming for the whole search query, you can disable stemming for single terms by using the operator `exact:`
# Grouping


## Combine criterias with OR, AND and parentheses



You can use parentheses to group clauses to form sub queries:

`(search OR research) AND (engine OR software)`
will find:
* documents containing the words *search* and *engine*
* documents containing the words *search* and *software*
* documents containing the words *research* and *engine*
* documents containing the words *research* and *software*
* documents containing the words *search* and *research* and *software* and *engine*



But it wont find a document containing the words *search* and *research* without at least one of the words *engine* or *software*.

Only one of the two last words would be enough, because connected with OR, but one of them is absolutelly neccecary because this criteria combination (connected by parantheses) is connected with AND
