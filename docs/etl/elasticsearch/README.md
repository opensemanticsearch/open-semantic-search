---
title: Index legacy documents, files and directories & file shares to Elastic Search  
authors:  
    - Markus Mandalka
---

# Index legacy documents, files and directories & file shares to Elastic Search

## How to index document files like Word documents or PDF files, file directories and file shares to Elastic Search with open source tools?

You can import files, documents, directories and file shares to Elastic Search index with the Open Semantic ETL framework and its files connector (all components are free software & open source):


## Example

1. Download and install Open Semantic ETL Elastic Search edition package
2. Index a directory with document files:
`opensemanticsearch-index-file */home/user/Documents*`
3. Search the content of the files with Elastic Search or Kibana.

## Installation

Install a preconfigured Open Semantic ETL package (Please donate: or Open Semantic Desktop Search and Open Semantic Search appliance) with the flavour "elastic search"-edition.

or

install Open Semantic ETL and [set in the config file /etc/etl/config the option "export" to "elasticsearch"](../export/elasticsearch).

## Data enrichment and data analysis

Documents are analyzed and enriched by enhancer plugins.

For example image files or images inside PDF documents are enriched by automatic textrecognition (OCR), so it is possible to find text even in graphic format based PDFs like scans or photographed documents.

## Config language for OCR

For better OCR results you can configure another language (default language: english).

## Alternate methods to start indexing files

To import / index directories, documents and files you can use one of our standard tools and system integrations:
* Just [add to shared folder to the Open Semantic Search Virtual Machine](../../doc/admin/install/desktop_search) like Open Semantic Desktop Search or Open Semantic Search Appliance
* [Command line tools](../../connector/files) (so you can integrate with own scripts or standard Linux tools like Cron)
* Plugins for file managers like Nautilus or the Windows Filemanager
* Firefox Plugins
* Web API (REST API)
* [File monitoring tools](../../trigger/filemonitoring)

## Search user interface

After document processing and indexing you can use the Open Source user interface [Kibana](https://www.elastic.co/products/kibana) for full text search in your files and documents.

## Performance

We've got a first donation to improve performance, so only few donations are neccessary so one of the next versions will be able to index more documents in less time. More about how to increase performance soon.

## Import CSV files

Standard CSV tables are indexed automatically, soon.

Please donate so we can release the CSV Manager UI for Elastic Search sooner, so you can import very big CSV files in a more structured form and import non-standard CSV files easier.

## Elastic Search based Desktop Search

A very easy to install and fully preconfigured [Open Semantic Desktop Search](../../doc/admin/install/desktop_search) Elastic Search and Kibana flavoured Virtual Machine is planned.

Please donate to realize this earlier.

## Named entities extraction

Please donate so we can release the Thesaurus for Named Entity Extraction for Elastic Search sooner.
