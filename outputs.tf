output "public_ip" {
  value = "${aws_eip.default.public_ip}"
}

output "public_hostname" {
  value = "${aws_instance.default.public_dns}"
}

output "id" {
  value = "${aws_instance.default.id}"
}

output "ssh_key_pair" {
  value = "${var.ssh_key_pair}"
}

output "security_group_id" {
  value = "${aws_security_group.default.id}"
}

output "role" {
  value = "${aws_iam_role.default.name}"
}
