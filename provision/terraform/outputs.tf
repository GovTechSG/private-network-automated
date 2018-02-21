output "master_sg" {
    description = "Security group ID for the Master node"
    value = "${aws_security_group.master.id}"
}

output "node_sg" {
    description = "Security group ID for all the nodes"
    value = "${aws_security_group.nodes.id}"
}

output "master_node_id" {
    description = "Instance ID for the master node"
    value = "${aws_instance.master.id}"
}

output "master_ip_public" {
    description = "Public IP (if any) for the master node"
    value = "${aws_instance.master.public_ip}"
}

output "master_ip_private" {
    description = "Private IP for the master node"
    value = "${aws_instance.master.private_ip}"
}

output "validator_nodes_ids" {
    description = "Instance IDs for the validator nodes"
    value = "${aws_instance.validators.*.id}"
}

output "validators_ip_public" {
    description = "Public IP (if any) for the validator nodes"
    value = "${aws_instance.validators.*.public_ip}"
}

output "validators_ip_private" {
    description = "Private IP for the validator nodes"
    value = "${aws_instance.validators.*.private_ip}"
}

output "observer_nodes_ids" {
    description = "Instance IDs for the observer nodes"
    value = "${aws_instance.observers.*.id}"
}

output "observers_ip_public" {
    description = "Public IP (if any) for the observer nodes"
    value = "${aws_instance.observers.*.public_ip}"
}

output "observers_ip_private" {
    description = "Private IP for the observer nodes"
    value = "${aws_instance.observers.*.private_ip}"
}

output "inventory_public" {
    description = "Ansible inventory file with public IP addresses"
    value = "${data.template_file.inventory_public.rendered}"
}

output "inventory_private" {
    description = "Ansible inventory file with private IP addresses"
    value = "${data.template_file.inventory_private.rendered}"
}
