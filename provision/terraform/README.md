# Provision AWS EC2 instances with Terraform

## Software Pre-requisites

1. [Terraform](https://www.terraform.io/)
1. [Ansible](https://docs.ansible.com/ansible/latest/intro_installation.html)
1. [Packer](https://www.packer.io/)
1. [AWS CLI](https://aws.amazon.com/cli/)

## AWS Pre-requisite

1. Obtain an Access Key and Secret for your AWS account and [configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) the AWS CLI accordingly. Using [named profiles](https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html) is recommended.
1. Create or reuse an [EC2 key pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html) so that you can SSH into the machines provisioned.
1. Create a [VPC](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Introduction.html) for your account. By default, AWS will create a default VPC for you.

## Steps

1. Initialize Terraform
1. Plan with Terraform
1. Apply with Terraform

### Initialize Terraform

We will initialize Terraform with the [`terraform init`](https://www.terraform.io/docs/commands/init.html) command.

The example shown will use a local backend which is _not suitable_ for most production uses. You
might want to consider configuring a different
[backend](https://www.terraform.io/docs/backends/index.html) for your needs.

### Plan with Terraform

We will first need to define the values for some [input variables](https://www.terraform.io/intro/getting-started/variables.html).

Refer to `variables.tf` to see the list of variables that you need to configure. Then, create a
variable file (for example `vars.tfvars`) with your values.

For example

```hcl
vpc_id = "vpc-xxx"
vpc_subnets = ["subnet-xxx", "subnet-xxx"]
ec2_keypair = "key"
incoming_ssh_cidr = ["192.168.0.0/16"]
incoming_eth_cidr = ["192.168.0.0/16"]
```

Then, ask Terraform to plan what it is going to do and check to see if it makes sense.

```bash
terraform plan --var-file vars.tfvars
```

### Apply with Terraform

Once everything looks good, apply the configuration with Terraform:

```bash
terraform apply --var-file vars.tfvars
```
