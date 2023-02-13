# Open Semantic Search
https://opensemanticsearch.org

Integrated search server, ETL framework for document processing (crawling, text extraction, text analysis, named entity recognition and OCR for images and embedded images in PDF), search user interfaces, text mining, text analytics and search apps for fulltext search, faceted search, exploratory search and knowledge graph search


# Documentation

This README.md is documentation for software developers.

## Documentation for users and admins

The [documentation for users and admins](docs/doc/README.md) is included in the software packages/images and linked in the search user interface (Menu "Help").

## Software architecture

You find the [documentation of the search engine architecture in `docs/doc/modules/README.md`](docs/doc/modules/README.md).

## Documentation format

This integrated HTML [documentation](https://opensemanticsearch.org/doc/search/) is generated by the static site generator [MkDocs](https://www.mkdocs.org/) with the config file [`mkdocs.yml`](mkdocs.yml).

The source of the documentation (Markdown format) and the charts ([mermaid](https://mermaid-js.github.io/mermaid/) format) is editable in the directory [`docs`](docs).


# Build

How to build the deb package for installation on Debian or Ubuntu server or the docker images for running in Docker containers:


## Clone git repositories
Clone the repository including the dependencies:

```
git clone --recurse-submodules --remote-submodules https://github.com/opensemanticsearch/open-semantic-search.git
cd open-semantic-search
```


## Build deb package

To build a <code>deb</code> package for *Debian GNU/Linux* or *Ubuntu Linux*, call the build script <code>[build-deb](build-deb)</code> as user root (change user by `su` or `sudo su`):

```
./build-deb
```

## Build Desktop Search VM

How to build an *Open Semantic Desktop Search* Appliance for *Virtual Box* is documented in
[`src/open-semantic-desktop-search/README.md`](src/open-semantic-desktop-search/README.md).

## Build docker images

Build the Docker images using the default docker-compose config <code>[docker-compose.yml](docker-compose.yml)</code>:

```
docker-compose build
```

## Run docker containers

After these builds all the Docker images/dependencies/services can be started together by docker-compose with the config file <code>[docker-compose.yml](docker-compose.yml)</code>.

You can start the whole environment by

```
docker-compose up
```

which will expose the web user interface on port <code>8080</code>.

You can browse the Open Semantic Search user interface in your favourite browser by this URL: 

`http://localhost:8080/search/`


# Automated tests

For CI/CD there are some different automated tests:


## Integration tests

Since the [submodule Open Semantic ETL](src/open-semantic-etl) uses and needs different powerful services like [Solr](src/solr.deb), [spaCy-services](src/spacy-services.deb) or [Tika-Server](src/tika-server.deb) by HTTP and REST-API, many automated tests run as integration tests within the docker-compose environment configured in <code>[docker-compose.etl.test.yml](docker-compose.etl.test.yml)</code> so these services are available while running the unittests and integration tests.

```
docker-compose -f docker-compose.etl.test.yml build
docker-compose -f docker-compose.etl.test.yml up
```


## End to end tests

Some automated integration tests and end-to-end (E2E) tests within a web browser controlled by the browser automation framework [Playwright](https://playwright.dev/) and the node.js / javascript based test framework [JEST](https://jestjs.io/).

You can extend the automated tests in <code>[test/test.js](test/test.js)</code>

They run by the docker image <code>[Dockerfile-test](Dockerfile-test)</code> and need the services of the docker-compose environment <code>[docker-compose.test.yml](docker-compose.test.yml)</code>:

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

The submodules <code>[src/tika-server.deb](src/tika-server.deb)</code> and <code>[src/solr.deb](src/solr.deb)</code> need the JAR of [Apache Tika-Server](https://tika.apache.org/) and [Apache Solr](https://solr.apache.org/).

If not there, they will be downloaded from Apache Software Foundation by wget in the <code>[build-deb](build-deb)</code> script or the submodules <code>Dockerfile</code>.


## Installation dependencies on Debian/Ubuntu packages (DEB)

Dependencies of tools and libraries, which are available in the Debian or Ubuntu package repositories, are defined in the section <code>Depends</code> of the deb package config file <code>[DEBIAN/control](DEBIAN/control)</code>


## Installation dependencies on Python packages (PIP)

Dependencies of Python libraries which are not available as packages of the Linux distribution but in Python Package Index (PyPI), are defined in

<code>[src/open-semantic-etl/src/opensemanticetl/requirements.txt](src/open-semantic-etl/src/opensemanticetl/requirements.txt)</code>

This dependencies will be installed automatically on installation of the Debian/Ubuntu packages by the <code>DEBIAN/postinst</code> script of the Debian/Ubuntu packages or by docker build configured by <code>Dockerfile</code> by

```
pip3 install -r /usr/lib/python3/dist-packages/opensemanticetl/requirements.txt
```

# Contributors

Most contributors are not shown by the Github user interface as "*Contributors*" of this repository,
since this main repository is structured by [Git submodules](.gitmodules) like [*Open Semantic ETL*](https://github.com/opensemanticsearch/open-semantic-etl)
and other modules, which are managed in separated Git(hub) repositories.

So thanks to all (current and former) contributors:

- Markus Mandalka (@mandalka)
- @g-braeunlich
- @maehr
- @sdinten
- @wsldankers
- @rivimey
- @rbussche
- @mosea3
- @bhelou
- @hpiedcoq
- @andreclinio
- @agharbeia
- @ciyer
- @pengchuan-lin-bp

...

Feel free to extend if you contributed/supported/sponsored in different forms.
