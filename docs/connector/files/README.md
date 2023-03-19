---
title: Crawl and index files, file folders or file servers  
authors:  
    - Markus Mandalka
---

# Crawl and index files, file folders or file servers


## How to index files like Word documents, PDF files and whole document folders to Apache Solr or Elastic Search?

This connector and command line tools crawl and index directories and files from your filesystem and index it to [Apache Solr](../../etl/export/solr) or [Elastic Search](../../etl/elasticsearch) for [full text search](../../doc/search) and [text mining](../../doc/analytics/textmining).

If you use Linux that means you can crawl whatever is mountable to Linux into an Apache Solr or Elastic Search index or into a triplestore.

## Index different file system types to Solr or Elastic Search

This can be a hard disk or: 
- partitions formatted with *fat*, *ext3*, *ext4*
- a file server connected via *ntfs*
- file shares like *smb* or even *sshfs* or *sftp* on servers
- private file sharing services like Seafile or OwnCloud on your own servers
- Dropbox, Amazon or other storage services in the cloud.

## Data enrichment by different data analytic tools

This connector integrates enhanced data enrichment and data analysis plugins like automatic text recognition (OCR) for images and photos (i.e. as files like PNG, JPG, GIF ...) or inside PDFs (i.e.scanned Documents) using Tesseract OCR.

## Usage

Index a file or directory:

### Web admin interface

Using the web admin interface
* Open the page *Files*
* Enter *filename* to the form
* Press button "crawl"

### Command line

Using the command line interface (CLI):
`opensemanticsearch-index-file *filename*`

### API

Using the REST-API:
`http://127.0.0.1/search-apps/api/index-file?uri=*/home/opensemanticsearch/readme.txt*`

## Config

Config file for indexing files: `*/etc/opensemanticsearch/connector-files*`
