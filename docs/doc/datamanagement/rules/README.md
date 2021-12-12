---
title: Rules: Rule based automatic tagging and automatic classification
authors:
    - Markus Mandalka
---

# Rules: Rule based automatic tagging and automatic classification


## Setting search query based rules for automatic classification


Since the [Thesaurus editor and named entity manager](../thesaurus) allows not only to set keywords or names to extract known named entities like locations or organisations but [flexible and powerful search operators for simple or complex queries](../../search/operators) you can use it for defining **rules** for **automatic classification** of new content or for easy and flexible definitions of news pipes or channels for example for alerts, automatically filtered newsfeeds for different channels, for further reading or automatic publishing.


## Classification or tagging with categories for navigation and interactive filters


Since this flexibility you can use the query based tagging even for better navigation and overview trough exploratory search by additional search facets or flexible rule based aggregated overviews of differenced and / or grouped aspects, known as pivot tables.



![](../../../screenshots/named_entities_manager.png)

## Tagging for alerts or newsfeeds


For example you can setup to tag all new articles with a keywords or search queries like `myCompanyname` or with more words like `myTown murder` or more complex queries like `myTown AND shooting AND NOT "shooting star" AND NOT "photo shooting"` with the tag `maybe urgent and/or important` and subscribe only this tag as alert or newsfeed instead managing subscriptions or alerting of many queries.


## Groups


In the admin interface you can add some or many of such rules to groups, i.e. to the group (or since groups can be part of a parent group even a taxonomy) "Violence".

So you can manage many alerts and search queries with the admin interface and your users have only to subscribe one tag or group instead of subscribing each of the (new) queries.

## Alerts if new or changed number too small or too big


Or if you indexing data sources like datasets or tables with columns with numbers you can subscribe alerts for new rows that are or get bigger or smaller than the value you set in your search query.

## Qualifying with automatic classification


For example you can set rules like if source is a certain domain (with a search query like field URI like 
`https://www.trusted-investigative-journalism-organisation.org/*`) then tag the article to the category "proven source".

The other way you can classify content from advertising or boulevard media with the tag "not a reliable source" in the facet "information quality"


## News pipes



So you can easy define newspipes: For example if there was an important alert for a special topic and a colleague who is specialist for that toppic verified that and tagged the new article with the tag "verified" mark it for a channel where more people will read it or are subscribed to or mark it for a news pipe for further verifying for other colleagues or further automatic filtering.

## Custom facets / fields / properties


Rules can tag their values to the standard facet like *Tags* or *Author* or you can choose a custom facet to have a faceted search and navigation with different facets like "Locations" or "Organisations" or other custom facets.
