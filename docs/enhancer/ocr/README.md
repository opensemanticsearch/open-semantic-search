---
title: Automatic text recogniton in images by optical character recognition (OCR)
authors:
    - Markus Mandalka
---

# Automatic text recogniton in images by optical character recognition (OCR)


## Optical character recognition (OCR) for automatic text recognition of text in image files or embedded images like scanned documents within a PDF document



Text stored in image formats like JPG, PNG, TIFF or GIF (i.e. scans, photos or screenshots) can not be found by standard fulltext search. So this enhancer enriches meta data of images like filename, format and size with results from automatic text recognition (OCR).

Since many information is not searchable by fulltext search because its in graphical formats embedded in PDF documents or Powerpoint presentations (i.e. screenshots instead of text format), the enhancer extracts images from PDF files for automatic textrecognition (OCR), too.

## Enable OCR



Some OCR tasks are off by default, because it slows down indexing. It uses many processor resources and will need many seconds for each graphic file.

If you want to enable OCR for images:

Since meanwhile Apache Tika will OCR most images for you by default, if Teseract is installed, you don't have to activate the disabled plugin for OCR of images.

## Enable OCR for embedded images or scans inside PDF documents



But if you enabled OCR by installing Tesseract, you should enable OCR for images inside PDF files, too, since many PDF files are scans and do contain much text data only as graphics.

Therefore enable the plugin `enhance_pdf_ocr`.

## OCR language


Setting OCR language to an other language than english:
1. Install the Tesseract language package (for german: *tesseract-ocr-deu*). See the list of available languages for [Debian](https://packages.debian.org/search?keywords=tesseract-ocr) or [Ubuntu](http://packages.ubuntu.com/search?keywords=tesseract-ocr).
2. set option *ocr\_language* to the language of your documents. Default is *eng* for english (in tesseract its *eng*, not *en*!). For german set *deu* (in tesseract its not *de*!):

`# language for automatic text recognition
#config['ocr_lang'] = "eng"
config['ocr_lang']="deu"`


## Deskewing low quality scans before OCR


To enable an additional deskewing of low quality scans with [Scantailor](http://scantailor.org) before OCR for getting better results in some cases:

Install Scantailor:
`apt-get install scantailor`

Enable additional optimization with Scantailor before OCR by enable the plugin `enhance_ocr_descew` in your connector or ETL config.

Hint for user of older Debian versions: If this package doesn't exist in the Debian version you use, you can get a package in the Debian backports repository.
