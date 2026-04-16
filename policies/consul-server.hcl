# Issue certificates for Consul server nodes
path "pki_consul/issue/consul-server" {
  capabilities = ["update"]
}

# Read the CA cert and chain for trust establishment
path "pki_consul/cert/ca" {
  capabilities = ["read"]
}

path "pki_consul/cert/ca_chain" {
  capabilities = ["read"]
}

# Read the root CA cert to build a full trust bundle
path "pki_root/cert/ca" {
  capabilities = ["read"]
}
