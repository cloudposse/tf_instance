<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![README Header][readme_header_img]][readme_header_link]

[![Cloud Posse][logo]](https://cpco.io/homepage)

# terraform-aws-ec2-instance [![Codefresh Build Status](https://g.codefresh.io/api/badges/pipeline/cloudposse/terraform-modules%2Fterraform-aws-ec2-instance?type=cf-1)](https://g.codefresh.io/public/accounts/cloudposse/pipelines/5d1a7dc1e38a04899f12f82b) [![Latest Release](https://img.shields.io/github/release/cloudposse/terraform-aws-ec2-instance.svg)](https://github.com/cloudposse/terraform-aws-ec2-instance/releases/latest) [![Slack Community](https://slack.cloudposse.com/badge.svg)](https://slack.cloudposse.com)


Terraform Module for provisioning a general purpose EC2 host.

Included features:
* Automatically create a Security Group
* Option to switch EIP attachment
* CloudWatch monitoring and automatic reboot if instance hangs
* Assume Role capability


---

This project is part of our comprehensive ["SweetOps"](https://cpco.io/sweetops) approach towards DevOps. 
[<img align="right" title="Share via Email" src="https://docs.cloudposse.com/images/ionicons/ios-email-outline-2.0.1-16x16-999999.svg"/>][share_email]
[<img align="right" title="Share on Google+" src="https://docs.cloudposse.com/images/ionicons/social-googleplus-outline-2.0.1-16x16-999999.svg" />][share_googleplus]
[<img align="right" title="Share on Facebook" src="https://docs.cloudposse.com/images/ionicons/social-facebook-outline-2.0.1-16x16-999999.svg" />][share_facebook]
[<img align="right" title="Share on Reddit" src="https://docs.cloudposse.com/images/ionicons/social-reddit-outline-2.0.1-16x16-999999.svg" />][share_reddit]
[<img align="right" title="Share on LinkedIn" src="https://docs.cloudposse.com/images/ionicons/social-linkedin-outline-2.0.1-16x16-999999.svg" />][share_linkedin]
[<img align="right" title="Share on Twitter" src="https://docs.cloudposse.com/images/ionicons/social-twitter-outline-2.0.1-16x16-999999.svg" />][share_twitter]


[![Terraform Open Source Modules](https://docs.cloudposse.com/images/terraform-open-source-modules.svg)][terraform_modules]



It's 100% Open Source and licensed under the [APACHE2](LICENSE).







We literally have [*hundreds of terraform modules*][terraform_modules] that are Open Source and well-maintained. Check them out! 







## Usage


**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/cloudposse/terraform-aws-ec2-instance/releases).


Note: add `${var.ssh_key_pair}` private key to the `ssh agent`.

Include this repository as a module in your existing terraform code.

### Simple example:

```hcl
module "instance" {
  source                      = "git::https://github.com/cloudposse/terraform-aws-ec2-instance.git?ref=master"
  ssh_key_pair                = var.ssh_key_pair
  instance_type               = var.instance_type
  vpc_id                      = var.vpc_id
  security_groups             = var.security_groups
  subnet                      = var.subnet
  name                        = "ec2"
  namespace                   = "eg"
  stage                       = "dev"
}
```

### Example with additional volumes and EIP

```hcl
module "kafka_instance" {
  source                      = "git::https://github.com/cloudposse/terraform-aws-ec2-instance.git?ref=master"
  ssh_key_pair                = var.ssh_key_pair
  vpc_id                      = var.vpc_id
  security_groups             = var.security_groups
  subnet                      = var.subnet
  associate_public_ip_address = true
  name                        = "kafka"
  namespace                   = "eg"
  stage                       = "dev"
  additional_ips_count        = 1
  ebs_volume_count            = 2
  allowed_ports               = [22, 80, 443]
}
```






## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional_ips_count | Count of additional EIPs | number | `0` | no |
| allowed_ports | List of allowed ingress ports | list(number) | `<list>` | no |
| ami | The AMI to use for the instance. By default it is the AMI provided by Amazon with Ubuntu 16.04 | string | `` | no |
| ami_owner | Owner of the given AMI (ignored if `ami` unset) | string | `` | no |
| applying_period | The period in seconds over which the specified statistic is applied | number | `60` | no |
| assign_eip_address | Assign an Elastic IP address to the instance | bool | `true` | no |
| associate_public_ip_address | Associate a public IP address with the instance | bool | `true` | no |
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| availability_zone | Availability Zone the instance is launched in. If not set, will be launched in the first AZ of the region | string | `` | no |
| comparison_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold. Possible values are: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. | string | `GreaterThanOrEqualToThreshold` | no |
| create_default_security_group | Create default Security Group with only Egress traffic allowed | bool | `true` | no |
| default_alarm_action | Default alerm action | string | `action/actions/AWS_EC2.InstanceId.Reboot/1.0` | no |
| delete_on_termination | Whether the volume should be destroyed on instance termination | bool | `true` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| disable_api_termination | Enable EC2 Instance Termination Protection | bool | `false` | no |
| ebs_device_name | Name of the EBS device to mount | list(string) | `<list>` | no |
| ebs_iops | Amount of provisioned IOPS. This must be set with a volume_type of io1 | number | `0` | no |
| ebs_optimized | Launched EC2 instance will be EBS-optimized | bool | `false` | no |
| ebs_volume_count | Count of EBS volumes that will be attached to the instance | number | `0` | no |
| ebs_volume_size | Size of the EBS volume in gigabytes | number | `10` | no |
| ebs_volume_type | The type of EBS volume. Can be standard, gp2 or io1 | string | `gp2` | no |
| evaluation_periods | The number of periods over which data is compared to the specified threshold. | number | `5` | no |
| instance_enabled | Flag to control the instance creation. Set to false if it is necessary to skip instance creation | bool | `true` | no |
| instance_type | The type of the instance | string | `t2.micro` | no |
| ipv6_address_count | Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet | number | `0` | no |
| ipv6_addresses | List of IPv6 addresses from the range of the subnet to associate with the primary network interface | list(string) | `<list>` | no |
| metric_name | The name for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ec2-metricscollected.html | string | `StatusCheckFailed_Instance` | no |
| metric_namespace | The namespace for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-namespaces.html | string | `AWS/EC2` | no |
| metric_threshold | The value against which the specified statistic is compared | number | `1` | no |
| monitoring | Launched EC2 instance will have detailed monitoring enabled | bool | `true` | no |
| name | Name  (e.g. `bastion` or `db`) | string | - | yes |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | `` | no |
| private_ip | Private IP address to associate with the instance in the VPC | string | `` | no |
| region | AWS Region the instance is launched in | string | `` | no |
| root_iops | Amount of provisioned IOPS. This must be set if root_volume_type is set to `io1` | number | `0` | no |
| root_volume_size | Size of the root volume in gigabytes | number | `10` | no |
| root_volume_type | Type of root volume. Can be standard, gp2 or io1 | string | `gp2` | no |
| security_groups | List of Security Group IDs allowed to connect to the instance | list(string) | `<list>` | no |
| source_dest_check | Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs | bool | `true` | no |
| ssh_key_pair | SSH key pair to be provisioned on the instance | string | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging` | string | `` | no |
| statistic_level | The statistic to apply to the alarm's associated metric. Allowed values are: SampleCount, Average, Sum, Minimum, Maximum | string | `Maximum` | no |
| subnet | VPC Subnet ID the instance is launched in | string | - | yes |
| tags | Additional tags | map(string) | `<map>` | no |
| user_data | Instance user data. Do not pass gzip-compressed data via this argument | string | `` | no |
| vpc_id | The ID of the VPC that the instance security group belongs to | string | - | yes |
| welcome_message | Welcome message | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| additional_eni_ids | Map of ENI to EIP |
| alarm | CloudWatch Alarm ID |
| ebs_ids | IDs of EBSs |
| id | Disambiguated ID of the instance |
| primary_network_interface_id | ID of the instance's primary network interface |
| private_dns | Private DNS of instance |
| private_ip | Private IP of instance |
| public_dns | Public DNS of instance (or DNS of EIP) |
| public_ip | Public IP of instance (or EIP) |
| role | Name of AWS IAM Role associated with the instance |
| security_group_ids | IDs on the AWS Security Groups associated with the instance |
| ssh_key_pair | Name of the SSH key pair provisioned on the instance |




## Share the Love 

Like this project? Please give it a ★ on [our GitHub](https://github.com/cloudposse/terraform-aws-ec2-instance)! (it helps us **a lot**) 

Are you using this project or any of our other projects? Consider [leaving a testimonial][testimonial]. =)


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

[![README Commercial Support][readme_commercial_support_img]][readme_commercial_support_link]

## Commercial Support

Work directly with our team of DevOps experts via email, slack, and video conferencing. 

We provide [*commercial support*][commercial_support] for all of our [Open Source][github] projects. As a *Dedicated Support* customer, you have access to our team of subject matter experts at a fraction of the cost of a full-time engineer. 

[![E-Mail](https://img.shields.io/badge/email-hello@cloudposse.com-blue.svg)][email]

- **Questions.** We'll use a Shared Slack channel between your team and ours.
- **Troubleshooting.** We'll help you triage why things aren't working.
- **Code Reviews.** We'll review your Pull Requests and provide constructive feedback.
- **Bug Fixes.** We'll rapidly work to fix any bugs in our projects.
- **Build New Terraform Modules.** We'll [develop original modules][module_development] to provision infrastructure.
- **Cloud Architecture.** We'll assist with your cloud strategy and design.
- **Implementation.** We'll provide hands-on support to implement our reference architectures. 



## Terraform Module Development

Are you interested in custom Terraform module development? Submit your inquiry using [our form][module_development] today and we'll get back to you ASAP.


## Slack Community

Join our [Open Source Community][slack] on Slack. It's **FREE** for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build totally *sweet* infrastructure.

## Newsletter

Signup for [our newsletter][newsletter] that covers everything on our technology radar.  Receive updates on what we're up to on GitHub as well as awesome new projects we discover. 

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-ec2-instance/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://cpco.io/help-out) with our other projects, we would love to hear from you! Shoot us an [email][email].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2017-2019 [Cloud Posse, LLC](https://cpco.io/copyright)



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

This project is maintained and funded by [Cloud Posse, LLC][website]. Like it? Please let us know by [leaving a testimonial][testimonial]!

[![Cloud Posse][logo]][website]

We're a [DevOps Professional Services][hire] company based in Los Angeles, CA. We ❤️  [Open Source Software][we_love_open_source].

We offer [paid support][commercial_support] on all of our projects.  

Check out [our other projects][github], [follow us on twitter][twitter], [apply for a job][jobs], or [hire us][hire] to help with your cloud strategy and implementation.



### Contributors

|  [![Erik Osterman][osterman_avatar]][osterman_homepage]<br/>[Erik Osterman][osterman_homepage] | [![Igor Rodionov][goruha_avatar]][goruha_homepage]<br/>[Igor Rodionov][goruha_homepage] | [![Andriy Knysh][aknysh_avatar]][aknysh_homepage]<br/>[Andriy Knysh][aknysh_homepage] | [![Sergey Vasilyev][s2504s_avatar]][s2504s_homepage]<br/>[Sergey Vasilyev][s2504s_homepage] | [![Valeriy][drama17_avatar]][drama17_homepage]<br/>[Valeriy][drama17_homepage] | [![Ivan Pinatti][ivan-pinatti_avatar]][ivan-pinatti_homepage]<br/>[Ivan Pinatti][ivan-pinatti_homepage] | [![Vladimir][SweetOps_avatar]][SweetOps_homepage]<br/>[Vladimir][SweetOps_homepage] | [![Konstantin B][comeanother_avatar]][comeanother_homepage]<br/>[Konstantin B][comeanother_homepage] | [![Maarten van der Hoef][maartenvanderhoef_avatar]][maartenvanderhoef_homepage]<br/>[Maarten van der Hoef][maartenvanderhoef_homepage] |
|---|---|---|---|---|---|---|---|---|

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
  [maartenvanderhoef_homepage]: https://github.com/maartenvanderhoef
  [maartenvanderhoef_avatar]: https://github.com/maartenvanderhoef.png?size=150



[![README Footer][readme_footer_img]][readme_footer_link]
[![Beacon][beacon]][website]

  [logo]: https://cloudposse.com/logo-300x69.svg
  [docs]: https://cpco.io/docs
  [website]: https://cpco.io/homepage
  [github]: https://cpco.io/github
  [jobs]: https://cpco.io/jobs
  [hire]: https://cpco.io/hire
  [slack]: https://cpco.io/slack
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://cpco.io/twitter
  [testimonial]: https://cpco.io/leave-testimonial
  [newsletter]: https://cpco.io/newsletter
  [email]: https://cpco.io/email
  [commercial_support]: https://cpco.io/commercial-support
  [we_love_open_source]: https://cpco.io/we-love-open-source
  [module_development]: https://cpco.io/module-development
  [terraform_modules]: https://cpco.io/terraform-modules
  [readme_header_img]: https://cloudposse.com/readme/header/img?repo=cloudposse/terraform-aws-ec2-instance
  [readme_header_link]: https://cloudposse.com/readme/header/link?repo=cloudposse/terraform-aws-ec2-instance
  [readme_footer_img]: https://cloudposse.com/readme/footer/img?repo=cloudposse/terraform-aws-ec2-instance
  [readme_footer_link]: https://cloudposse.com/readme/footer/link?repo=cloudposse/terraform-aws-ec2-instance
  [readme_commercial_support_img]: https://cloudposse.com/readme/commercial-support/img?repo=cloudposse/terraform-aws-ec2-instance
  [readme_commercial_support_link]: https://cloudposse.com/readme/commercial-support/link?repo=cloudposse/terraform-aws-ec2-instance
  [share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-ec2-instance&url=https://github.com/cloudposse/terraform-aws-ec2-instance
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-ec2-instance&url=https://github.com/cloudposse/terraform-aws-ec2-instance
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/cloudposse/terraform-aws-ec2-instance
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/cloudposse/terraform-aws-ec2-instance
  [share_googleplus]: https://plus.google.com/share?url=https://github.com/cloudposse/terraform-aws-ec2-instance
  [share_email]: mailto:?subject=terraform-aws-ec2-instance&body=https://github.com/cloudposse/terraform-aws-ec2-instance
  [beacon]: https://ga-beacon.cloudposse.com/UA-76589703-4/cloudposse/terraform-aws-ec2-instance?pixel&cs=github&cm=readme&an=terraform-aws-ec2-instance
