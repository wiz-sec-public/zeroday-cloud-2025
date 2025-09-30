# Kubernetes API Server

This document provides the official target information and testing environment for the **Kubernetes API Server** target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve unauthenticated **Remote Code Execution (RCE)** on the Kubernetes API Server.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh k8s-apiserver` on the API Server's pod.

---

## Local Testing Environment

For your convenience, we have provided a KinD (Kubernetes in Docker) setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

# Create a kind cluster
```bash
kind create cluster --name zdc-cluster --config - <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
EOF
```

# Get the API Server URL
```bash
export APISERVER_URL=$(kubectl cluster-info | grep 'control plane' | awk '/is running at/ {print $NF}')
```

# Test Unauthenticated Access
```bash
curl -k "$APISERVER_URL/healthz"
```

## Submission & Eligibility Guidelines
If your exploit requires a configuration different from the one provided or has other specific prerequisites, you must contact the competition organizers in advance to ensure the exploit's eligibility for scoring.

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
