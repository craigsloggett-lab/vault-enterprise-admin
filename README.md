# Vault Enterprise Admin

An infrastructure as code repository to manage a Vault Enterprise cluster's configuration.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | 5.9.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 5.9.0 |

## Modules

No modules.

## Inputs

No inputs.

## Resources

| Name | Type |
| ---- | ---- |
| [vault_auth_backend.aws](https://registry.terraform.io/providers/hashicorp/vault/5.9.0/docs/data-sources/auth_backend) | data source |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_vault_auth_backend"></a> [vault\_auth\_backend](#output\_vault\_auth\_backend) | The AWS Auth method |
<!-- END_TF_DOCS -->
