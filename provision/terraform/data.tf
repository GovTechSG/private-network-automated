# See https://www.andreagrandi.it/2017/08/25/getting-latest-ubuntu-ami-with-terraform/
data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"] # Canonical

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name = "architecture"
        values = ["x86_64"]
    }

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }
}

data "aws_vpc" "this" {
    id = "${var.vpc_id}"
}
