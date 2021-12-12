---
title: Extract locations from GeoNames database
authors:
    - Markus Mandalka
---

# Extract locations from GeoNames database


This enhancer plugin extracts locations in [GeoNames](http://www.geonames.org) databases from documents, making this locations available to exploratory search, aggregated overviews and einteractive filters.

## Data protection and privacy: No cloud or external webservice used


This plugin won't call an external webservice, so wether the analyzed texts nor the extracted locations will be sent to cloud or external web services.


## Installation and config


### Install GeoNames plugin


Download and install the package **opensemanticsearch-enhancer-geonames**
### Download GeoNames database parts


Download the interesting data (f.e. all names of cities with more than 1000 people or the data of your country) from [Geonames data dumps](http://download.geonames.org/export/dump/).

Extract the ZIP archive(s) to the directory `/etc/opensemanticsearch/geonames/`
### Config plugin


Config the databases you want to use for the whole system in `/etc/opensemanticsearch/etl` or for a special connector (i.e. in `/etc/opensemanticsearch/connector-files`):

`config['geonames'] = [
 '/etc/opensemanticsearch/geonames/cities1000.txt'
]`

You can configure more than one geonames database (which will need more ressources and cause more fase positives, because more Locations have the same name like an common word in your language):

`config['geonames'] = [
 '/etc/opensemanticsearch/geonames/DE.txt',
 '/etc/opensemanticsearch/geonames/AT.txt',
 '/etc/opensemanticsearch/geonames/CH.txt'
]`
### Enable plugin


Enable the enhancer plugin in the same connector config:
`config['plugins'].append('enhance_geonames')`
## Hint: Check for as few locations as possible


Since there are many places in the world that have the same name like popular words of your language, you should check only for the interesting geoname data or parts of it.

For example often its enough to check only the most important town names of your country and adding smaller local places for you very interesting custom locations to the named entities manager. Or you create custom GeoNames data files by filtering very granular of geonames database parts, i.e. for all locations within a radius to your main location.
