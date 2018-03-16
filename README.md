# Setup a Parity Proof of Authority network

Automate the creation of a Parity [Proof of Authority](https://paritytech.github.io/wiki/Proof-of-Authority-Chains) Network.

## Steps

1. Provision your machines, either VMs or instances on a cloud provider or otherwise.
1. Setup the initial validator nodes, including one "master" validator node.
1. Add validator nodes as neccessary.
1. Add "observer" nodes as neccessary.

## Provisioning

You can see the provided [examples](provision) on how to provision your machines.  Your machines
need to have the SSH ports and the various Ethereum ports open so that they can be connected to
and configured.

- SSH: 22
- TCP Ethereum Ports: 8180, 8545, 8546, 30303
- UDP Ethereum Ports: 30303

Your machines should also be running Ubuntu. If you would like to use other OSes instead, you will
have to modify the setup scripts accordingly.

### Vagrant

This example shows you how to setup a cluster of Virtualbox VMs on your computer using
[Vagrant](https://www.vagrantup.com/).

**TODO**

### Terraform on AWS

You can use the provided [Terraform](https://www.terraform.io/) module to Terraform some EC2
instances with Docker and Docker Compose installed.

See the [README](provision/terraform/README.md) for more information.

## Setup

See the [README](setup/README.md) for more information.


## Post-setup

After you have setup the network, you can perform tasks including:

- Adding a validator node
- Upgrading the validator contract

You can see more information and instructions
[here](https://github.com/GovTechSG/private-network#post-setup-tasks).
