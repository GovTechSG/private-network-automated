######################################################
# Required Arguments
######################################################

variable "vpc_id" {
    description = "IDs of the VPCs to launch instances into"
}

variable "vpc_subnets" {
    description = "List of subnets to launch the instances into"
    type = "list"
}

variable "ec2_keypair" {
    description = "Name of the EC2 keypair to attach to instances"
}

######################################################
# Optional Arguments
######################################################
variable "aws_region" {
    description = "AWs Region to run the Terraform operation in"
    default = "ap-southeast-1"
}

variable "name_prefix" {
    description = "Prefix for the names of the resources launched"
    default = "parity-poa"
}

variable "ec2_instance_type" {
    description = "Type of EC2 instance to launch"
    default = "t2.medium"
}

variable "volume_type" {
    description = "Type of EBS volume for instances"
    default = "gp2"
}

variable "volume_size" {
    description = "Size of EBS volumes in GB for instances"
    default = 50
}

variable "associate_public_ip_address" {
    description = "Set whether to associate EC2 instances with a public IP. Set to true if you are accessing them via the public internet"
    default = true
}

variable "incoming_ssh_cidr" {
    description = "Additional CIDRs to allow SSH from other than the default VPC CIDR"
    default = []
}

variable "incoming_eth_cidr" {
    description = "Additional CIDRs to allow Ethereum traffic from other than the default VPC CIDR"
    default = []
}

variable "ethereum_tcp_ports" {
    description = "TCP ports used by Ethereum for traffic"
    default = [8180, 8545, 8546, 30303]
}

variable "ethereum_udp_ports" {
    description = "UDP ports used by Ethereum for traffic"
    default = [30303]
}

variable "enable_master_node" {
    description = "Enable the deployment of a master node, or not"
    default = true
}

variable "num_validator_nodes" {
    description = "Number of validator nodes to provision initially"
    default = 2
}

variable "num_observer_nodes" {
    description = "Number of observer nodes to provision initially"
    default = 2
}

variable "tags" {
    description = "Tags to attach to provisioned resources"
    default = {
        terraform = "true"
        usage = "Parity Proof of Authority Network"
    }
}
