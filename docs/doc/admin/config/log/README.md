---
title: Open Semantic Search logfiles
authors:
    - Markus Mandalka
---

# Logfiles

Locations of the log files:

## Webserver

Logfile of your Apache webserver for PHP based Search UI, Django based Open Semantic Search apps and some HTTP/REST APIS:

<code>/var/log/apache2/access.log</code>

If something went wrong you find more info in

<code>/var/log/apache2/error.log</code>.


## Open Semantic ETL

Full logs are written as <code>etl_task</code> to the logfile

<code>/var/log/syslog</code>

The last log entries of Open Semantic ETL can be seen by command

<code>service opensemanticetl status</code>

## Apache Tika

Logs of the main component Apache Tika for text extraction from files are written as <code>java</code> to the logfile

<code>/var/log/syslog</code>

The last log entries of Apache Tika can be seen by command

<code>service tika status</code>

and

<code>service tika-fake-ocr status</code>


## Apache Solr search server

Logfile of Apache Solr:

<code>/var/solr/logs/solr.log</code>

### Solr admin web interface

Visit the Solr admin interface (`http://localhost:8983/solr/`) and go to the menu "logging" (`http://localhost:8983/solr/#/~logging`) in the admin interface of Solr to see the last error messages.


## Verbosity

### Open Semantic ETL

Use the command line tool option -v or --verbose to be verbose while crawling, text extraction and data analysis.

Or set

Config `config['verbose'] = True` in <code>/etc/opensemanicsearch/etl</code> or in the special config file of only one connector to log more info.

### Solr PHP UI

Config `cfg['debug'] = true;` in the config of the User interface to see, what was communicated to and from Solr.
