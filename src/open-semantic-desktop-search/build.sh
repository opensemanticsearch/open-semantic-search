#!/bin/bash

# must be same like in Vagrantfile in setting vb.name
VMNAME=Open_Semantic_Desktop_Search

# enable disk resize feature used by Vagrantfile
export VAGRANT_EXPERIMENTAL="disks"

# create build VM, start it and provision by Ansible playbook
vagrant up

# stop build VM
vagrant halt

# export appliance
VBoxManage export ${VMNAME} --output open-semantic-desktop-search.ova --options manifest,nomacs --vsys 0 --vmname "Open Semantic Desktop Search" --product "Open Semantic Desktop Search" --producturl https://opensemanticsearch.org

# remove build VM
vagrant destroy
