---
title: Extract structured data from text by text patterns (Regular Expressions)
authors:
    - Markus Mandalka
---

# Extract structured data from text by text patterns (Regular Expressions)


You can extract some structured data for aggregated overviews, interactive navigation and interactive filters (faceted search), data analysis and data visualization from unstructured text with regular expressions (RegEx).

You can extract some structured data i.e. for aggregated overviews, interactive navigation and interactive filters (faceted search), data analysis and data visualization from unstructured text by extraction of the interesting text parts to structured fields, properties or facets by defining text patterns with regular expressions (RegEx).

## Named entities like persons, organizations, locations or concepts


Regular expressions doesn't mean Named Entities with names that are strings that do not change.
If you want to [identify named entities like known persons, organizations, location or concepts, you should use the Named Entities Manager](../../doc/datamanagement/named_entities) with a comfortable user interface and which needs less resources.

## Regular expressions for defining text patterns


Usage of the regular expression plugin is for text patterns with dynamic parts or variables.

## Preconfigured regular expressions


There are some preconfigurated config files in `/etc/opensemanticsearch/regex` like *regex-email.tsv* extracting email-addresses or *regex-money.tsv* for extraction of amounts of money.

## Custom regular expressions


If you want to add custom regular expressions, you should use the custom regex config file
`/etc/opensemanticsearch/regex/regex-custom.tsv`
so you can updates the preconfigurated lists automatically without overwriting your own config.

## Custom regular expressions lists


Sometimes you might want not only to add some custom regular expressions, but a whole list or more than one.

For example if you want to exchange such configs or lists with partners, so you should seperate such configs for special topics from your custom regular expressions.

To add another regex list just add to the config in */etc/opensemanticsearch/etl*
`config['regex_lists'].append('/etc/opensemanticsearch/regex/regex-anOwnList.tsv')`
## Config format for extraction of text patterns



The text patterns are configured in a textfile config in TSV format (tab seperated values).

For a new pattern just add a new line to the config.

Begin with the text patterns you search for as a [regular expression](https://docs.python.org/3.5/library/re.html).

Optionally you can add a tab and the name of a facet/field where to write the matches. If no facet / field added, the default facet/field "Tags" will be used.

Lines with # as first char of the line are ignored.

Example:
`# Write text like *1000.00 $* or *100$* to the facet *dollar\_ss*
[0-9]+[\.\,]?[0-9]*[:blank:]*\$ dollar_ss`
## Extract only parts of a pattern (RegEx groups)



Sometimes you don't want to extract the whole matching pattern like `size of 1000 m`, but only a part of it like only the number.

Regular expressions can group part of the pattern with `()`

If your pattern defines RegEx groups you can configure with an additional tab and a following number which groups result will be used.

If you set the group to 0, the whole matching pattern will be extracted, if you set the group to `1` the (first) group of the regular expression will be extracted to the configured facet/field. If you set `2` the second group (if more than one group defined) or the regular expression will be extracted and so on...

Example:
`Size of ([0-9]+)[:blank:]?m size_ss 1`
