---
title: Blacklists and whitelists  
authors:  
    - Markus Mandalka
---

# Blacklists and whitelists

## Exclude URLs, domains, paths, files, file types or plugins from indexing to Solr or Elastic Search

Entries in a blacklist or matching a pattern like prefixes (i.e. domains or file directories) or suffixes (i.e. a file suffix like `.css`) won't be indexed for search.

So you can exclude spam or not relevant formats like CSS files. For example you might want to not index stylesheets (if you are not a web developer who might want to search for them).

## Blacklist format: One entry per line

A blacklist is a plain text file containing one blacklist entry per line.

There are different blacklists for different forms of blacklisting:

## Exclude webpages or filenames by URLs

To exclude a webpage or a file, add the full URL or full filename to the default URL-Blacklist `/etc/opensemanticsearch/blacklist/blacklist-url`

## Exclude domains or paths by prefixes

To exclude whole domains, subdomains, paths or subpaths, add the domain or path to the default prefix-Blacklist `/etc/opensemanticsearch/blacklist/blacklist-url-prefix`

## Exclude file extensions by suffixes

To exclude suffixes like some file extensions, just add the suffix like `.css` to the default suffix-Blacklist `/etc/opensemanticsearch/blacklist/blacklist-url-suffix`

## Exclude URIs matching text patterns by regular expressions

To exclude all URIs matching a text pattern (regular expression) just add the regular expression to the default regex-Blacklist `/etc/opensemanticsearch/blacklist/blacklist-url-regex`

## Whitelist: Include even if matching a blacklisted pattern

URLs in a whitelist will be indexed, even if blacklisted because  they matched a blacklisted domain, prefix, suffix or pattern.

The configuration works the same way in config files `/etc/opensemanticsearch/blacklist/whitelist-url` and so on ...

## Configure additional blacklists (for divided or shared blacklists)

If you want to use multiple blacklists for easier management of many blacklisted entries or to share blacklists or parts of your blacklists with other people, organizations or a closed or open data community, you can use and add more than the default blacklists:

To add another blacklist of URLs or filenames just add to the config in `/etc/opensemanticsearch/etl` or in the config of the special connector
`config['blacklist'].append('/etc/opensemanticsearch/blacklist/blacklist-url-anOwnList')`

To add another blacklist of Domains or directories just add to the config in `/etc/opensemanticsearch/etl` or in the config of the special connector
`config['blacklist_prefix'].append('/etc/opensemanticsearch/blacklist/blacklist-url-prefix-anOwnList')`

To add another blacklist of file endings just add to the config in `/etc/opensemanticsearch/etl` or in the config of the special connector
`config['blacklist_suffix'].append('/etc/opensemanticsearch/blacklist/blacklist-url-suffix-anOwnList')`

To add another blacklist of regular expressions just add to the config in `/etc/opensemanticsearch/etl` or in the config of the special connector
`config['blacklist_regex'].append('/etc/opensemanticsearch/blacklist/blacklist-url-suffix-anOwnList')`

## Blacklisting on plugin level

Blacklists can be configured only for certain plugins.

So blacklisting documents, paths, file endings or content types only affects certain plugins or data enrichment or data analysis or document processing chain steps.

So the blacklisted documents, paths, file endings or content types will be processed by all other plugins and indexed, but they would not be processed, enriched or analysed by the defined plugin.

These config files work the same way as the standard blacklist config file types described above. So you can blacklist some files (URLs), paths (URL-prefixes) or file endings (URL suffixes).

But they are only active for the defined plugin by the path name inside the config path `/etc/opensemanticsearch/blacklist`, which has to match the plugin file name.

### Blacklisting URLs, file names (URLs), paths (URL prefixes), file endings (URL suffixes) on plugin level

* */etc/opensemanticsearch/blacklist/pluginname/blacklist-url*
* */etc/opensemanticsearch/blacklist/pluginname/blacklist-url-prefix*
* */etc/opensemanticsearch/blacklist/pluginname/blacklist-url-suffix*
* */etc/opensemanticsearch/blacklist/pluginname/blacklist-url-regex*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-url*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-url-prefix*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-url-suffix*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-url-regex*

### Blacklist content types on plugin level

Important: This means not file endings (which would be url-suffix) but the content type guessed by Tikas document analysis!
* */etc/opensemanticsearch/blacklist/pluginname/blacklist-contenttype*
* */etc/opensemanticsearch/blacklist/pluginname/blacklist-contenttype-prefix*
* */etc/opensemanticsearch/blacklist/pluginname/blacklist-contenttype-suffix*
* */etc/opensemanticsearch/blacklist/pluginname/blacklist-contenttype-regex*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-contenttype*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-contenttype-prefix*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-contenttype-suffix*
* */etc/opensemanticsearch/blacklist/pluginname/whitelist-contenttype-regex*

### Example

For example if you don't want to handle Open Document files which are extracted with Tika yet additionally as ZIP archive which it technically is and which would be extracted to index each file inside this ZIP archive, you can blacklist this content type for the Unzip plugin:

Therefore add to the config in `/etc/opensemanticsearch/blacklist/enhance_zip/blacklist-contenttype-prefix`:
`application/vnd.oasis.opendocument.`

Another possibility would be to blacklist the `.odt` suffix for the ZIP plugin `enhance_zip`:

Therefore add to the config in `/etc/opensemanticsearch/blacklist/enhance_zip/blacklist-url-suffix`

```
.odt
.ODT
.Odt
```

Since this is preconfigured in the default setup and config file, you don't have to add this manually, but it is an example how more complex blacklisting on plugin level works.
