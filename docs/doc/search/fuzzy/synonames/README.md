---
title: Find documents with different first name variants (Synonames)
authors:
    - Markus Mandalka
---

# Find documents with different first name variants (Synonames)


To quote an article about how [Synonames helps OCCRP investigate people across languages and alphabets](https://medium.com/occrp-unreported/an-%D0%B0%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80-by-any-other-name-819525c82d8
) "*A single name can have many equivalents when transliterated across writing systems or represented across cultures. A Russian named Александр might open a U.K. bank account as Aleksandr, while a German Friedrich might introduce himself to Americans as “Fred”.
These variations arise naturally with cross-cultural exchange, without any malicious intent, and the human brain can usually toggle between them effortlessly. But they pose a bigger problem in data-driven research.*"

To find documents that contain only such alternate first name variants, the full text search engine of Open Semantic Search integrates the multilingual open data knowledge of name variants from Wikidata extracted by the Open Source tool [Synonames](https://github.com/alephdata/synonames) as synonyms out of the box.

So if you do not disable the search option "Find other word forms, too" and search for the German first name "Markus", you will find documents which contain only the English variant "Mark", too.


## Full names and aliases


Synonames only "translates" single name parts (forename) for many names for all searches.

The advantage is, that this general forename synonyms often works for yet unknown people which are not part of your database, thesaurus or ontology, too.

But it does not know about full name aliases, fake names, former names and pseudonyms of concrete people or their aliases.

If you want to be able to find full name aliases with different forenames and different last names, too, you can [add aliases to your thesaurus](https://opensemanticsearch.org/doc/datamanagement/thesaurus) or [import some open data ontologies](../../../datamanagement/ontologies) like for example [lists of politicians of your parliament](https://opensemanticsearch.org/doc/datamanagement/opendata/wikidata) by the [ontologies manager](../../../datamanagement/ontologies) which suports multi word synonyms like full names or aliases, too.

So you can find work from Kurt Tucholsky published with his alias "Peter Panter" or documents about Angela Merkel containing "only" the variant "Angela Merkelova" or her former name "Angela Kasner", too.


## Open Source code and Open Data



The open source code to extract the open data knowledge on first name variants from Wikidata: [Source code repository of Synonymes](https://github.com/alephdata/synonames)

Our open source integration with the Solr Synonym Graph: [Source code repository of Synonames to Solr](https://github.com/opensemanticsearch/solr-synonames)