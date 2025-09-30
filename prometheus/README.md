# Prometheus Server

This document provides the official target information and testing environment for the Prometheus Server target, part of the zeroday.cloud 2025 live hacking competition.

---

## Objective

The condition for scoring on this target is to achieve **Remote Code Execution (RCE)**. The exploit must be triggered remotely by attacking the service exposed on port **9090 (HTTP)**.

To prove Remote Code Execution, the exploit must execute the command `/flag.sh prometheus` on the target system.

---

## Local Testing Environment

For your convenience, we have provided a Docker Compose setup that replicates the official competition environment. An exploit that functions correctly against this local setup is highly likely to succeed during the live demonstration.

To build and launch the local target environment, execute the following command from your terminal:

```bash
docker compose up
```

---

## Submission & Eligibility Guidelines


For all inquiries and clarifications, please contact us at zerodaycloud@wiz.io
