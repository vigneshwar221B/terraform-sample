## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.29.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-instances"></a> [ec2-instances](#module\_ec2-instances) | ./modules/ec2 | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |
| <a name="module_rds-instance"></a> [rds-instance](#module\_rds-instance) | ./modules/rds | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.rds-subnet](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/db_subnet_group) | data source |
| [aws_subnets.private-subnets](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/subnets) | data source |
| [aws_subnets.public-subnets](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/subnets) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rds-password"></a> [rds-password](#input\_rds-password) | n/a | `any` | n/a | yes |
| <a name="input_rds-user"></a> [rds-user](#input\_rds-user) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds-endpoint"></a> [rds-endpoint](#output\_rds-endpoint) | n/a |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.29.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_instances"></a> [ec2\_instances](#module\_ec2\_instances) | ./modules/ec2 | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking | n/a |
| <a name="module_rds_instance"></a> [rds\_instance](#module\_rds\_instance) | ./modules/rds | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.rds_subnet](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/db_subnet_group) | data source |
| [aws_subnets.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/subnets) | data source |
| [aws_subnets.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/subnets) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/4.29.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_my_ip"></a> [my\_ip](#input\_my\_ip) | cidr block for vpc/subnets/sg | `string` | `"122.187.88.146/32"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | cidr, az, name of private subnets | `list` | <pre>[<br>  {<br>    "az": "us-east-1a",<br>    "cidr": "10.0.128.0/20",<br>    "name": "prv-1"<br>  },<br>  {<br>    "az": "us-east-1b",<br>    "cidr": "10.0.144.0/20",<br>    "name": "prv-2"<br>  }<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | cidr, az, name of pubic subnets | `list` | <pre>[<br>  {<br>    "az": "us-east-1a",<br>    "cidr": "10.0.0.0/20",<br>    "name": "pub-1"<br>  },<br>  {<br>    "az": "us-east-1b",<br>    "cidr": "10.0.16.0/20",<br>    "name": "pub-2"<br>  }<br>]</pre> | no |
| <a name="input_rds_password"></a> [rds\_password](#input\_rds\_password) | rds password for initial user | `any` | n/a | yes |
| <a name="input_rds_user"></a> [rds\_user](#input\_rds\_user) | rds username for initial user | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | public dns for the ALB |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | RDS endpoint to connect to |
<!-- END_TF_DOCS -->