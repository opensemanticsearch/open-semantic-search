---
title: Command line interface (CLI)  
authors:  
    - Markus Mandalka
---

# Command line interfaces (CLI)

*Administration of Open Semantic Search via command line interface (CLI):*

## Task queue

Command line interfaces for managing tasks:

[Task queue management](../queue/README.md)


## Indexing files

### Index a file

`opensemanticsearch-index-file filename`

### Index directories

`opensemanticsearch-index-dir directoryname`

### Monitor files and directories

Index changed files in realtime (no expensive recrawl needed):

`opensemanticsearch-filemonitoring filename`

Or monitor and index all new and changed files in a directory recursively (including subdirectories):

`opensemanticsearch-filemonitoring directorynamename`

### Monitor directories automatically

If you installed the module `opensemanticsearch-trigger-filemonitoring-daemon` it will start automatically while booting and monitor all directories and files set in the config file `/etc/opensemanticsearch/filemonitoring`.

# Indexing Newsfeeds

## RSS-Newsfeeds

Index full feed from RSS (download and index all articles linked in a RSS-Newsfeed).

`opensemanticsearch-index-rss http://www.opensemanticsearch.org/feed`

# Delete from index

The delete tool will only delete data in the index once, so after new indexing or recrawl the deleted documents will be indexed again.

If you want to exclude documents from indexing, you should use blacklisting instead.

## Delete a web page from index

`opensemanticsearch-delete http://www.opensemanticsearch.org/`

## Delete a file from index

`opensemanticsearch-delete file:///directory/file`

## Empty the index

Empty the index to get a new or empty index without indexed documents:

`opensemanticsearch-delete --empty`

# Start or stop services

If you installed the Debian or Ubuntu packages, the services are started while booting automatically.

They can be controlled via the linux command service:

## Solr index service

Start:

`service solr start`

Stop:

`service solr stop`
