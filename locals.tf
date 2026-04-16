locals {
  pki_root_path                    = "pki_root"
  pki_consul_mount_max_ttl_seconds = 157680000 # 5 years
  pki_consul_ca_ttl                = "43800h"  # 5 years
  pki_consul_server_role_max_ttl   = "2160h"   # 90 days
  aws_auth_role_ttl                = 3600      # 1 hour
  aws_auth_role_max_ttl            = 14400     # 4 hours
}
