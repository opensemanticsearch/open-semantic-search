---
title: How to build the Open Semantic Desktop Search VM
authors:
    - Markus Mandalka
---

# Open Semantic Desktop Search VM

## Documentation

This `README.md` is documentation for developers who want to build an Open Semantic Desktop Search VM.

The admin and usage documentation of Open Semantic Desktop Search VM is located in [`docs/doc/desktop_search`](../../docs/doc/desktop_search/README.md).


## Prerequisites

Dependencies for the VM build process:

- *Virtual Box*
- *Vagrant*
- [*Debian* package of *Open Semantic Search*](../../README.md#build-deb-package) as `open-semantic-search.deb` in this directory

## Build

To build the Open Semantic Desktop Search VM call the bash script [`build.sh`](build.sh):

```
./build.sh
```

It will start to create a Virtual Machine (VM) by *Vagrant*.

This *Debian GNU/Linux* based VM is provisioned by the [*Ansible*](https://docs.ansible.com/ansible/latest/index.html) playbook [`playbook.yml`](playbook.yml) which defines the installation and configuration of Open Semantic Search and the *Gnome* desktop environment.

After that it exports the VM as a *Virtual Box* Appliance to the file `open-semantic-desktop-search.ova`.


## Debugging

### Start the build VM

To start the build VM without using the full build script `build.sh` use the command

```
vagrant up
```


### Replay playbook

After fixing bugs in the playbook you can replay the playbook by

```
vagrant provision
```

### Shell

You can get a shell running inside the VM by the command

```
vagrant ssh
```

Within the opened shell you can get root by

```
sudo su
```
