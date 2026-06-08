#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="monitoring"

echo "==> Creating namespace ${NAMESPACE}"
kubectl apply -f manifests/namespace.yaml

echo "==> Installing kube-prometheus-stack via Helm"
helm upgrade --install observability \
  prometheus-community/kube-prometheus-stack \
    --namespace "${NAMESPACE}" \
      --values values/prometheus-values.yaml \
        --values values/grafana-values.yaml \
          --wait

          echo "==> Applying alerting rules"
          kubectl apply -n "${NAMESPACE}" -f alerts/slo-alerts.yaml

          echo "==> Done. Port-forward Grafana with:"
          echo "    kubectl port-forward -n ${NAMESPACE} svc/observability-grafana 3000:80"
