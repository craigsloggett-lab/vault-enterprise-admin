resource "vault_mount" "pki_consul" {
  path                  = "pki_consul"
  type                  = "pki"
  max_lease_ttl_seconds = local.pki_consul_mount_max_ttl_seconds
}

resource "vault_pki_secret_backend_config_urls" "pki_consul" {
  backend                 = vault_mount.pki_consul.path
  issuing_certificates    = ["https://${var.vault_fqdn}:8200/v1/pki_consul/ca"]
  crl_distribution_points = ["https://${var.vault_fqdn}:8200/v1/pki_consul/crl"]
  ocsp_servers            = ["https://${var.vault_fqdn}:8200/v1/pki_consul/ocsp"]
}

resource "vault_pki_secret_backend_intermediate_cert_request" "pki_consul" {
  backend     = vault_mount.pki_consul.path
  type        = "internal"
  common_name = "${var.cluster_name} Consul Intermediate CA"
  key_type    = "ec"
  key_bits    = 384
}

resource "vault_pki_secret_backend_root_sign_intermediate" "pki_consul" {
  backend      = local.pki_root_path
  csr          = vault_pki_secret_backend_intermediate_cert_request.pki_consul.csr
  common_name  = "${var.cluster_name} Consul Intermediate CA"
  organization = var.pki_organization
  country      = var.pki_country
  ttl          = local.pki_consul_ca_ttl
}

resource "vault_pki_secret_backend_intermediate_set_signed" "pki_consul" {
  backend     = vault_mount.pki_consul.path
  certificate = vault_pki_secret_backend_root_sign_intermediate.pki_consul.certificate
}

resource "vault_pki_secret_backend_role" "consul_server" {
  backend            = vault_mount.pki_consul.path
  name               = "consul-server"
  allowed_domains    = ["server.${var.consul_datacenter}.consul"]
  allow_bare_domains = true
  allow_subdomains   = false
  allow_localhost    = true
  allow_ip_sans      = true
  max_ttl            = local.pki_consul_server_role_max_ttl
  key_type           = "ec"
  key_bits           = 384
  ext_key_usage      = ["serverAuth", "clientAuth"]
}

resource "vault_policy" "consul_server" {
  name   = "consul-server"
  policy = file("${path.module}/policies/consul-server.hcl")
}
