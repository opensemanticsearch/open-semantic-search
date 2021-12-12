---
title: Manage Lists, Dictionaries, Vocabularies & Thesauri (Ontologies)
authors:
    - Markus Mandalka
---

# Manage Lists, Dictionaries, Vocabularies & Thesauri (Ontologies)


## Management of Lists of names or concepts, dictionaries, vocabularies, thesauri or ontologies for faceted search and ontology based text mining & document analysis



If there is an existing list, dictionary, vocabulary or thesaurus or if the entries are available in other structured format like an semantic web ontology yet i.e. from other tools or some [open data sources](../opendata), you don't need to [enter or manage manually each named entity like persons, organizations, locations or important words or concepts to your own thesaurus](../thesaurus) to be able to use them for [analytics, navigation, aggregated overview and interactive filters](../../search#faceted_search).

You can integrate or import additional, existing, shared or external list of names, thesauri, dictionaries, vocabularies or ontologies:


## Import external lists of names, thesaurus or ontologies



Just click on "Import List of Names, Thesaurus or Ontology" and upload an file or reference to an file or web resource.

![](../../../screenshots/import_ontology.png)


After klicking on "save" new documents will be analyzed by this thesaurus, ontology or list.

After klicking on "Apply" all old documents will be tagged with this ontology, too.

## Interactive filters and analytics by aggregated overview (Faceted search)


Use the search user interface and see the new search facet with the ontology or list name where you can see which names or concepts occur in how much documents and click on the name or concept to filter the results to documents where this name or concept occurs.

[Learn more about faceted search.](../../search#faceted_search)
## Formats



The formats will be autodetected:

### Plain text lists


This list can be a plain text file with one name in each line.

The charset / encoding should be autodetected.

In cases the autodetection doesn't work correct for some old standards or local charsets, convert/export your data with the universal charset `UTF-8` first.


### Ontologies and Thesauri


Or it can be an ontology in the open standards Resource Description Format (RDF), Simple Knowledge Organisation System (SKOS) or OWL.

Turtle format will follow (until then you can convert that to RDF format using a standard triplestore).

If you want only to import one language of a multilingual thesaurus or ontology, you can use a standard triplestore to filter the thesaurus using a SPARQL query to select only labels in your favorite language and use/import only that part of the graph.
 
### Spreadsheets and Tables (Excel or Open Office or Libreoffice Calc)


You can use data from tables or spreadsheets like Excel or Open Office Calc or Libre Office Calc or even columns from databases, too when there maybe will be an automatic import plugin for lists in this format, too (please donate).

Meanwhile you have to convert tables or databases which are not in RDF format or plain text format yet to plain text lists manually:
* Open the data with Excel or OpenOffice or Libreoffice Calc.
* Select the column with the names
* Copy the column with the names (click Edit > Copy in the main menu or press CTRL & c)
* Open a new table
* Paste that column with the names (click Edit > Paste in the main menu or press CTRL & v)
* Save the new table with only this column in CSV format. Since the table has only one column, you will get a plain text list file.
* Upload or reference this export file like described for open semantic web formats or plaintext lists.
