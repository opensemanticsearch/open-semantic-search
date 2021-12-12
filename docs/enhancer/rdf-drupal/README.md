---
title: Enhancer RDF Drupal
authors:
    - Markus Mandalka
---

# Enhancer RDF Drupal


## Metadata management like tagging or annotation with Drupal


This module integrates the powerful and generic **[Drupal CMS](http://www.drupal.org)** for **metadata management** like **tagging** or **annotation**.

Drupal provides flexible **custom data structures** and easy to use **user interfaces to configure** them.

So you can use powerful Drupal features like **[custom fields](https://www.drupal.org/documentation/modules/field-ui)**, flexible data structures like **[taxonomies](https://www.drupal.org/getting-started/6/admin/content/taxonomy)** for tags or flexible **user management**, i.e. for tagging, verification, (re)viewing, classifying or (re)ranking large document sets.

Since you can use the flexible user management tools of Drupal, you can use this module for **crowdsourcing** on the net (i.e. for datajournalism) using only the data of the users you trust or which was moderated or verified.

## Installation and configuration


* Download and extract the module zip file
* Import our content type *meta*
* Import the view *edit.view* into your drupal views
* Import the view *rdf.view* into drupal views
* Config *metadataserver* in */etc/solr/solr-enhancer-rdf* to the url of your drupal installation


## Usage



Example for a direct link for editing metadata for opensemanticsearch.org:
http://localhost/drupal/edit?uri=http://www.opensemanticsearch.org

There are two ways you dont need to type in such URLs manually:

Configure your Drupal link `http://localhost/drupal/edit?uri=[URI]` for tagging and annotation in the search user interface config.

Or use a bookmarklet integrated in your Web browser, so you can add or annotate a new URI with one click.

## Custom metadata content type and custom form


You can add own custom fields to our metadata content type *meta* to customize it.

Or you use your own custom metadata content types and custom forms:

Just add a field named "uri" (internal saved as field\_uri in drupal) to the (new) content type you want to use for metadata of this URL and change the contenttype from *meta* to your own in the views *edit* and *rdf*.

