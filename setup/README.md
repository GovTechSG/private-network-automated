# Setup Initial PoA network

## Software Pre-requisites

- [Ansible](https://docs.ansible.com/ansible/latest/intro_installation.html)
- [Geth](https://github.com/ethereum/go-ethereum/wiki/geth)
- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://github.com/docker/compose/releases)

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

If you are connecting to your machines for the first time, you might see a prompt about trusting
the host keys on the remote machine. To bypass this, you can add `ANSIBLE_HOST_KEY_CHECKING=False`
before executing the playbook. Subsequent runs will not require this override.

## Tags

You can use [tags](https://docs.ansible.com/ansible/latest/playbooks_tags.html) to skip tasks or
to only execute tasks. This section will describe the various tags present in the playbook.

- `bootstrap`: Setup all the neccessary software and bootstrap the initial network, including creating the various keys for the master and validator nodes, the genesis block file and the initial Parity configuration. Within the bootstrap step, there are additional tags that you can use to skip steps.
- `install`: Install pre-requisite software.
- `generate_keys`: Ethereum Key generation is tagged to this. You can use this to skip key generation if you already have the keys.
- `genesis`: Genesis generation is tied to this. You can skip this tag to avoid Geneis block generation if you already have the file.
- `generate_enode`: Node keys is tagged to this. You can use this to skip key generation if you already have the keys.
- `configuration`: Configuration is tagged to this. This can be skipped.
- `run`: Create the Docker containers to run the clients.

## About enode ID

The Ethereum network protocol is described
[here](https://github.com/ethereum/devp2p/blob/master/rlpx.md#network-formation).

Each node is expected to have a ECDSA keypair using the `secp256k1` curve. Then, the `enode ID` is
simply the uncompressed public key with the initial `0x04` byte stripped out. See
[this post](https://stackoverflow.com/a/6687080) for a discussion of the key length.

We reference [this post](https://bitcoin.stackexchange.com/a/59646) on how to generate the
network key and enode ID for the master node, for example:

```bash
# Generate the private key in PEM
openssl ecparam -name secp256k1 -genkey -noout -out keys/master.network.pem
# Generate the public key in PEM
openssl ec -in keys/master.network.pem -pubout -out keys/master.network.public.pem

# Convert PEM private key to DER and then extract the 32 bytes out to hexadecimal
openssl ec -in keys/master.network.pem -outform DER|tail -c +8|head -c 32|xxd -p -c 32 > keys/master.network

# Convert PEM private key to DER public key and then extract the 64 bytes out to hexadecimal
openssl ec -in keys/master.network.pem -pubout -outform DER|tail -c 64|xxd -p -c 64 > keys/master.network.public
```
