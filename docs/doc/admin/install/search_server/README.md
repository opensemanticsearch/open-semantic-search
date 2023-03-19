---
title: How to install Open Semantic Search Server  
authors:  
    - Markus Mandalka
---

# How to install Open Semantic Search Server

## Open Semantic Desktop Search

If you are a user and want only search for yourself, you maybe want to use the [Open Semantic Desktop Search virtual machine](../../../desktop_search), which is easier to install for single end users.

## Open Semantic Search Server

How to setup a search engine on an intranet server running on an existing Debian GNU/Linux or Ubuntu Linux (web)server or within an existing virtual machine running a Debian GNU/Linux or Ubuntu guest:

### Debian GNU/Linux

1. [Download](../../../../download) the packages and modules you want to use
2. Get admin or super user (root): `su`
3. Install the packages: `dpkg --install open-semantic-search-server*.deb`
4. Install the dependencies: `apt-get -f install`

### Ubuntu Linux

1. [Download](../../../../download) the packages and modules you want to use
2. Install the package and its dependencies: `sudo apt install ./open-semantic-search-server*.deb`
3. After installation stops continue by typing in a `q` to end showing a status message of Solr installation script

## Index some files

Index some files (i.e. the documentation directory of Linux):
`opensemanticsearch-index-dir /usr/share/doc`

## Search

Open your browser and call the new alias `/search` on your Apache webserver i.e.:

`http://localhost/search`

Enter a [search query](../../../search/operators/README.md) and enjoy the [user interface for navigation, faceted search, exploratory search, interactive filters, analytics and visualizations](../../../search/README.md).

## Config

Set [config options by the web admin interface](../../config/README.md).

### Secure access

If you don't secure the used Apache webserver or this web application, all who can access your computers IP have full access to the search engine and so access to all indexed contents, too.

With its API and web apps in `/search-apps` it is possible to index data or tag documents.

If you don't want to secure the whole Apache web server (for example limit access to localhost or add a password protection with htaccess), you should limit access to the search in `/etc/solr-php-ui/apache.conf` and limit access to the REST-API and web apps in `/etc/opensemanticsearch-django-webapps/apache.conf` ...

The initial password for the Django admin interface (i.e. for adding tags that are usable for documents tagging) is `live`


### URL Mapping

If you want to setup a **document search based on local files as a website** with documents stored as local files in a local directory where users don't have access to your files and directories via the filesystem (`file://`) you can setup a mapping to another protocol (`http://`) and a directory where the files are available on your webserver.

You can set the config option for mapping in `/etc/opensemanticsearch/connector-files`, where you can find the explanation on how to do it.

### More config options

You will find other flexible options in the **config files** of other modules in `/etc/opensemanticsearch/`.

[Learn more ...](../../config/README.md)