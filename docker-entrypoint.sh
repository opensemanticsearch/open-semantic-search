#!/bin/bash
#
# docker-entrypoint for opensemanticsearch/open-semantic-search

OPEN_SEMANTIC_SEARCH_VERSION="21.12.28"
echo $OPEN_SEMANTIC_SEARCH_VERSION > /etc/opensemanticsearch/version

cp -na /var/lib/opensemanticsearch/etc-volume/. /etc/opensemanticsearch/
cp -na /var/lib/opensemanticsearch/var-volume/. /var/opensemanticsearch/

# Copy default config from php directory config to systems config directory /etc
cp -na /usr/share/solr-php-ui/etc-volume/. /etc/solr-php-ui/

# allow Django running in apache2 context to write facets config
chgrp www-data /etc/opensemanticsearch/facets
chmod g+rw /etc/opensemanticsearch/facets

# allow Django running in apache2 context to write ETL config
chgrp www-data /etc/opensemanticsearch/etl-webadmin
chmod g+rw /etc/opensemanticsearch/etl-webadmin

# allow Django running in apache2 context to write OCR dictionary
chown www-data:www-data /etc/opensemanticsearch/ocr/dictionary.txt
chmod o+r /etc/opensemanticsearch/ocr/dictionary.txt

# allow Django running in apache2 context to write UI config
chgrp www-data /etc/solr-php-ui/config.webadmin.php
chmod g+rw /etc/solr-php-ui/config.webadmin.php
chgrp www-data /etc/solr-php-ui/config.facets.php
chmod g+rw /etc/solr-php-ui/config.facets.php

# create or upgrade DB
mkdir -p /var/opensemanticsearch/db
python3 /var/lib/opensemanticsearch/manage.py migrate

# allow Django running in apache2 context to read and write the database
chown -R www-data:www-data /var/opensemanticsearch

# but others should not be able to read DB entries
chmod -R o-rwx /var/opensemanticsearch/db

# write Open Semantic ETL config and Solr PHP UI config by settings of web admin ui / in Django DB
python3 /var/lib/opensemanticsearch/manage.py configs

# setup facets/classes in Open Semantic ETL config and index entities in Open Semantic Entity Search API
python3 /var/lib/opensemanticsearch/manage.py entities

# Start apache2
/usr/sbin/apache2ctl -D FOREGROUND
