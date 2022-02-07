---
title: Open Semantic Search logfiles
authors:
    - Markus Mandalka
---

# Logfiles

Locations of the log files:

## Webserver

Logfile of your Apache webserver for PHP based Search UI, Django based Open Semantic Search apps and some HTTP/REST APIs:

`/var/log/apache2/access.log`

If something went wrong you find more info in

`/var/log/apache2/error.log`.


## Open Semantic ETL

Full logs are written with prefix `etl_task` to the logfile

`/var/log/syslog`

The last log entries of Open Semantic ETL can be seen by command

```
service opensemanticetl status
```

## Apache Tika

Logs of the main component Apache Tika for text extraction from files are written as <code>java</code> to the logfile

`/var/log/syslog`

The last log entries of Apache Tika can be seen by command

```
service tika status
```

and

```
service tika-fake-ocr status
```


## Apache Solr search server

Logfile of Apache Solr:

`/var/solr/logs/solr.log`

### Solr admin web interface

You can use the Solr admin interface (`http://localhost:8983/solr/`) by using the menu option "Logging" (`http://localhost:8983/solr/#/~logging`) to see the last error messages.


## Verbosity

### Open Semantic ETL

To be verbose while crawling, text extraction and data analysis, set the config option `config['verbose'] = True` in the config file `/etc/opensemanicsearch/etl` or in the special config file of a connector to log more info.

### Solr PHP UI

Config `cfg['debug'] = true;` in the config file of the User interface to see, what was communicated to and from Solr.
