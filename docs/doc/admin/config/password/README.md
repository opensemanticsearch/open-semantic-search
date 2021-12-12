---
title: Password protection
authors:
    - Markus Mandalka
---

# Password protection


If the following config files do not exist (which is the case after standard installation), there is open access for all without a password so everybody can find and read all indexed data and everyone can change, add or delete metadata configurations.

## How to set up a password



To manage users and passwords for access to the search engine and for access to the management tools in a seperate other config file use the Apache webserver standard tool `htpasswd`:

# Access to the search engine


Password protection for search users is configured in the config file `/etc/solr-php-ui/.htpasswd`.
If this config file does not exist (which is the case after standard installation), there is open access for all without a password.

## Create password config file and add an user


Create the password config file and add an user:
`htpasswd -c /etc/solr-php-ui/.htpasswd *username*`
## Add another user(s) or change passwords


Since the config file now exists, add users or change passwords:
`htpasswd /etc/solr-php-ui/.htpasswd *username*`
# Access to the management tools



Password protection for the management tools for datasources and metadata management (i.e. thesaurus or ontologies) is configured in the config file `/etc/opensemanticsearch-django-webapps/.htpasswd`.

If this config file does not exist (which is the case after standard installation), there is open access for all without a password or with the search engine password, if one is set.

## Create password config file and add an user


Create the password config file and add an user:
`htpasswd -c /etc/opensemanticsearch-django-webapps/.htpasswd *username*`
## Add another user(s) or change passwords


Since the config file now exists, add users or change passwords:
`htpasswd /etc/opensemanticsearch-django-webapps/.htpasswd *username*`
# Django admin

The admin access for Django Web UI or facet configs can be set
within the directory `/var/lib/opensemanticsearch` by
`python3 manage.py createsuperuser`