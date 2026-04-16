output "pki_consul_mount_path" {
  description = "Mount path of the Consul PKI secrets engine"
  value       = vault_mount.pki_consul.path
}

output "pki_consul_role_name" {
  description = "Name of the Consul server PKI role"
  value       = vault_pki_secret_backend_role.consul_server.name
}

output "vault_aws_auth_consul_role_name" {
  description = "Name of the AWS auth role for Consul servers"
  value       = vault_aws_auth_backend_role.consul_server.role
}
