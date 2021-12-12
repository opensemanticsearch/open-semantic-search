---
title: Filesystem monitoring
authors:
    - Markus Mandalka
---

# Filesystem monitoring


## (Re)index new or changed files within seconds and find new or changed content in document files much earlier



Despite some [limitations](#limitations) and after a first [initialization time of the file monitoring tools on start](#limitations), monitoring files and directories is a fast and efficient method to hold up to date the search index for your files or fileshare:

Instead of (re)crawling all directories and checking each file if new or changed, the operating system notifies the filemonitoring service when a file was changed or added.

So changed documents or new files can be indexed and found within seconds and without recrawl often, since frequent recrawls would burn many resources and can take a while, if there are tens of thousands of files, hundreds of thousands of files or even more.


## Commandline tool (CLI)


(Package: *opensemanticsearch-trigger-filemonitoring*)

Monitor path(s) given as command line parameter:
`opensemanticsearch-filemonitoring *pathname*`

Monitor all files and directories listed in *configfilename*:
`opensemanticsearch-filemonitoring --fromfile *configfilename*`
containing one directory or file per line.


## Automatically starting system service (Daemon)


(Package: *opensemanticsearch-trigger-filemonitoring-daemon*)

The daemon runs in the background as a system service and will start automatically while booting.

### Directories and files to monitor


It monitors the paths and files listed in the config file (one directory or file per line)
*`/etc/opensemanticsearch/filemonitoring/files`*
### Restart daemon after config changes


After config changes (i.e. adding new paths or filenames which are not subpaths of yet monitored paths) restart it with:
`systemctl restart opensemanticetl-filemonitoring`
## File monitoring on remote fileserver


(Package: *opensemanticsearch-trigger-filemonitoring-daemon-remote*)

The file monitoring daemon is available as a lightweight remote package for remote fileservers, which only calls the search API of the remote search server.

### Directories and files to monitor


List the directories or files you want to monitor into the config file
`/etc/opensemanticsearch/filemonitoring/files`
containing one directory or file per line.

### Config remote API address


Change the IP address of your search servers and the URL of its API in the config file `/etc/opensemanticsearch/filemonitoring/config`:

`config['api'] = "http://192.168.1.1/search-apps/api"`
### Blacklisting


Like on the search server (later in the indexing process), the remote filemonitoring daemon supports [blacklisting](../../doc/admin/config/blacklist) too, so there is no network load to API because of changed files in blacklisted directories, blacklisted filename patterns or blacklisted file endings.

## Limitations


Even if filesystem monitoring needs much fewer resources than frequent recrawls, you should be aware of some limitations:

### Inotify config


You have to increase the kernel parameter
`fs.inotify.max_user_watches`
to a size fitting your count of monitored directories and files.

Well prepare an easy to change conig file for that in the next version.

### Initialization time


On start the filemonitor has to walk recursivly trough all monitored directories and subdirectories to set up an inotify monitoring for this directories.

This can take a while: The initialization time can need some minutes to even some dozens of minutes, if the fileserver has hundred thousands of directories.

There will be some CPU load and high IO load on the harddrives while initialization. But after this initial directories scan and monitoring setup, it needs much fewer resources than recrawls.

While this initialization time not all directories are scanned and so not initialized for monitoring yet, so the file monitoring can not trigger (re)indexing of new or changed files.

### Passed filesystem changes


So while initialization time after boot or restart of the filemonitoring service and because sometimes the system can by so busy, that the file monitoring can pass some notify events for file changes, you should do from time to time an classic recrawl. This can run at night or on weekend and be started automatically by the Cron service.


## Used methods and libraries


Technically the Linux kernels *inode notify* subsystem [inotify](https://en.wikipedia.org/wiki/Inotify) notifies when the filesystem writes a file in a monitored directory, so we can react relatively fast when there is new or changed file.

So the command line tool or the daemon *OpenSemanticSearch-Trigger-Filemonitoring* based on the Python library [PyInotify](https://packages.debian.org/stable/python-pyinotify) will notice that and will start the crawler (communicating over [REST-API](../../doc/admin/rest-api)) to *[(re)index the file](../../connector/files) that is new or was changed*.