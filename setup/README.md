# Setup Initial PoA network

## Software Pre-requisites

- [Ansible](https://docs.ansible.com/ansible/latest/intro_installation.html)

## Pre-requisites

- SSH access to your machine
- Ansible [inventory](https://docs.ansible.com/ansible/latest/intro_inventory.html)

The ansible inventory must have the following groups:

- `validators` for the initial validator nodes
- `observers` for the initial observer nodes

and the following host:

- `master` for the master node

The example provisioners provided should already generate the inventory for you automatically as
part of the provisioning.

This directory has some included host and group variables that might not be correct for the hosts
you are setting up on. Take a look at the following directory for more information and refer
to the [documentation](https://docs.ansible.com/ansible/latest/intro_inventory.html) on how they
work:

- `host_vars`
- `group_vars`
