# Homelab

Declarative Kubernetes homelab infrastructure managed with Argo CD, Helm, Terraform, and Ansible.

This repository contains the code and configuration for a personal Kubernetes homelab. It brings together the infrastructure definitions, host configuration, cluster bootstrap resources, Kubernetes manifests, and Helm charts used by the environment.

## Structure

- `ansible/` — host and Kubernetes node configuration.
- `charts/` — Helm charts and chart values.
- `apps/` — Argo CD application definitions.
- `bootstrap/` — initial cluster resources.
- `terraform/` — infrastructure definitions.
