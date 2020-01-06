# Open Semantic Search
https://opensemanticsearch.org

Integrated search server, ETL framework for document processing (crawling, text extraction, text analysis, named entity recognition and OCR for images and embedded images in PDF), search user interfaces, text mining, text analytics and search apps for fulltext search, faceted search, exploratory search and knowledge graph search

# Dependencies

Dependencies are resolved automatically by installation of the Debian or Ubuntu packages.

Documentation on this dependecies which may help debugging dependency hell issues or installations in other environments:

## Build dependencies on Source code (GIT)

Dependencies on other Git repositories / submodules of components like Open Semantic ETL are defined in the Git config file .gitmodules

The submodules will be checked out automatically to the subdirectory "src", if you check out this repository by git in recursive mode.

## Packaging dependencies of Java archives (JAR)

The submodules tika.deb and solr.deb need the JAR of Apache Tika-Server and Apache Solr.

If not there, they will be downloaded from Apache Software Foundation by wget in the submodule "build" script or its "Dockerfile".

## Installation dependencies on Debian/Ubuntu packages (DEB)

Dependecies of tools and libraries, which are available in the Debian or Ubuntu package repositories, are defined in the section "Depends" of the deb package config file DEBIAN/control

https://github.com/opensemanticsearch/open-semantic-search/blob/master/DEBIAN/control

## Installation dependencies on Python packages (PIP)

Dependecies of Python libraries which are not available as packages of the Linux distribution but in Python Package Index (PyPI), are defined in

https://github.com/opensemanticsearch/open-semantic-etl/blob/master/src/opensemanticetl/requirements.txt

This dependencies will be installed automatically on installation of the Debian/Ubuntu packages by DEBIAN/postinst of the Debian/Ubuntu packages or by docker build configured by Dockerfile by

pip3 install -r /usr/lib/python3/dist-packages/opensemanticetl/requirements.txt

