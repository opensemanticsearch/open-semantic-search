---
title: How to install Open Semantic Search Server
authors:
    - Markus Mandalka
---

# How to install Open Semantic Search Server


# Set up a search engine server in a few steps


## Open Semantic Desktop Search



If you are an user and want only search for yourself, you maybe want to use the [Open Semantic Desktop Search virtual machine](../../../desktop_search), which is easier to install for single end users.


## Open Semantic Search Appliance


If you have a virtual machine host with a virtualization software like Virtual Box, you might want to use the preconfigured virtual machine [Open Semantic Search Appliance (Search Server VM)](../search_appliance).

## Open Semantic Search Server



How to setup a search engine on an intranet server running on an existing Debian GNU/Linux or Ubuntu Linux (web)server or within an existing virtual machine running a Debian GNU/Linux or Ubuntu guest:


### Debian GNU/Linux


1. [Download](../../../../download) the packages and modules you want to use
2. Get admin or super user (root)
`su`
3. Install the packages:
`dpkg --install open-semantic-search-server*.deb`
4. Install the dependencies:
`apt-get -f install`


### Ubuntu Linux


1. [Download](../../../../download) the packages and modules you want to use
2. Install the package and its dependencies:
`sudo apt install ./open-semantic-search-server*.deb`
3. After installation stops continue by type in a `q` to end showing a status message of Solr installation script


## Index some files


Index some files (i.e. the documentation directory of Linux):
`opensemanticsearch-index-dir */usr/share/doc*`
## Search


Open your browser and call the new alias */search* on your Apache webserver i.e.:

`*http://localhost/search*`

Enter a [search query](../../../search/operators) and enjoy the [user interface for navigation, faceted search, exploratory search, interactive filters, analytics and visualizations](../../../search).



## Config


If we get enough support ([please donate](../../../../donate)), there will be a web interface for configuration in the next weeks or months.

Until then you can config the search engine in following config files:

### Secure access


If you dont secure the used Apache webserver or this web application, all who can access your computers IP have full access to the search engine and so access to all indexed contents, too.

With its API and web apps in `/search-apps` it is possible to index data or tag documents.

If you dont want to secure the whole Apache web server (for example limit access to localhost or add a password protection with htaccess), you should limit access to the search in `/etc/solr-php-ui/apache.conf` and limit access to the REST-API and web apps in `/etc/opensemanticsearch-django-webapps/apache.conf` ...

The initial password for the Django admin interface (i.e. for adding tags that are usable for documents tagging) is `live`
### Language


Maybe you want to change the **language**, so config the UI in `/etc/solr-php-ui/config.php`

More important because not changeable for yet indexed documents is to [set or change the language(s) for stemming](../../config/stemming) before indexing documents.

### URL Mapping


If you want to setup a **document search based on local files as a website** with documents stored as local files in a local directory where users don't have access to your files and directories via the filesystem (*file://*) you can setup a mapping to another protocoll (http://) and a directory where the files are available on your webserver.

You can set the config option for mapping in `/etc/opensemanticsearch/connector-files`, where you can find the explaination how to do it.

### OCR


If you want to setup **automatic textrecognition**:

Install the package `tesseract-ocr` and enable OCR in `/etc/opensemanticsearch/connector-files`.

The language for OCR is set in */etc/opensemanticsearch/etl*. If not English, you have to install the configured language package for Tesseract (for example the Debian package `tesseract-ocr-deu` for German).

[Learn more](../../config) ...

### More config options


You will find another flexible options in the **config files** of other modules in `/etc/opensemanticsearch/`.

[Learn more ...](../../config)