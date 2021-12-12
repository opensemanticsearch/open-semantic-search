---
title: XMP sidecar files
authors:
    - Markus Mandalka
---

# XMP sidecar files


This enhancer module reads additionally image metadata like title, tags or descriptions from XMP (Extensible Metadata Plattform) sidecar files i.e. from the photo database *Adobe Photoshop Lightroom* or *JPhototagger*.

## Installation



Just download and install the module.

## Configuration



Just setup in the config file */etc/opensemanticsearch/connector-files* the following option:
`config['xmp'] = True`