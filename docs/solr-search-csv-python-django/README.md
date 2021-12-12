---
title: CSV Manager
authors:
    - Markus Mandalka
---

# CSV Manager


User interface (webapp) for structured import of CSV spreadsheets

## Usage



See the [user documentation](../doc/search/csv)
## Installation


* download the module *opensemanticsearch-search-csv-python-django*
* Copy the directory *csvmanager* from the zip file into your Django apps directory
* Enable the new app:

Add "*csvmanager*" to your INSTALLED\_APPS setting like this:


`INSTALLED_APPS = (
 ...
 'csvmanager',
 )`* Include the search\_list URLconf in your project urls.py like this:
`url(r'^csvmanager/', include('csvmanager.urls')),`
