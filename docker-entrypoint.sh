#!/bin/bash
#
# docker-entrypoint for opensemanticsearch/open-semantic-search

OPEN_SEMANTIC_SEARCH_VERSION="21.12.28"

# If new installation we need to initialize some things
if [ ! -f /etc/opensemanticsearch/version ]
then

  # setup facets/classes in Open Semantic ETL config and index entities in Open Semantic Entity Search API
  python3 /var/lib/opensemanticsearch/manage.py entities

  # set version to status file so no new initialization on next start
  echo $OPEN_SEMANTIC_SEARCH_VERSION > /etc/opensemanticsearch/version

fi

# Start apache2
/usr/sbin/apache2ctl -D FOREGROUND
