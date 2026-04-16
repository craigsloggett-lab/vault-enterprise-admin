output "vault_auth_backend" {
  value       = data.vault_auth_backend.aws
  description = "The AWS Auth method"
}
