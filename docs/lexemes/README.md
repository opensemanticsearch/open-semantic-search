---
title: Import Wikidata dictionary (lexemes) to Solr synonyms config  
authors:  
    - Markus Mandalka
---

# Import Wikidata dictionary (lexemes) to Solr synonyms config

## Open Source tool to import Wikidata lexemes to Solr synonyms config

The free Open Source tool wikidata-lexemes-to-solr-synonyms imports lexemes (dictionary including different grammar forms/lexical forms for each lexical entry) from Wikidata to Apache Solr search engine synonyms config.

## Grammar rules for search and information retrieval

Natural language processing of unstructured text is complicated, since the same words/meanings can occur in different grammar forms.

### Stemming

To find other grammar forms of words, the search engine uses [stemming](../doc/admin/config/stemming) heuristics, which for example cuts suffixes like -ing to find other grammar forms of the same words.

But such automatic heuristics can fail, especially for example on irregular verbs, where for example another grammatical form like "went" is not only "go" with a suffix (like f.e. -ing).

### Human curated dictionary (Linked Data Knowledge Graph of Lexemes as Open Data from WikiData)

By considering lexemes by import of Wikidata Lexemes as Solr search engine synonyms you find documents including many such more complicated / irregular grammar forms, too.

Hint: You can have a look and browse the structured data of lexemes in the structured data base and linked open data knowledge graph [WikiData](https://www.wikidata.org) by the web user interface [Ordia](https://tools.wmflabs.org/ordia/).

## Import Wikidata lexemes to Solr synonyms config

The lexemes import tool can be configured by following command line parameters and will be integrated to our web UI next.

### Command line options

```
Usage: wikidata-lexemes-to-solr-synonyms [options]

Options:
  -h, --help            show this help message and exit
  -s SOLR, --solr=SOLR  Solr URI like http://localhost:8983/solr/
  -c CORE, --core=CORE  Solr core/index name
  -r RESOURCE, --resource=RESOURCE
                        Solr managed synonyms resource where to store the
                        results
  -l LANGUAGE, --language=LANGUAGE
                        Language (Wikidata entity)
```

## Free Open Source Software (FOSS)

The Python & SPARQL based import tool is Free Software under the GPL license.

The Open Source code is available in the [Github repository opensemanticsearch/lexemes](https://github.com/opensemanticsearch/lexemes).
