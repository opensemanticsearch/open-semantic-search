---
title: Scaling and increasing performance by parallel processing, server clusters & buffers for writing  
authors:  
    - Markus Mandalka
---

# Scaling and increasing performance by parallel processing, server clusters & buffers for writing

## How to index, search and explore big data faster by scaling and optimizing data processing

This is a tutorial on how to index very large document sets faster to enable faster search or analysis. This tutorial is not about [how to analyse, search, explore & filter big document collections](../../search).

## Indexing only filenames for (very fast) exploration and filtering by filenames

First index only the filenames, which doesn't take much time. You can explore, filter and find the most interesting paths or filenames without wating for completition of a full run maybe indexing long time many directories and files, that are not so interesting and for example start first processing of very interesting parts.

Therefore first run indexing using only with the `enhance_path` plugin:
`opensemanticsearch-index-file --plugins enhance_path dirname`

This will be very fast, because only indexing the paths and file names without extraction of other metadata or content.

After you are able to search all existing filenames you can first or additionally (parallel) index very interesting paths or files.

## Doing expensive tasks like optical character recognition (OCR) later by disabling expensive data enrichment plugins for the first indexing run

Data enrichment with OCR needs a lot of time and CPU ressources for only some percent of additional content.

So you might want to disable OCR and do a first full indexing without OCR to be able to search & analyze most parts of your data much earlier and meanwhile running a second forced indexing with OCR in the backround (after activating OCR again or based on an additional config file), later or at night.

So you can do a first run or standard runs without OCR:

Therefore disable OCR in `/etc/opensemanticsearch/etl` and in your Tika config (inside `/usr/share/java/tika-server.jar`) or just temporarily deinstall `tesseract-ocr`.

### Second run with enabled OCR
Enable OCR in your configs again.

If you just deinstalled `tesseract-ocr`, don't forget to install this package and your additional OCR language packages (for example `tesseract-ocr-deu` for german) again.

Force a second run with
`opensemanticsearch-index-dir --force *dirname*`

Or enrich yet indexed data with the OCR plugin from time to time or after indexing by running the data enrichment tool for only the OCR plugin, so other plugins have not to run again.

## Parallel processing of data extraction and data enrichment

If there is more than one processor available, tasks like extracting text from documents and OCR will be calculated by parallel processing for multiple files simultanously so that all available processors will be used.

So if working within a virtual machine (like for example Open Semantic Desktop Search), don't forget to set up more or all processors for the virtual machine settings (in the vertical tab *System* and horizontal tab *Processor*).

You can even use additional computers for a machine cluster, so multiple processors on multiple computers will be used.

## Parallel processing of indexing and search with server cluster for the index (Solr cluster)

Too many or too slow searches?

You can scale the Solr index from a single Solr index server and search server to a search cluster (Solr cloud) on multiple servers to share the load of many searches.

## ETL cluster for extracting text and OCR

Too slow while indexing too many documents?

With additional servers with installations of Open Semantic ETL for time intensive data processing or document processing like text extraction or OCR, if you give them access to the files and to your index server.

Hint: preconfigurated Solr is open only from localhost, so open the Port for the other workers of your ETL cluster.

Or if you use Hadoop, you can index files parallel using the whole Hadoop cluster with [Map Reduce Indexer Tool](http://www.cloudera.com/content/cloudera/en/documentation/core/latest/topics/search_mapreduceindexertool.html#csug_topic_6_1).

## Donate

You can [donate to the open source project](../../../donate) to get an optimized version and simple user interfaces for indexing faster (for example fast indexing without OCR with one click and doing OCR later while you are able to search in most data much sooner or easy to handle packages for setting up a cluster).`