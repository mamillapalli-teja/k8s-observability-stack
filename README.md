# Kubernetes Observability Stack

A production-ready monitoring and alerting stack for Kubernetes, built on Prometheus and Grafana and deployed via Helm. Provides cluster-wide metrics collection, pre-built dashboards, and SLO-based alerting out of the box.

## Features

- **Metrics collection** with Prometheus and node-exporter across all cluster nodes
- **Visualization** with Grafana, including persistent storage and default dashboards
- **SLO-based alerting** with error-budget burn-rate and P95 latency rules
- **GitOps-friendly** — all configuration is declarative and version-controlled
- **One-command install** via Helm and a wrapper script

## Prerequisites

- A Kubernetes cluster (v1.24+)
- `kubectl` configured for your cluster
- `helm` v3+

## Quick Start

```bash
# Add the Prometheus community Helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install the stack
./scripts/install.sh
```

Then port-forward Grafana and open http://localhost:3000 (default user: `admin`):

```bash
kubectl port-forward -n monitoring svc/observability-grafana 3000:80
```

## Repository Layout

| Path | Purpose |
|------|---------|
| `values/` | Helm value overrides for Prometheus and Grafana |
| `manifests/` | Namespace and Kubernetes manifests |
| `alerts/` | Prometheus alerting rules (SLO burn-rate) |
| `scripts/` | Install/setup helpers |
| `dashboards/` | Grafana dashboard JSON (cluster overview) |

## License

Released under the MIT License.
