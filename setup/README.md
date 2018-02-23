# Setup Initial PoA network

## Software Pre-requisites

- [Ansible](https://docs.ansible.com/ansible/latest/intro_installation.html)
- [Geth](https://github.com/ethereum/go-ethereum/wiki/geth)

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

## Account keys

For the master node and each of the observer nodes, the keys will be generated under the `keys/`
directory along with the passwords for each key. The passwords and keys _are non recoverable_.
Make sure you copy them to a safe location after the initial setup. And
_do not check them into source control_!.

## Executing the playbook

You might want to look into the connection options of `ansible-playbook` to configure your
connection, for example, to configure a different key.

```bash
ansible-playbook \
    -i ../provision/terraform/inventory-private  \
    site.yml
```
