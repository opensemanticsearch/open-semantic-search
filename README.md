# Open Semantic Search
https://opensemanticsearch.org

Integrated search server, ETL framework for document processing (crawling, text extraction, text analysis, named entity recognition and OCR for images and embedded images in PDF), search user interfaces, text mining, text analytics and search apps for fulltext search, faceted search, exploratory search and knowledge graph search

# Branches

There are two main branches in this Git repository:

Branch master for Python Django 2 (Django version in coming Debian and Ubuntu releases)

Branch django1 for Python Django 1 (Django version in current Debian and Ubuntu releases)

# Build

How to build the deb package for installation on Debian or Ubuntu server or the docker images for running in Docker containers:

## Build deb package

To build a deb package for Debian or Ubuntu, call the build script "build-deb" as user root (change user by su or sudo su):

./build-deb

## Build docker image

To build the Docker image, call "docker build" for this repository (if you are in this directory for ./) by the config file Dockerfile by following command:

docker build ./

Do the same for other Docker images, on which the search engine is dependent on:

docker build ./src/open-semantic-etl

docker build ./src/solr.deb

docker build ./src/spacy-services.deb

docker build ./src/tika-server.deb

All this Docker images are started together by "docker-compose" with the config file docker-compose.yml


# Dependencies

Dependencies are resolved automatically by building or by installation of the Debian or Ubuntu packages or by building the Docker images.

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

