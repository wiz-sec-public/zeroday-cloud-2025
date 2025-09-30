# Kubelet

This document provides the official target information and testing environment for the **Kubelet** target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)** on the underlying Kubernetes node by targeting the Kubelet component. The Kubelet exposes two primary ports that can be targeted:

* **Port 10250 (HTTPS)**: The main authenticated API.

* **Port 10255 (HTTP)**: The read-only unauthenticated API.

Your exploit must achieve RCE by targeting either of these ports.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh kubelet` on the target node.

There are two exploitation scenarios:

### Unauthenticated Scenario
In this scenario, contestants must exploit a vulnerability in the Kubelet service to achieve Remote Code Execution. The exploit must be triggered remotely against either port **10250 (HTTPS)** or **10255 (HTTP)** and must work without any prior authentication tokens or credentials.

### Authenticated Scenario  
In this scenario, contestants will be provided with a default Service Account token, as would be automatically mounted into a standard pod. Using this token, contestants must achieve Remote Code Execution on the node via the main Kubelet API (port **10250**) or the read-only API (port **10255**).

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
kubeadmConfigPatches:
- |
  kind: InitConfiguration
  nodeRegistration:
    kubeletExtraArgs:
      read-only-port: "10255"
- |
  kind: JoinConfiguration
  nodeRegistration:
    kubeletExtraArgs:
      read-only-port: "10255"
EOF
```

# Get the Worker Node IP
```bash
kubectl get node zdc-cluster-worker -o jsonpath='{.status.addresses[?(@.type=="InternalIP")].address}'
```
# Create an ubuntu pod without a token
```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-no-token
spec:
  automountServiceAccountToken: false
  containers:
  - name: ubuntu
    image: ubuntu
    command: ["/bin/bash", "-c"]
    args: ["sleep infinity"]
EOF
```


# Create an ubuntu pod with a default token
```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-with-token
spec:
  containers:
  - name: ubuntu
    image: ubuntu
    command: ["/bin/bash", "-c"]
    args: ["sleep infinity"]
EOF
```

# Test Access to the Kubelet APIs
```bash
kubectl exec -it ubuntu -- /bin/bash
apt update && apt install -y curl
curl -v -k https://<NODE_IP>:10250/pods
curl -v -k https://<NODE_IP>:10255/pods
```

## Submission & Eligibility Guidelines
If your exploit requires a configuration different from the one provided or has other specific prerequisites, you must contact the competition organizers in advance to ensure the exploit's eligibility for scoring.

For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
