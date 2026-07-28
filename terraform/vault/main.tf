terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

provider "vault" {
  address         = var.vault_address
  token           = var.vault_token
  skip_tls_verify = var.vault_skip_tls_verify
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  backend         = vault_auth_backend.kubernetes.path
  kubernetes_host = var.kubernetes_host
}

resource "vault_mount" "kubernetes" {
  path = "kubernetes"
  type = "kv"
  options = {
    version = "2"
  }
}

resource "vault_mount" "kubernetes_oci" {
  path = "kubernetes-oci"
  type = "kv"
  options = {
    version = "2"
  }
}

resource "vault_policy" "external_secrets" {
  name   = "external-secrets"
  policy = <<-EOT
    path "kubernetes/data/*" {
      capabilities = ["read"]
    }

    path "kubernetes-oci/data/*" {
      capabilities = ["read"]
    }
  EOT
}

resource "vault_kubernetes_auth_backend_role" "external_secrets" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "external-secrets"
  bound_service_account_names      = [var.external_secrets_service_account]
  bound_service_account_namespaces = [var.external_secrets_namespace]
  token_policies                   = [vault_policy.external_secrets.name]
}
