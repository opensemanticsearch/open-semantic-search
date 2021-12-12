---
title: Config: Logfiles
authors:
    - Markus Mandalka
---

# Config: Logfiles


## Disable logging



Since we want privacy by default Solr logging is off by default.

But maybe you have not disabled the logfile of your Apache webserver, so search queries are logges in */var/log/apache2/* so disable logging in */etc/apache2*, too !

If debugging threre you can see in error.log if something went wrong with the user interfaces.

If there are no exceptions or aborts on the user interface level, debug deeper:

## What's going wrong with the connectors? Be verbose for debugging!


Use the command line tool option -v or --verbose to be verbose while crawling, text extraction and data analysis.

Config `config['verbose'] = True` in */etc/opensemanicsearch/etl* for the connectors or in the special config file of only one special connector to print more infos while indexing.

## Debugging search queries


Config `cfg['debug'] = true;` in the User interface to see, what was communicated to and from Solr.

The resulting queries can be debugged on Solr level by using Solr admin and analysis interface.

## Whats going wrong with the Solr server? Enable Solr logging!


If something fails on the Solr server, you may want to see logs of your tests.

If you use our preconfigurated Solr server in this case you have this posibilities:

### See last Solr errors at the admin web interface


Visit the Solr admin interface (`http://localhost:8983/solr/`) and go to the menu "logging" (`http://localhost:8983/solr/#/~logging`) in the admin interface of Solr to see the last error messages.

### Enable logfile


Enable Sor logfiles in */opt/solr/example/resources/log4jproperties*
### See on console whats going on


Stop your Solr service using
`service solr stop`

Go to the directory */opt/solr/example* and start Solr with
`java -jar start.jar` (additionally you have to set RAM here)

You will see debug infos on the terminal.

If you write output to a file by starting Solr with
`java -jar start.jar > /tmp/solr.log` (additionally you have to set RAM here)
it will log temporary to this file.
