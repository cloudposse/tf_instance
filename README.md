<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

[![Cloud Posse](https://cloudposse.com/logo-300x69.svg)](https://cloudposse.com)

# terraform-aws-ec2-instance [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-ec2-instance.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-ec2-instance) [![Latest Release](https://img.shields.io/github/release/cloudposse/terraform-aws-ec2-instance.svg)](https://github.com/cloudposse/terraform-aws-ec2-instance/releases/latest) [![Slack Community](https://slack.cloudposse.com/badge.svg)](https://slack.cloudposse.com)


Terraform Module for provisioning a general purpose EC2 host.

Included features:
* Automatically create a Security Group
* Option to switch EIP attachment
* CloudWatch monitoring and automatic reboot if instance hangs
* Assume Role capability


---

This project is part of our comprehensive ["SweetOps"](https://docs.cloudposse.com) approach towards DevOps. 


It's 100% Open Source and licensed under the [APACHE2](LICENSE).





## Usage

Note: add `${var.ssh_key_pair}` private key to the `ssh agent`.

Include this repository as a module in your existing terraform code.

### Simple example:

```hcl
module "instance" {
  source                      = "git::https://github.com/cloudposse/terraform-aws-ec2-instance.git?ref=master"
  ssh_key_pair                = "${var.ssh_key_pair}"
  instance_type               = "${var.instance_type}"
  vpc_id                      = "${var.vpc_id}"
  security_groups             = ["${var.security_groups}"]
  subnet                      = "${var.subnet}"
  name                        = "${var.name}"
  namespace                   = "${var.namespace}"
  stage                       = "${var.stage}"
}
```

### Example with additional volumes and EIP

```hcl
module "kafka_instance" {
  source                      = "git::https://github.com/cloudposse/terraform-aws-ec2-instance.git?ref=master"
  ssh_key_pair                = "${var.ssh_key_pair}"
  vpc_id                      = "${var.vpc_id}"
  security_groups             = ["${var.security_groups}"]
  subnet                      = "${var.subnet}"
  associate_public_ip_address = "true"
  name                        = "kafka"
  namespace                   = "cp"
  stage                       = "dev"
  additional_ips_count        = "1"
  ebs_volume_count            = "2"
  allowed_ports               = ["22", "80", "443"]
}
```






## Makefile Targets
```
Available targets:

  help                                This help screen
  help/all                            Display help for all targets
  lint                                Lint terraform code

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_ips_count | Count of additional EIPs | string | `0` | no |
| allowed_ports | List of allowed ingress ports | list | `<list>` | no |
| ami | The AMI to use for the instance. By default it is the AMI provided by Amazon with Ubuntu 16.04 | string | `` | no |
| applying_period | The period in seconds over which the specified statistic is applied | string | `60` | no |
| assign_eip_address | Assign an Elastic IP address to the instance | string | `true` | no |
| associate_public_ip_address | Associate a public IP address with the instance | string | `true` | no |
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| availability_zone | Availability Zone the instance is launched in. If not set, will be launched in the first AZ of the region | string | `` | no |
| comparison_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold. Possible values are: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. | string | `GreaterThanOrEqualToThreshold` | no |
| create_default_security_group | Create default Security Group with only Egress traffic allowed | string | `true` | no |
| default_alarm_action |  | string | `action/actions/AWS_EC2.InstanceId.Reboot/1.0` | no |
| delete_on_termination | Whether the volume should be destroyed on instance termination | string | `true` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| disable_api_termination | Enable EC2 Instance Termination Protection | string | `false` | no |
| ebs_device_name | Name of the EBS device to mount | list | `<list>` | no |
| ebs_iops | Amount of provisioned IOPS. This must be set with a volume_type of io1 | string | `0` | no |
| ebs_optimized | Launched EC2 instance will be EBS-optimized | string | `false` | no |
| ebs_volume_count | Count of EBS volumes that will be attached to the instance | string | `0` | no |
| ebs_volume_size | Size of the EBS volume in gigabytes | string | `10` | no |
| ebs_volume_type | The type of EBS volume. Can be standard, gp2 or io1 | string | `gp2` | no |
| evaluation_periods | The number of periods over which data is compared to the specified threshold. | string | `5` | no |
| instance_enabled | Flag to control the instance creation. Set to false if it is necessary to skip instance creation | string | `true` | no |
| instance_type | The type of the instance | string | `t2.micro` | no |
| ipv6_address_count | Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet | string | `0` | no |
| ipv6_addresses | List of IPv6 addresses from the range of the subnet to associate with the primary network interface | list | `<list>` | no |
| metric_name | The name for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ec2-metricscollected.html | string | `StatusCheckFailed_Instance` | no |
| metric_namespace | The namespace for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-namespaces.html | string | `AWS/EC2` | no |
| metric_threshold | The value against which the specified statistic is compared | string | `1` | no |
| monitoring | Launched EC2 instance will have detailed monitoring enabled | string | `true` | no |
| name | Name  (e.g. `bastion` or `db`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| private_ip | Private IP address to associate with the instance in the VPC | string | `` | no |
| region | AWS Region the instance is launched in | string | `` | no |
| root_iops | Amount of provisioned IOPS. This must be set if root_volume_type is set to `io1` | string | `0` | no |
| root_volume_size | Size of the root volume in gigabytes | string | `10` | no |
| root_volume_type | Type of root volume. Can be standard, gp2 or io1 | string | `gp2` | no |
| security_groups | List of Security Group IDs allowed to connect to the instance | list | `<list>` | no |
| source_dest_check | Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs | string | `true` | no |
| ssh_key_pair | SSH key pair to be provisioned on the instance | string | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging` | string | - | yes |
| statistic_level | The statistic to apply to the alarm's associated metric. Allowed values are: SampleCount, Average, Sum, Minimum, Maximum | string | `Maximum` | no |
| subnet | VPC Subnet ID the instance is launched in | string | - | yes |
| tags | Additional tags | map | `<map>` | no |
| user_data | Instance user data. Do not pass gzip-compressed data via this argument | string | `` | no |
| vpc_id | The ID of the VPC that the instance security group belongs to | string | - | yes |
| welcome_message |  | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| additional_eni_ids | Map of ENI to EIP |
| alarm | CloudWatch Alarm ID |
| ebs_ids | IDs of EBSs |
| id | Disambiguated ID of the instance |
| network_interface_id | ID of the network interface that was created with the instance |
| primary_network_interface_id | ID of the instance's primary network interface |
| private_dns | Private DNS of instance |
| private_ip | Private IP of instance |
| public_dns | Public DNS of instance (or DNS of EIP) |
| public_ip | Public IP of instance (or EIP) |
| role | Name of AWS IAM Role associated with the instance |
| security_group_ids | IDs on the AWS Security Groups associated with the instance |
| ssh_key_pair | Name of the SSH key pair provisioned on the instance |




## Related Projects

Check out these related projects.

- [terraform-aws-ec2-ami-backup](https://github.com/cloudposse/terraform-aws-ec2-ami-backup) - Terraform module for automatic & scheduled AMI creation
- [terraform-aws-ec2-ami-snapshot](https://github.com/cloudposse/terraform-aws-ec2-ami-snapshot) - Terraform module to easily generate AMI snapshots to create replica instances
- [terraform-aws-ec2-cloudwatch-sns-alarms](https://github.com/cloudposse/terraform-aws-ec2-cloudwatch-sns-alarms) - Terraform module that configures CloudWatch SNS alerts for EC2 instances
- [terraform-null-label](https://github.com/cloudposse/terraform-null-label) - Terraform Module to define a consistent naming convention by (namespace, stage, name, [attributes])




## References

For additional context, refer to some of these links. 

- [terraform-aws-ec2-bastion-server](https://github.com/cloudposse/terraform-aws-ec2-bastion-server) - Terraform Module to define a generic Bastion host with parameterized user_data


## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-ec2-instance/issues), send us an [email][email] or join our [Slack Community][slack].

## Commerical Support

Work directly with our team of DevOps experts via email, slack, and video conferencing. 

We provide *commercial support* for all of our [Open Source][github] projects. As a *Dedicated Support* customer, you have access to our team of subject matter experts at a fraction of the cost of a fulltime engineer. 

[![E-Mail](https://img.shields.io/badge/email-hello@cloudposse.com-blue.svg)](mailto:hello@cloudposse.com)

- **Questions.** We'll use a Shared Slack channel between your team and ours.
- **Troubleshooting.** We'll help you triage why things aren't working.
- **Code Reviews.** We'll review your Pull Requests and provide constructive feedback.
- **Bug Fixes.** We'll rapidly work to fix any bugs in our projects.
- **Build New Terraform Modules.** We'll develop original modules to provision infrastructure.
- **Cloud Architecture.** We'll assist with your cloud strategy and design.
- **Implementation.** We'll provide hands on support to implement our reference architectures. 


## Community Forum

Get access to our [Open Source Community Forum][slack] on Slack. It's **FREE** to join for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build *sweet* infrastructure.

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-ec2-instance/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://github.com/orgs/cloudposse/projects/3) with our other projects, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2017-2018 [Cloud Posse, LLC](https://cloudposse.com)



## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Cloud Posse, LLC][website]. Like it? Please let us know at <hello@cloudposse.com>

[![Cloud Posse](https://cloudposse.com/logo-300x69.svg)](https://cloudposse.com)

We're a [DevOps Professional Services][hire] company based in Los Angeles, CA. We love [Open Source Software](https://github.com/cloudposse/)!

We offer paid support on all of our projects.  

Check out [our other projects][github], [apply for a job][jobs], or [hire us][hire] to help with your cloud strategy and implementation.

  [docs]: https://docs.cloudposse.com/
  [website]: https://cloudposse.com/
  [github]: https://github.com/cloudposse/
  [jobs]: https://cloudposse.com/jobs/
  [hire]: https://cloudposse.com/contact/
  [slack]: https://slack.cloudposse.com/
  [linkedin]: https://www.linkedin.com/company/cloudposse
  [twitter]: https://twitter.com/cloudposse/
  [email]: mailto:hello@cloudposse.com


### Contributors

|  [![Erik Osterman][osterman_avatar]][osterman_homepage]<br/>[Erik Osterman][osterman_homepage] | [![Igor Rodionov][goruha_avatar]][goruha_homepage]<br/>[Igor Rodionov][goruha_homepage] | [![Andriy Knysh][aknysh_avatar]][aknysh_homepage]<br/>[Andriy Knysh][aknysh_homepage] | [![Sergey Vasilyev][s2504s_avatar]][s2504s_homepage]<br/>[Sergey Vasilyev][s2504s_homepage] | [![Valeriy][drama17_avatar]][drama17_homepage]<br/>[Valeriy][drama17_homepage] | [![Ivan Pinatti][ivan-pinatti_avatar]][ivan-pinatti_homepage]<br/>[Ivan Pinatti][ivan-pinatti_homepage] | [![Vladimir][SweetOps_avatar]][SweetOps_homepage]<br/>[Vladimir][SweetOps_homepage] | [![Konstantin B][comeanother_avatar]][comeanother_homepage]<br/>[Konstantin B][comeanother_homepage] |
|---|---|---|---|---|---|---|---|

  [osterman_homepage]: https://github.com/osterman
  [osterman_avatar]: https://github.com/osterman.png?size=150
  [goruha_homepage]: https://github.com/goruha
  [goruha_avatar]: https://github.com/goruha.png?size=150
  [aknysh_homepage]: https://github.com/aknysh
  [aknysh_avatar]: https://github.com/aknysh.png?size=150
  [s2504s_homepage]: https://github.com/s2504s
  [s2504s_avatar]: https://github.com/s2504s.png?size=150
  [drama17_homepage]: https://github.com/drama17
  [drama17_avatar]: https://github.com/drama17.png?size=150
  [ivan-pinatti_homepage]: https://github.com/ivan-pinatti
  [ivan-pinatti_avatar]: https://github.com/ivan-pinatti.png?size=150
  [SweetOps_homepage]: https://github.com/SweetOps
  [SweetOps_avatar]: https://github.com/SweetOps.png?size=150
  [comeanother_homepage]: https://github.com/comeanother
  [comeanother_avatar]: https://github.com/comeanother.png?size=150


