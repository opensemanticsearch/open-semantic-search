FROM debian:buster

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
RUN pip3 install --no-cache-dir django-import-export

COPY ./src/tika-python/tika /usr/lib/python3/dist-packages/tika
COPY ./src/open-semantic-etl/src /usr/lib/python3/dist-packages/
COPY ./src/open-semantic-etl/etc /etc/

#
# Include solr-php-ui
#

COPY ./src/solr-php-ui/etc /etc

COPY ./src/solr-php-ui/src /usr/share/solr-php-ui/

# Move config from php directory config to systems config directory /etc
RUN mv ${BUILDDIR}/usr/share/solr-php-ui/config/* /etc/solr-php-ui/

# link from deleted php directory to this new config destination
RUN rmdir /usr/share/solr-php-ui/config
RUN ln -s /etc/solr-php-ui/ /usr/share/solr-php-ui/config


#
# Include Solr Relevance Ranking Analysis Tool
#

COPY ./src/solr-relevance-ranking-analysis/src/solr_relevance_ranking_analysis /var/lib/opensemanticsearch/solr_relevance_ranking_analysis

#
# Include Open Semantic Search Apps
#

COPY ./src/open-semantic-search-apps/src /var/lib/opensemanticsearch/
COPY ./src/open-semantic-search-apps/etc /etc/

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

#
# Include Solr-Ontology-Tagger
#

COPY ./src/solr-ontology-tagger/src /usr/lib/python3/dist-packages/


# export static files to directory for webserver
RUN python3 /var/lib/opensemanticsearch/manage.py collectstatic --noinput

# create directory for file uploads
RUN mkdir /var/opensemanticsearch
RUN mkdir /var/opensemanticsearch/db
RUN mkdir /var/opensemanticsearch/media

RUN chown -R www-data:www-data /var/opensemanticsearch

# create or upgrade DB
RUN python3 /var/lib/opensemanticsearch/manage.py migrate

# allow Django running in apache2 context to read and write to DB
RUN chown www-data:www-data /var/opensemanticsearch/db/db.sqlite3

# but others should not be able to read DB entries
RUN chmod o-r /var/opensemanticsearch/db/db.sqlite3

# allow Django running in apache2 context to write facets config
RUN chgrp www-data /etc/opensemanticsearch/facets
RUN chmod g+r /etc/opensemanticsearch/facets
RUN chmod g+w /etc/opensemanticsearch/facets

# allow Django running in apache2 context to write ETL config
RUN chgrp www-data /etc/opensemanticsearch/etl-webadmin
RUN chmod g+r /etc/opensemanticsearch/etl-webadmin
RUN chmod g+w /etc/opensemanticsearch/etl-webadmin

# allow Django running in apache2 context to write UI config
RUN chgrp www-data /etc/solr-php-ui/config.webadmin.php
RUN chmod g+r /etc/solr-php-ui/config.webadmin.php
RUN chmod g+w /etc/solr-php-ui/config.webadmin.php
RUN chgrp www-data /etc/solr-php-ui/config.facets.php
RUN chmod g+r /etc/solr-php-ui/config.facets.php
RUN chmod g+w /etc/solr-php-ui/config.facets.php

# enable apache2 module for Django
RUN a2enmod wsgi

# allow Django running in apache2 context to write OCR dictionary
RUN chown www-data:www-data /etc/opensemanticsearch/ocr/dictionary.txt
RUN chmod o+r /etc/opensemanticsearch/ocr/dictionary.txt

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
