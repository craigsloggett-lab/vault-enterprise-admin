# Vault Enterprise Admin

An infrastructure as code repository to manage a Vault Enterprise cluster's configuration.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 5.8.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.8.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Vault cluster, used in PKI common names | `string` | n/a | yes |
| <a name="input_consul_datacenter"></a> [consul\_datacenter](#input\_consul\_datacenter) | Consul datacenter name, used in PKI allowed\_domains (e.g. 'dc1') | `string` | n/a | yes |
| <a name="input_consul_server_iam_role_arn"></a> [consul\_server\_iam\_role\_arn](#input\_consul\_server\_iam\_role\_arn) | ARN of the IAM role bound to the consul-server Vault auth role | `string` | n/a | yes |
| <a name="input_pki_country"></a> [pki\_country](#input\_pki\_country) | Country code for PKI certificates | `string` | n/a | yes |
| <a name="input_pki_organization"></a> [pki\_organization](#input\_pki\_organization) | Organization name for PKI certificates | `string` | n/a | yes |
| <a name="input_vault_fqdn"></a> [vault\_fqdn](#input\_vault\_fqdn) | Fully qualified domain name of the Vault cluster | `string` | n/a | yes |

## Resources

| Name | Type |
| ---- | ---- |
| [vault_aws_auth_backend_role.consul_server](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/aws_auth_backend_role) | resource |
| [vault_mount.pki_consul](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/mount) | resource |
| [vault_pki_secret_backend_config_urls.pki_consul](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/pki_secret_backend_config_urls) | resource |
| [vault_pki_secret_backend_intermediate_cert_request.pki_consul](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/pki_secret_backend_intermediate_cert_request) | resource |
| [vault_pki_secret_backend_intermediate_set_signed.pki_consul](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/pki_secret_backend_intermediate_set_signed) | resource |
| [vault_pki_secret_backend_role.consul_server](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/pki_secret_backend_role) | resource |
| [vault_pki_secret_backend_root_sign_intermediate.pki_consul](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/pki_secret_backend_root_sign_intermediate) | resource |
| [vault_policy.consul_server](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/resources/policy) | resource |
| [vault_auth_backend.aws](https://registry.terraform.io/providers/hashicorp/vault/5.8.0/docs/data-sources/auth_backend) | data source |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_pki_consul_mount_path"></a> [pki\_consul\_mount\_path](#output\_pki\_consul\_mount\_path) | Mount path of the Consul PKI secrets engine |
| <a name="output_pki_consul_role_name"></a> [pki\_consul\_role\_name](#output\_pki\_consul\_role\_name) | Name of the Consul server PKI role |
| <a name="output_vault_aws_auth_consul_role_name"></a> [vault\_aws\_auth\_consul\_role\_name](#output\_vault\_aws\_auth\_consul\_role\_name) | Name of the AWS auth role for Consul servers |
<!-- END_TF_DOCS -->
