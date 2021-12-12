---
title: Solr Server (Daemon)
authors:
    - Markus Mandalka
---

# Solr Server (Daemon)


## Solr package for Debian and Ubuntu


This Debian package and Ubuntu package is a preconfigurated [Apache Solr](http://lucene.apache.org/solr) server running as a daemon providing important settings like integration of the [thesaurus editor](../doc/datamanagement/thesaurus) and ontologies manager, settings for more performance, disabled logging and security settings and a more current Solr version than the [packages of the Debian](https://packages.debian.org/search?suite=stable§ion=all&arch=any&searchon=sourcenames&keywords=lucene-solr) or Ubuntu standard repositories.

# Settings of preconfigured Solr package


## Disabled Logfiles


**Disabled logfiles**: we don't want to write each search query to Solr logs. If you want to switch on logging for debugging purposes, switch on `file` and `console` the config file `/var/solr/log4j.properties`
## Autocommits


**Automatic commits** to the index after 15 seconds after adding or update of documents (autocommit=15000)

## Running as daemon


**Automatic start on booting** since running as daemon in Debian GNU/Linux or Ubuntu Linux.


## Increase maximum RAM settings of the Java Virtual Machine (JVM)


**Automatic memory settings**: In most cases no manual setting of Java virtual machine options needed anymore. Allows the Java VM to use as much RAM as possible at this server, so you wont get problems because of default Java Virtual Machine (JVM) maximal RAM settings (option *-Xmx*) if indexing very much data or large documents.

## Swappiness


**Disabled swappiness**, so the system will only swap if necessary. So it doesn't to optimize RAM for running software swapping the Solr index and search caches automatically after some time because they are not used for some time. Why? Even if some parts of the Solr index and caches in RAM are not used for long time (f.e. if search isn't used for the night or some days) and that RAM could be used by other software meanwhile to: To read hundrets of MB or some GB from Swap on slower harddisks to RAM again because of using again while the first search after long time would lead to timeouts and errors on maybe important searches, which than could take tens of seconds more time.

## Access only from localhost


For security reasons access to the Solr search server is only possible from the same computer.
So **[access is only possible from localhost](#localhost)**, so that if you set a password to the User Interfaces module *solr-php-ui* and the search apps nobody without an account on your computer or an account for a service on your computer can read all data from unprotected Solr instead

To enable Solr remote admin access from other computers than localhost you have to edit jetty-http.xml and delete the default="127.0.0.1" from the config option "host". Then restart Solr by `service solr restart`.

Warning: You don't want to enable access to unprotected Solr server with the possibility to read, add, change or delete all indexed data for everybody on the net or internet! So if the computers are part of a network you can not fully trust, you have to protect the IP of the Solr server or the Solr port for example by a firewall.

## Solr schema


There are additional fields and stemming configured in the Solr schema. You can read the XML schema config in `/var/solr/data/core1/conf/managed-schema` which is based on the Solr example config set `/opt/solr/server/solr/configsets`, so you can use a diff tool to compare and see the config additions.

Additionally the ETL and search tool add & use some additional fields with are created automatically by Solr dynamic fields feature configured for the schema because of type endings like \_b \_s or \_tt. You can see such additional fields by the table view.