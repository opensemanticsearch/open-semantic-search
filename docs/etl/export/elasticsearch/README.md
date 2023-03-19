---
title: ETL to Elastic Search index  
authors:  
    - Markus Mandalka
---

# ETL to Elastic Search index

This plugin indexes extracted and enriched data to [Elastic Search](../../elasticsearch).

To configure Open Semantic ETL or a Open Semantic Search connector config to index to Elastic Search, overwrite the output plugin settings in `/etc/opensemanticsearch/etl`:

`config['export'] = 'elasticsearch'`

Optionally you can set another Elastic Search indexname (default: `opensemanticsearch`).

`config['index'] = 'anotherIndex'`
