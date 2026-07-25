variable "vault_address" {
  type    = string
  default = "http://vault.home.arpa"
}

variable "vault_token" {
  type      = string
  sensitive = true
}

variable "kubernetes_host" {
  type    = string
  default = "https://kubernetes.default.svc"
}

variable "external_secrets_namespace" {
  type    = string
  default = "external-secrets"
}

variable "external_secrets_service_account" {
  type    = string
  default = "external-secrets"
}

