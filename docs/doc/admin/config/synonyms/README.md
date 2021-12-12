---
title: Setup of synonyms and aliases
authors:
    - Markus Mandalka
---

# Setup of synonyms and aliases


You can setup synonyms, aliases or alternate names with the web user interface [thesaurus manager](../../../datamanagement/thesaurus).

Just add a name or concept with the synonym as an alias or import a thesaurus or ontology with synonyms to the [ontologies manager](../../../datamanagement/ontologies).

After that the module [SKOS to Solr](../../../../skos2solr) adds all alternate SKOS labels or aliases from thesaurus entries as synonym for their prefered labels to the synonym config file for [Solr synonym filter](https://cwiki.apache.org/confluence/display/solr/Filter+Descriptions#FilterDescriptions-SynonymFilter).

Please donate so we can integrate (technically existing) features with open data from Wiktionary, so most synonyms and more forms of irregular verbs ("went" is not only "go" with a suffix) will be preconfigured out of the box.


