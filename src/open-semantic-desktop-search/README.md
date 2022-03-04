---
title: How to build the Open Semantic Desktop Search VM
authors:
    - Markus Mandalka
---

# Open Semantic Desktop Search VM

## Documentation

This `README.md` is documentation for developers who want to build an Open Semantic Desktop Search VM.

The admin and usage documentation of *Open Semantic Desktop Search* VM is located in [`docs/doc/desktop_search`](../../docs/doc/desktop_search/README.md).


## VM provisioning by Ansible

The *Open Semantic Desktop Search* VM is provisioned by the automation tool [*Ansible*](https://docs.ansible.com/ansible/latest/index.html).

The installation and configuration of *Open Semantic Search* and the *Gnome* desktop environment is defined in the Ansible playbook [`playbook.yml`](playbook.yml).


## Prerequisites

Dependencies for the VM build process:

- *Virtual Box*

- *Vagrant*

- *Vagrant* plugin *vagrant-reload* (Command: `vagrant plugin install vagrant-reload`)


## Build

To build the Open Semantic Desktop Search VM call the bash script [`build.sh`](build.sh):

```
./build.sh
```

It will create and start a *Debian GNU/Linux* based Virtual Machine (VM) by *Vagrant* using the config file [`Vagrantfile`](Vagrantfile).

The running VM is provisioned by the *Ansible* playbook [`playbook.yml`](playbook.yml).

After that it stops and exports the VM as a *Virtual Box* Appliance to the file `open-semantic-desktop-search.ova`.


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


### Virtual Box GUI

To start the VM in the Virtual Box GUI, where you have access to Gnome Desktop UI too,
you can set/uncomment the option `vb.gui = true` in the config file [`Vagrantfile`](Vagrantfile).