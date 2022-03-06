FROM debian:bullseye

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends --yes \
    apache2 \
    libapache2-mod-php \
    libapache2-mod-wsgi-py3 \
    libjs-jquery \
    php \
    php-xml \
    php-bcmath \
    librabbitmq4 \
    python3-django \
    python3-pycurl \
    python3-rdflib \
    python3-sparqlwrapper \
    python3-sqlparse \
    python3-requests \
    python3-pysolr \
    python3-dateutil \
    python3-lxml \
    python3-feedparser \
    python3-celery \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3-dev \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install django-import-export
RUN pip3 install --no-cache-dir django-import-export && \
    pip3 install --no-cache-dir py2neo && \
    pip3 install --no-cache-dir warcio && \
    pip3 install --no-cache-dir mkdocs && \
    pip3 install --no-cache-dir mkdocs-mermaid2-plugin

COPY ./src/tika-python/tika /usr/lib/python3/dist-packages/tika
COPY ./src/open-semantic-etl/src /usr/lib/python3/dist-packages/
COPY ./src/open-semantic-etl/src/tesseract-ocr-cache /usr/lib/python3/dist-packages/
COPY ./src/open-semantic-etl/etc /etc/

#
# Include docs
#

COPY ./docs /usr/share/doc/open-semantic-search/docs
COPY mkdocs.yml /usr/share/doc/open-semantic-search/

RUN mkdocs build --config-file /usr/share/doc/open-semantic-search/mkdocs.yml

#
# Include solr-php-ui
#

COPY ./src/solr-php-ui/etc /etc

COPY ./src/solr-php-ui/src /usr/share/solr-php-ui/

# This directory will provide initial content to the configuration volume:
RUN mv /usr/share/solr-php-ui/config /usr/share/solr-php-ui/etc-volume

# link from renamed php directory to the configuration volume:
RUN ln -s /etc/solr-php-ui /usr/share/solr-php-ui/config

#
# Include Solr Relevance Ranking Analysis Tool
#

COPY ./src/solr-relevance-ranking-analysis/src/solr_relevance_ranking_analysis /var/lib/opensemanticsearch/solr_relevance_ranking_analysis

#
# Include Open Semantic Search Apps
#

COPY ./src/open-semantic-search-apps/src /var/lib/opensemanticsearch/
COPY ./src/open-semantic-search-apps/etc /etc/
COPY ./src/open-semantic-search-apps/var /var/

#
# Gather the initial content for the volumes
#

RUN mv /var/opensemanticsearch /var/lib/opensemanticsearch/var-volume
RUN mv /etc/opensemanticsearch /var/lib/opensemanticsearch/etc-volume

#
# Include Open Semantic Entity Search API
#

# include Django app
COPY ./src/open-semantic-entity-search-api/src/entity_rest_api /var/lib/opensemanticsearch/entity_rest_api
# include libraries
COPY ./src/open-semantic-entity-search-api/src/entity_import /usr/lib/python3/dist-packages/entity_import
COPY ./src/open-semantic-entity-search-api/src/entity_linking /usr/lib/python3/dist-packages/entity_linking
COPY ./src/open-semantic-entity-search-api/src/entity_manager /usr/lib/python3/dist-packages/entity_manager

#
# Include Open Semantic Visual Linked Data Explorer
#

COPY ./src/open-semantic-visual-graph-explorer/src /var/lib/opensemanticsearch/

# and its base / dependencies cytoscape.js and cytoscape.js-panzoom
COPY ./src/cytoscape.js/dist /var/lib/opensemanticsearch/visual_graph_explorer/static/
COPY ./src/cytoscape.js-panzoom/cytoscape-panzoom.js /var/lib/opensemanticsearch/visual_graph_explorer/static/
COPY ./src/cytoscape.js-panzoom/cytoscape.js-panzoom.css /var/lib/opensemanticsearch/visual_graph_explorer/static/
COPY ./src/cytoscape.js-panzoom/font-awesome-4.0.3 /var/lib/opensemanticsearch/visual_graph_explorer/static/

# Include Solr-Ontology-Tagger
COPY ./src/solr-ontology-tagger/src /usr/lib/python3/dist-packages/

# export static files to directory for webserver
RUN python3 /var/lib/opensemanticsearch/manage.py collectstatic --noinput

# enable apache2 module for Django
RUN a2enmod wsgi

# Reverse proxy for Flower task management web ui
COPY ./src/flower/etc/apache2 /etc/apache2
COPY ./src/flower/etc/flower /etc/flower
RUN a2enmod proxy && \
    a2enmod proxy_http

COPY ./docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
