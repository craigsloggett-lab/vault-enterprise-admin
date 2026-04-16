data "vault_auth_backend" "aws" {
  path = "aws"
}

resource "vault_aws_auth_backend_role" "consul_server" {
  backend                  = data.vault_auth_backend.aws.path
  role                     = "consul-server"
  auth_type                = "iam"
  bound_iam_principal_arns = [var.consul_server_iam_role_arn]
  token_policies           = [vault_policy.consul_server.name]
  token_ttl                = local.aws_auth_role_ttl
  token_max_ttl            = local.aws_auth_role_max_ttl
}
