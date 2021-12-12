---
title: Data enrichment module for Named Entity Extraction of managed Named Entities
authors:
    - Markus Mandalka
---

# Data enrichment module for Named Entity Extraction of managed Named Entities


Named Entities Manager is an user interface (webapp) for management of named entities like persons of interest, organizations, locations or concepts.

So a data enrichment module for rule based or text pattern based Entity Extraction or list or ontology based Named Entity Extraction or a integrated framework for Named Entity Recognition (NER) can recognize them and tag them for exploratory search like aggregated overviews and interactive filters.


## Usage



See the [user documentation](../../doc/datamanagement/named_entities)
## Installation


* download the module *opensemanticsearch-ner-python-django*
* Copy the directory *entities* from the zip file into your Django apps directory
* Enable the new app:

Add "*entities*" to your INSTALLED\_APPS setting like this:


`INSTALLED_APPS = (
 ...
 'entities',
 )`* Include the entities URLconf in your project urls.py like this:
`url(r'^entities/', include('entities.urls', namespace="entities")),`
* Call `http://localhost/search-apps/entities/apply` after each data import or after editing your entities or by Cron from time to time until this module will be better integrated into the connectors by - instead of search for each query after indexing - compare the data with all queries before indexing, since such queries can not be only static strings (which are extracted on indexing time automatically without searching for them) but can be complex queires with wildcards and boolean operators, too.
