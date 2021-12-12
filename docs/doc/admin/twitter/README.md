---
title: Suchmaschine für Twitter: Tweets indexieren
authors:
    - Markus Mandalka
---

# Suchmaschine für Twitter: Tweets indexieren


## Twitter indexieren


Einzelne Abrufe von Twitter (per Cron auch zu gewünschten Zeiten und / oder in gewünschten Abständen durchführbar):

### Tweets von NutzeInnen indexieren, denen Sie folgen



Indexiert Tweets aller Twitter-Accounts, denen gefolgt wird:

```

solr\_indextwitter

```

### Tweets eines Nutzers indexieren


Indexiert alle Tweets des Accounts *@opensemsearch* (seine und von diesem retweetete)

```

solr\_indextwitter --timeline @opensemsearch

```

### Hashtag indexieren


Sucht und indexiert Tweets mit dem Hashtag *#opensemanticsearch*, auch wenn den AutorInnen nicht gefolgt wird:

```

solr\_indextwitter --search #opensemanticsearch

```

### Tweets mit Suchwort indexieren


Sucht und indexiert Tweets, in denen das Suchwort *test* enthalten ist, auch wenn den AutorInnen nicht gefolgt wird:

```

solr\_indextwitter --search test

```

## Twitter Stream indexieren


Der durchgängig laufende Daemon fragt nicht einnmalig oder in bestimmten Zeitabständen regelmässig die neuesten Tweets bei Twitter ab, sondern schaltet mittels *Twitter Stream API* auf dauerhaften Empfang. Twitter sendet dann neue Tweets sobald sie veröffentlicht werden, so dass diese sofort indexiert werden.

```

solr\_indextwitter --stream

```


So werden neben aller abonnierten Twitter-Accounts in der eigenen Timeline zusätzlich weitere Suchworte monitored:

```

solr\_indextwitter --stream --search #hashtagX,#hashtagY,keywordX,keywordY,keywordZ

```

Die Suchworte werden mit dem Parameter *--search* angegeben, ansonsten werden die Suchworte aus der Suchmaschinenkonfiguration (siehe Datenquellen) verwendet.
