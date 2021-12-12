---
title: RSS-Feed Manager
authors:
    - Markus Mandalka
---

# RSS-Feed Manager


## Managing imports of RSS newsfeeds



RSS-Feed manager is a web app and user interface for managing imports of RSS-Newsfeeds.

## Usage


### Login


Login to the admin interface.

Choose the application "RSS-Feed manager".

### Add new Feeds



Add a RSS-Feed or more Newsfeeds.

Set the uri of the RSS-Feed.

The title and description is optional and only for easier managing many feeds for humans.

### How often to import: Delta time


If you dont want to import a feed on every cron run, set a delta time for the feed.

Example: A delta time of `60` minutes will import the feed (and new news) only one time per hour or set to `0` minutes to import the feed on every cron run.


## Installation


See the [admin documentation](../../../rss-feed-manager-python-django).

## Roadmap


Plans for the feature ([please donate](../../../donate)):

We want to add tagging functionality to the RSS importer, so you can add metadata or tags to all news imported with this feed, i.e. a special topic).

At the moment you can only setup [tagging with rules](../rules) because of the datasource URL (i.e. domain of a newspaper) or topics (i.e. keywords) but not additional tags only because the source of the articles was a special RSS-Newsfeed (i.e. a feed only for one topic, we would not find out the other ways and we can not find out because of URL of the article, because the domain has more then one topic).

Additionally want to add tagging for RSS-Feed management, so you can organize many newsfeeds in the management interface with tags.
