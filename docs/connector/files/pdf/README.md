---
title: Index PDF files for search and text mining with Solr or Elastic Search
authors:
    - Markus Mandalka
---

# Index PDF files for search and text mining with Solr or Elastic Search


## How to index a PDF file or many PDF documents for full text search and text mining



You can [search](../../../doc/search) and do [textmining](../../../doc/analytics/textmining) with the content of many PDF documents, since the content of PDF files is extracted and text in images were recognized by optical character recognition (OCR) automatically.

## Indexing a PDF file to the Solr or Elastic Search


Therefore you have to index the PDF documents or file directories or file shares that contain PDF documents to the Solr or Elastic Search server index:

### Desktop search


If you use [Open Semantic Desktop Search](../../../doc/desktop_search), just copy the PDF files to a directory that is indexed automatically or add the directory with the PDF files to shared folders for indexing and restart the virtual machine or press the "Index" button within the VM.

### File monitoring


If you use an file share where [file monitoring](../../../trigger/filemonitoring) is active, just copy the PDF files to an monitored folder or file directory and wait, until they are indexed automatically.

### Web admin interface



Using the web admin interface
* Open the page *Files*
* Enter *filename* of the PDF file to the form
* Press button "crawl"


### Command line


Using the command line interface (CLI):
`opensemanticsearch-index-file *filename*`
### API


Using the REST-API within your tools, script or within your browser:
`http://127.0.0.1/search-apps/api/index-file?uri=*/home/opensemanticsearch/document.pdf*`
## Indexing a folder with PDF files to the Solr or Elastic Search


You can index whole folders with PDF documents to Apache Solr or Elastic Search the same way. Just use the name of the file directory or folder instead of a single file name.

## Config


Config file for indexing files: `*/etc/opensemanticsearch/connector-files*`