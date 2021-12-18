# Open Semantic Search
https://opensemanticsearch.org

Integrated search server, ETL framework for document processing (crawling, text extraction, text analysis, named entity recognition and OCR for images and embedded images in PDF), search user interfaces, text mining, text analytics and search apps for fulltext search, faceted search, exploratory search and knowledge graph search


# Documentation

The documentation is available in Markdown format in the directory <code>[docs](docs)</code>.

## Generate HTML
A HTML site of this documentation can be build by the static site generator [MkDocs](https://www.mkdocs.org/) with the config file <code>[mkdocs.yml](mkdocs.yml)</code>:

Therefore install mkdocs (for example by `apt install mkdocs`) and call:

`mkdocs build`

After that the documentation is available as static HTML site in the directory <code>site</code>.

This will be integrated with the UI and the build process of the software packages in next release, so full documentation will be available in the UI of each installation.


# Build

How to build the deb package for installation on Debian or Ubuntu server or the docker images for running in Docker containers:


## Build deb package

To build a deb package for Debian or Ubuntu, call the build script "build-deb" as user root (change user by su or sudo su):

```
./build-deb
```


## Build docker images

Clone the repository including the dependencies : 

```
git clone --recurse-submodules --remote-submodules https://github.com/opensemanticsearch/open-semantic-search.git
```

Inside the opensemanticsearch directory, build the Docker images use the docker-compose config docker-compose.yml : 
```
cd opensemanticsearch
docker-compose build
```

After these builds all the Docker images/dependencies/services can by started together by docker-compose with the config file docker-compose.yml.

You can run the instance by typing 

`docker-compose up`


You can browse OpenSemanticSearch in your favourite browser at this url : 

`http://localhost:8080/search/`


# Automated tests

For CI/CD there are some different automated tests:


## Integration tests

Since the submodule Open Semantic ETL uses and needs different powerful services like Solr, spaCY-services or Tika-Server by HTTP and REST-API, the automated tests run as integration tests within the docker-compose environment configured in docker-compose.etl-test.yml so these services are available while running the unittests and integration tests.

```
docker-compose -f docker-compose.etl.test.yml build
docker-compose -f docker-compose.etl.test.yml up
```


## End to end tests

Some automated integration tests and end-to-end (E2E) tests within a web browser controlled by the browser automation framework playwright and the node.js / javascript based test framework JEST.

You can extend the automated tests in <code>[test/test.js](test/test.js)</code>

They run by the docker image Dockerfile-test and need the services of the docker-compose environment docker-compose.test.yml

```
docker-compose -f docker-compose.test.yml build
docker-compose -f docker-compose.test.yml up
```


# Dependencies

Dependencies are resolved automatically by building or by installation of the Debian or Ubuntu packages or by building the Docker images.

Documentation on this dependencies which may help debugging dependency hell issues or installations in other environments:


## Build dependencies on Source code (GIT)

Dependencies on other Git repositories / submodules of components like Open Semantic ETL are defined in the Git config file <code>[.gitmodules](.gitmodules)</code>

The submodules will be checked out automatically to the subdirectory <code>[src](src)</code>, if you check out this repository by git in recursive mode.


## Packaging dependencies of Java archives (JAR)

The submodules tika.deb and solr.deb need the JAR of Apache Tika-Server and Apache Solr.

If not there, they will be downloaded from Apache Software Foundation by wget in the submodule "build" script or its "Dockerfile".


## Installation dependencies on Debian/Ubuntu packages (DEB)

Dependencies of tools and libraries, which are available in the Debian or Ubuntu package repositories, are defined in the section "Depends" of the deb package config file DEBIAN/control

<code>[DEBIAN/control](DEBIAN/control)</code>


## Installation dependencies on Python packages (PIP)

Dependencies of Python libraries which are not available as packages of the Linux distribution but in Python Package Index (PyPI), are defined in

<code>[src/open-semantic-etl/src/opensemanticetl/requirements.txt](src/open-semantic-etl/src/opensemanticetl/requirements.txt)</code>

This dependencies will be installed automatically on installation of the Debian/Ubuntu packages by DEBIAN/postinst of the Debian/Ubuntu packages or by docker build configured by Dockerfile by

`pip3 install -r /usr/lib/python3/dist-packages/opensemanticetl/requirements.txt`
