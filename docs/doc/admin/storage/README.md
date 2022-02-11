---
title: Data storage locations
authors:
    - Markus Mandalka
---

# Data storage locations

In which paths and directories Open Semantic Search stores your data:


## Logfiles

See separated [documentation of logs](../config/log/README.md).


## Database (Open Semantic Search Apps)

The *Django* database of the search apps with your thesaurus, ontologies, facets config and your config by web (Admin UI) is stored in a **SQLite DB** in
`/var/opensemanticsearch/db/`

Uploaded Ontologies files and Lists are stored in
`/var/opensemanticsearch/media/ontologies/`


## Search index (Solr)

The *Apache Solr* search indexes are stored in

`/var/solr/data/`

The document index is located in

`/var/solr/data/opensemanticsearch/`

The entities index of *Open Semantic Entity Search API* is located in

`/var/solr/data/opensemanticsearch-entities/`


## Tasks queue (RabbitMQ)

The *RabbitMQ* task queue is stored in the standard location of the [Debian Package `rabbitmq-server`](https://packages.debian.org/de/bullseye/rabbitmq-server):

`/var/lib/rabbitmq/`


## OCR cache (Tesseract-OCR-Cache)

The OCR cache containing the plain texts of images in documents that had been processed by *Tesseract-OCR-Cache* is stored in

`/var/cache/tesseract/`
