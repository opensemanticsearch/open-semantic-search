---
title: Open Semantic ETL: Export results to JSON  
authors:  
    - Markus Mandalka
---

# Open Semantic ETL: Export results to JSON

This is one of the output plugins for standalone installations of Open Semantic ETL without a full search engine, for example for some data analysis, enrichment or jobs saved to an output file or to another (maybe light-weight) database.

If you set `config['export'] = 'export_json'`, the output of `etl-file *filename*` or `etl-web *url*` will be exported as JSON.

To write the JSON output to a file, set the argument `--outputfile`, for example

`etl-file --outputfile *outputfilename* *inputfilename*`

or

`etl-web --outputfile *outputfilename* *uri*`

## API with JSON results

If you use output plugins to write your data to a search index like [Solr](../../../open-semantic-etl/export/solr) or [Elastic Search](../../../open-semantic-etl/export/elastic_search), you can read and filter it with their more powerful search APIs.

For example [REST-API of Solr](http://lucene.apache.org/solr/quickstart.html#searching) for searching or / and getting data in XML or [JSON](https://cwiki.apache.org/confluence/display/solr/Using+JavaScript) format or use [Solr Client APIs](https://cwiki.apache.org/confluence/display/solr/Client+APIs) to get data with your favorite programming language.
