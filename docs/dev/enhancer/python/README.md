---
title: How to develop your own Python plugin for data enrichment  
authors:  
    - Markus Mandalka
---

# How to develop your own Python plugin for data enrichment

## Example

* Add a new python file to the enhancer directory
* Enable this plugin in your connector and
* Implement the object *myOwnEnhancerName* the function `process` with the parameters `parameters` and `data` which 
* reads some parameters from variable parameters and
* write to the variable data to index your results:

Example:


```python
import etl

class myOwnEnhancerName(object):

   def process ( parameters={}, data={} ):

      # do some analyses, i.e. with text
      uri\_length = len ( parameters['id'] )

      #write some analysis results to the index into a facet
      etl.append(data, facet='uri\_length\_i', values=uri\_length)

      #return results
      return parameters, data
```

## Plugin directory

Save your enhancer `*myOwnEnhancerName*.py` into the subdir `etl` of your in python library directory (i.e. `/usr/lib/python2.7/`).

## Config

Add your enhancer to the enhancer chain in the config of your connector(s), which shall enhance their data with it:

### Enable your data enrichment plugin

Add the plugin name to the config of the connector, for example in `/etc/opensemanticsearch/connector-files`:

`config['plugins'].append('*myOwnEnhancerName*')`

### Custom config options for your plugin

Optionally you can add your own config options, so you have more flexibility, because not everything has to be hard coded in your plugin.

Example

`config['myOwnEnhancerName'] = 'Own Enhancer'`

Your plugin can read this config options from the variable [`parameters`](#parameters).

## Variables

### Read / set parameters from/to the variable `parameters`

The variable `parameters` contains the config and some analysis results from enrichment plugins running before so you can use now as parameter for your plugin.

For example you can run your plugin only for certain document types or mime types or run a language detection plugin before you use its result as a parameter for an OCR plugin.

Example data:

```python
print parameters
```

```
{
 'id: 'file:///documents/document.pdf',
 'content_type': 'application/pdf'
}
```

### Write results and values for indexing to the variable `data`

The variable `data` is for adding facets and values to the index.

To save and index your plugin's results, just add them to the variable `data`.

Example:
```python
data['tags'] = 'myTopic'
data['location'] = 'Berlin'
```

So the variable `data` will look like this after running some enhancer plugins:


```python
print data
```

```
{ 
 'content_type': 'application/pdf',
 'filesize': 12345,
 'tags': {'Open Source', 'Free software'},
 'email_ss': { 'info@opensemanticsearch.org', 'support@opensemanticsearch.org' }
}
```

## Functions

### Process

Implement the function `process` with the parameters `parameters` and `data`.

If the plugin is enabled, this function will be called by the connector before indexing the document.

```python
# ...
   def process ( parameters={}, data={} ):
      # do some analyses, i.e. with text
      textsize = parameters[text'].size

      #write some analysis results to the index into a facet
      opensemanticsearch\_connector.append(data, facet='textsize', values=textsize)

      #return
      return parameters, data
```

You can use all Python functions and libraries for very easy or very complex analysis.

### Append data

Since if there are values for the same facet before because of another plugin running before and with the first example how to write results to the variable data, you would overwrite existing data and for adding data easier, you can use the function `etl.append` to add additional values from your analysis results to the index:

`etl.append(data=data, facet = 'email', values = 'info@opensemanticsearch.org')`

The parameter `values` can be a value like a integer or a string or multiple values as a python list.

### Abort processing

To abort further processing and final indexing you can set
`parameters['break'] = True`

You can develop additional filters like, for example, the existing URL blacklist filter.

## Another example plugin using regular expressions

Here an example, how to extract the email-adresses and store it to the facet email with just a few lines of python code to enable exploratory search, interactive filters and aggregated overviews for email-addresses, too. Its only an programming example, since [extracting regular expressions](../../../enhancer/regex) is a standard plugin and to extract email-adresses its default config.


```python
# Data enrichment plugin for extracting email-adresses
# Extracting email adresses and write them to facet email\_ss

# import the connector, so we can add our analysis to the indexed document
import opensemanticsearch\_connector

# import python module for regular expressions
import re

class enhance\_email(object):
 def process ( parameters={}, data={} ):

   # regular expression matching email-adresses
   regex = r'[\w\.-]+@[\w\.-]+'

   # facet / column where to store/index it
   facet = "email"

   # find all emailadresses with a regular expression
   matches = re.findall(regex, parameters['text'])

   if matches:
      # add the list matches to the facet
      opensemanticsearch\_connector.append(data, facet, matches)
	
   return parameters, data
```