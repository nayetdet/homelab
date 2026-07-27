# Homelab

Declarative Kubernetes homelab infrastructure managed with Argo CD, Helm,
Terraform, and Ansible.

This repository contains the infrastructure, host configuration, cluster
bootstrap resources, Kubernetes applications, and Helm charts for the homelab.

## Structure

- `ansible/` — host and Kubernetes node configuration
- `charts/` — local Helm charts and values
- `apps/` — Argo CD Application definitions
- `bootstrap/` — initial cluster resources
- `terraform/` — infrastructure definitions

## Bootstrap

With the cluster running, `kubectl` configured, and `kubectl`, `helm`, and
`make` installed, run:

```bash
make bootstrap
```

This installs Argo CD and applies the App of Apps, which then manages the
applications defined under `apps/`.
