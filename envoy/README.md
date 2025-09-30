# Envoy Proxy

This document provides the official target information and testing environment for the Envoy Proxy target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the service exposed on port **10000 (HTTPS)**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh envoy` on the target system.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration. For this target, we use the official Google VRP (Vulnerability Research Program) docker image.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

The following description of the environment is taken from the official Envoy documentation at https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/security/google_vrp.

Two Envoy processes are available when the image is launched:

The **edge** Envoy is listening on port 10000 (HTTPS). It has a static configuration that is configured according to Envoy’s edge hardening principles. It has sinkhole, direct response and request forwarding routing rules (in order):

* `/content/*`: routes to the origin Envoy server.

* `/*`: returns 403 (denied).

The **origin** Envoy is an upstream of the edge Envoy. It has a static configuration that features only direct responses, effectively acting as an HTTP origin server. There are two route rules (in order):

* `/blockedz`: returns 200 `hidden treasure`. It should never be possible for traffic on the Envoy edge server’s 10000 port to receive this response unless a qualifying vulnerability is present.

* `/*`: returns 200 `normal`.

---

## Submission & Eligibility Guidelines


For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
