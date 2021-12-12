---
title: How to install Open Semantic Desktop Search
authors:
    - Markus Mandalka
---

# How to install Open Semantic Desktop Search


## Dependencies


If not yet there download and install the following virtual machine host (available for free for *Windows*, *Mac* and *Linux*)
* [*Virtual Box*](https://www.virtualbox.org)


## Installation


* [Download the virtual machine image *Open Semantic Desktop Search*](../../../../download#desktop_search)
* Start *Virtual Box*
* In the menu "File" start the option "Import Appliance".
* Choose the downloaded appliance file and start the import


## Configuration of document folders


Edit the settings of the new virtual machine (choose the virtual machine in the left sidebar and click the "settings" button in the top bar).

Add **shared folders** with **documents**:

![](../../../../screenshots/shared_folders.png)

You can add one shared folder or multiple shared folders pointing to local folders on your harddisk to point to your documents, that should be indexed, searched and analysed.

Activate the option *Auto-mount*.

This folder(s) can be set read only, so you cannot accidently delete important documents because not familar with the new user interfaces and desktop environment.

## Automatic indexing of new documents on virtual machine startup



On startup of the virtual machine all (new) documents in the configured shared folders will be indexed.

## Desktop search usage


After the files have been indexed you can [search and analyse documents with Open Semantic Desktop Search](../../../desktop_search).


## External index (optionally)


If you want to store the index in a directory or filesystem outside the Virtual Machine, you can add a shared folder named `index` (activate the option *Auto-mount*).

Don't set this folder to read only, since the search engine has to store the index in it.

## System access and default passwords


### User


The default password of the user is `live`.

### Root access



If you want full root access to the Linux System, for example to install additional packages or to change [config files](../../config):

Since as admin you have control of the virtual machine host and you have full access to the virtual machines data and so there is no root password, just login as root without password on the virtual machine console:

Press CTRL-Right and F3 at once to get to the console.

Login as `root` without password.

Set a root password:
`passwd`

Exit the console:
`exit`

Return to Gnome GUI:
Press CTRL-Right and F2 at once.

After that you can get to use a terminal within the Gnome graphical user interface for users by opening the terminal application and use the command `su` which will ask you for this password to get full root access.

# Encrypted Live-System: InvestigateIX



If the hard drive of your computer is not encrypted or you don't trust all installed software on your computer, you might want to install a separated and **encrypted stand-alone live-system search environment for sensitive documents**:

[InvestigateIX](http://www.mandalka.name/investigateix) integrates Open Semantic Desktop as preconfigured search engine and desktop environment with an Linux live-system **on an encrypted external device like an usb key or an external harddisk** for **end users with sensible data and enhanced privacy needs** like investigative journalists without dedicated server or laptop and for unhosted searching.
