---
title: ETL to Solr search index  
authors:  
    - Markus Mandalka
---

# ETL to Solr search index

## ETL exporter configuration

To export the results of [document extraction, data analyis and data enrichment](../..) to a [Solr](http://lucene.apache.org/solr) search server (preconfigured default, if you use the Open Semantic Search packages), set the output Plugin to `export_solr`:

`config['export'] = 'export_solr'`

## Solr server configuration

If not default *http://localhost:8983/solr/* configure `config['solr']` to your Solr server, for example:

`config['solr'] = 'http://localhost:8983/solr/'`

## Solr core configuration

`config['index'] = 'core1'`
